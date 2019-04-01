//
//  LTxBaseViewController.h
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


//    /*导航栏透明，配合页面view的渲染起点使用*/
//    self.navigationController.navigationBar.translucent = YES;
//   /*
//    UIRectEdgeNone;       //从navigationBar下面开始计算一直到屏幕tabBar上部
//    UIRectEdgeAll;        //从屏幕边缘计算（默认）
//    UIRectEdgeTop;        //navigationBar下面开始计算一直到屏幕tabBar上部
//    UIRectEdgeBottom;     //从navigationBar下面开始计算一直到屏幕底部
//    */
//    self.edgesForExtendedLayout = UIRectEdgeNone;


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
