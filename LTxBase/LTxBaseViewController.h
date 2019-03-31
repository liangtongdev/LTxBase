//
//  LTxBaseViewController.h
//  LTxBase
//
//  Created by liang tong on 2019/3/30.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "LTxBaseRefresh.h"//刷新
#import "LTxBaseEmptyDataSet.h"//空画面协议
NS_ASSUME_NONNULL_BEGIN

@interface LTxBaseViewController : UIViewController

#pragma mark - ActivityView
-(void)showAnimatingActivityView;
-(void)hideAnimatingActivityView;

#pragma mark - 刷新
//下拉刷新
-(void)addPullDownRefresh:(LTxCallbackBlock)pullDownRefresh
                   onView:(UIScrollView*)pullView;
-(void)addPullUpRefresh:(LTxCallbackBlock)pullUpRefresh
                 onView:(UIScrollView*)pullView;
//下拉刷新，上拉加载更多
-(void)addPullDownRefresh:(LTxCallbackBlock)pullDownRefresh
         andPullUpRefresh:(LTxCallbackBlock)pullUpRefresh
                   onView:(UIScrollView*)pullView;
@end

NS_ASSUME_NONNULL_END
