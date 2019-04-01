//
//  LTxBaseViewController.m
//  LTxBase
//
//  Created by liang tong on 2019/3/30.
//

#import "LTxBaseViewController.h"

@interface LTxBaseViewController ()

@end

@implementation LTxBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [LTxConfig sharedInstance].viewBackgroundColor;
}

#pragma mark - ActivityView
-(void)showAnimatingActivityView{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    });
}
-(void)hideAnimatingActivityView{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        MBProgressHUD* hud = [MBProgressHUD HUDForView:self.view];
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
    });
}

#pragma mark - 刷新
//下拉刷新
-(void)addPullDownRefresh:(LTxCallbackBlock)pullDownRefresh
                   onView:(UIScrollView*)pullView{
    pullView.mj_header = [LTxBaseRefresh headerWithRefreshingBlock:pullDownRefresh];
    
    
}
-(void)addPullUpRefresh:(LTxCallbackBlock)pullUpRefresh
                 onView:(UIScrollView*)pullView{
    pullView.mj_footer = [LTxBaseRefresh footerWithRefreshingBlock:pullUpRefresh];
    
}
-(void)addPullDownRefresh:(LTxCallbackBlock)pullDownRefresh
         andPullUpRefresh:(LTxCallbackBlock)pullUpRefresh
                   onView:(UIScrollView*)pullView{
    pullView.mj_header = [LTxBaseRefresh headerWithRefreshingBlock:pullDownRefresh];
    pullView.mj_footer = [LTxBaseRefresh footerWithRefreshingBlock:pullUpRefresh];
}

@end
