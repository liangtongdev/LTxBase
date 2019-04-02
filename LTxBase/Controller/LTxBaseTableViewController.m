//
//  LTxBaseTableViewController.m
//  LTxBase
//
//  Created by liang tong on 2019/3/30.
//

#import "LTxBaseTableViewController.h"

@interface LTxBaseTableViewController ()
@property (nonatomic, copy) LTxCallbackBlock refreshAction;
@property(nonatomic, strong, readwrite) LTxBaseEmptyDataSet* emptyDataSet;
@end

@implementation LTxBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [LTxConfig sharedInstance].viewBackgroundColor;
    
    _emptyDataSet = [LTxBaseEmptyDataSet defaultDataSet];
    __weak __typeof(self) weakSelf = self;
    _emptyDataSet.emptyDataSetChangeCallback = ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadEmptyDataSet];
        });
    };
    
    self.tableView.emptyDataSetSource = _emptyDataSet;
    self.tableView.emptyDataSetDelegate = _emptyDataSet;
    [self.tableView reloadEmptyDataSet];
    
}
-(void)dealloc{
    self.emptyDataSet = nil;
}

#pragma mark - ActivityView
-(void)showAnimatingActivityView{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    });
}
-(void)hideAnimatingActivityView{
    MBProgressHUD* hud = [MBProgressHUD HUDForView:self.view];
    dispatch_async(dispatch_get_main_queue(), ^{
        [hud hideAnimated:YES];
    });
}

#pragma mark - 刷新
//下拉刷新
-(void)addPullDownRefresh:(LTxCallbackBlock)pullDownRefresh{
    self.refreshAction = pullDownRefresh;
    self.tableView.mj_header = [LTxBaseRefresh headerWithRefreshingBlock:pullDownRefresh];
    
}
-(void)addPullUpRefresh:(LTxCallbackBlock)pullUpRefresh{
    self.tableView.mj_footer = [LTxBaseRefresh footerWithRefreshingBlock:pullUpRefresh];
    
}
//下拉刷新，上拉加载更多
-(void)addPullDownRefresh:(LTxCallbackBlock)pullDownRefresh
         andPullUpRefresh:(LTxCallbackBlock)pullUpRefresh{
    self.refreshAction = pullDownRefresh;
    self.tableView.mj_header = [LTxBaseRefresh headerWithRefreshingBlock:pullDownRefresh];
    self.tableView.mj_footer = [LTxBaseRefresh footerWithRefreshingBlock:pullUpRefresh];
}

#pragma mark - Setter
-(void)setRefreshAction:(LTxCallbackBlock)refreshAction{
    _refreshAction = refreshAction;
    _emptyDataSet.refreshAction = refreshAction;
}

@end
