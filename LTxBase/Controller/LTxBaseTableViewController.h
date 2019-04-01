//
//  LTxBaseTableViewController.h
//  LTxBase
//
//  Created by liang tong on 2019/3/30.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <LTxCategories/LTxCategories.h>
#import "LTxBaseRefresh.h"//刷新
#import "LTxBaseEmptyDataSet.h"//空画面协议
NS_ASSUME_NONNULL_BEGIN

@interface LTxBaseTableViewController : UITableViewController
#pragma mark - 空画面
@property(nonatomic, strong, readonly) LTxBaseEmptyDataSet* emptyDataSet;

#pragma mark - ActivityView
-(void)showAnimatingActivityView;
-(void)hideAnimatingActivityView;


#pragma mark - 刷新
//下拉刷新
-(void)addPullDownRefresh:(LTxCallbackBlock)pullDownRefresh;
//上拉加载更多
-(void)addPullUpRefresh:(LTxCallbackBlock)pullUpRefresh;
//下拉刷新，上拉加载更多
-(void)addPullDownRefresh:(LTxCallbackBlock)pullDownRefresh
         andPullUpRefresh:(LTxCallbackBlock)pullUpRefresh;

@end

NS_ASSUME_NONNULL_END
