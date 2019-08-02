//
//  LTxBaseNavigationController.m
//  LTxCategories
//
//  Created by liang tong on 2019/3/30.
//

#import "LTxBaseNavigationController.h"

@interface LTxBaseNavigationController ()

@end

@implementation LTxBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupDefaultLTxBaseNavigationController];
}

-(void)setupDefaultLTxBaseNavigationController{
    //不透明
    self.navigationBar.translucent = false;
    //右滑返回
    self.interactivePopGestureRecognizer.delegate = nil;
}

/* 重写PUSH方法，以添加返回按钮 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([self.viewControllers count] > 0) {
        UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
        [backBtn addTarget:self action:@selector(ltx_backAction) forControlEvents:UIControlEventTouchUpInside];
        [backBtn setImage:LTxImageWithName(@"ic_navi_back") forState:UIControlStateNormal];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    }
    
    [super pushViewController:viewController animated:true];
}
/*导航栏返回*/
-(void)ltx_backAction{
    [self popViewControllerAnimated:true];
}

/*状态栏*/
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
