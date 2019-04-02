//
//  LTxBaseRefresh.m
//  DZNEmptyDataSet
//
//  Created by liang tong on 2019/3/31.
//

#import "LTxBaseRefresh.h"

#pragma mark - Header
@implementation LTxBaseMJRefreshHeader

- (void)prepare{
    [super prepare];
    
    NSArray* refreshHeaderImages = [LTxConfig sharedInstance].refreshHeaderImages;
    if (!refreshHeaderImages || [refreshHeaderImages count] == 0) {
        return;
    }
    
    //普通状态
    NSString* firstImage = refreshHeaderImages.firstObject;
    NSString* bundlePath = [NSString stringWithFormat:@"LT.bundle/Loading/%@",firstImage];
    [self setImages:[NSArray arrayWithObject:[UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:bundlePath ofType:@"png"]]]
           forState:MJRefreshStateIdle];
    [self setImages:[NSArray arrayWithObject:[UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:bundlePath ofType:@"png"]]]
           forState:MJRefreshStatePulling];
    
    //刷新状态
    NSMutableArray *refreshingImages = [[NSMutableArray alloc] init];
    for (NSString* imageName in refreshHeaderImages){
        NSString* resourcePath = [NSString stringWithFormat:@"LT.bundle/Loading/%@",imageName];
        UIImage *image = [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:resourcePath ofType:@"png"]];
        if(image){
            [refreshingImages addObject:image];
        }
    }
    [self setImages:refreshingImages
           duration:1.f
           forState:MJRefreshStateRefreshing];
}
@end

#pragma mark - Footer
@implementation LTxBaseMJRefreshFooter

- (void)prepare{
    [super prepare];
    
    
    NSArray* refreshFooterImages = [LTxConfig sharedInstance].refreshFooterImages;
    if (!refreshFooterImages || [refreshFooterImages count] == 0) {
        return;
    }
    
    //普通状态
    NSString* firstImage = refreshFooterImages.firstObject;
    NSString* bundlePath = [NSString stringWithFormat:@"LT.bundle/Loading/%@",firstImage];
    [self setImages:[NSArray arrayWithObject:[UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:bundlePath ofType:@"png"]]]
           forState:MJRefreshStateIdle];
    [self setImages:[NSArray arrayWithObject:[UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:bundlePath ofType:@"png"]]]
           forState:MJRefreshStatePulling];
    
    //刷新状态
    NSMutableArray *refreshingImages = [[NSMutableArray alloc] init];
    for (NSString* imageName in refreshFooterImages){
        NSString* resourcePath = [NSString stringWithFormat:@"LT.bundle/Loading/%@",imageName];
        UIImage *image = [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:resourcePath ofType:@"png"]];
        if(image){
            [refreshingImages addObject:image];
        }
    }
    [self setImages:refreshingImages
           duration:1.f
           forState:MJRefreshStateRefreshing];
}

@end

@implementation LTxBaseRefresh
+(LTxBaseMJRefreshHeader*)headerWithRefreshingBlock:(LTxCallbackBlock)pullDownRefresh{
    LTxBaseMJRefreshHeader *header = [LTxBaseMJRefreshHeader headerWithRefreshingBlock:^{
        if(pullDownRefresh){//加载数据
            pullDownRefresh();
        }
    }];
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    header.automaticallyChangeAlpha = YES;
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.textColor = [UIColor lightGrayColor];
    // 设置文字
    [header setTitle:LTxLocalizedString(@"text_cmn_refresh_pull_down_idle") forState:MJRefreshStateIdle];
    [header setTitle:LTxLocalizedString(@"text_cmn_refresh_pull_down_pulling") forState:MJRefreshStatePulling];
    [header setTitle:LTxLocalizedString(@"text_cmn_refresh_pull_down_refreshing") forState:MJRefreshStateRefreshing];
    return header;
}
+(LTxBaseMJRefreshFooter*)footerWithRefreshingBlock:(LTxCallbackBlock)pullUpRefresh{
    LTxBaseMJRefreshFooter *footer = [LTxBaseMJRefreshFooter footerWithRefreshingBlock:^{
        if(pullUpRefresh){//加载数据
            pullUpRefresh();
        }
    }];
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    footer.automaticallyChangeAlpha = YES;
    footer.stateLabel.textColor = [UIColor lightGrayColor];
    // 设置文字
    [footer setTitle:LTxLocalizedString(@"text_cmn_refresh_pull_up_idle") forState:MJRefreshStateIdle];
    [footer setTitle:LTxLocalizedString(@"text_cmn_refresh_pull_up_pulling") forState:MJRefreshStatePulling];
    [footer setTitle:LTxLocalizedString(@"text_cmn_refresh_pull_up_refreshing") forState:MJRefreshStateRefreshing];
    [footer setTitle:LTxLocalizedString(@"text_cmn_refresh_pull_up_no_more") forState:MJRefreshStateNoMoreData];
    return footer;
}
@end
