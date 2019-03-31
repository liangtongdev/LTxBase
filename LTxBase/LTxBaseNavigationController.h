//
//  LTxBaseNavigationController.h
//  LTxCategories
//
//  Created by liang tong on 2019/3/30.
//

#import <UIKit/UIKit.h>
#import <LTxConfig/LTxConfig.h>

NS_ASSUME_NONNULL_BEGIN

/***
 * 默认设置如下
 * （1）导航栏不透明，如需要透明，可自行修改其navigationBar.translucent
 * （2）返回按钮
 * （3）手势右滑返回
 * （4）状态栏 UIStatusBarStyleLightContent
 *
 ***/
@interface LTxBaseNavigationController : UINavigationController

@end

NS_ASSUME_NONNULL_END
