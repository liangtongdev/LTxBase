//
//  UIApplication+LTxNetworkActivityIndicator.h
//  LTxCategories
//
//  Created by liangtong on 2018/9/4.
//

//  Created by Matt Zanchelli on 1/10/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//  https://github.com/mdznr/NetworkActivityIndicator


/**
 * 状态栏提示网络访问状态
 **/

#import <UIKit/UIKit.h>

@interface UIApplication (LTxNetworkActivityIndicator)

/*
 This category will automatically keep track of concurrent network activity and display the network activity indicator accordingly.
 */

/// Tell the application that network activity has begun. The network activity indicator will then be shown.
/// Display the network activity indicator to provide feedback when your application accesses the network for more than a couple of seconds. If the operation finishes sooner than that, you don’t have to show the network activity indicator, because the indicator would be likely to disappear before users notice its presence.
- (void)ltx_beganNetworkActivity;

/// Tell the application that a session of network activity has begun. The network activity indicator will remain showing or hide automatically depending the presence of other ongoing network activity in the app.
- (void)ltx_endedNetworkActivity;

@end
