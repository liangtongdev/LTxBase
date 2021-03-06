//
//  UIButton+LTxImagePosition.h
//  LTxCategories
//
//  Created by liangtong on 2018/9/5.
//

//  Created by luxiaoming on 16/1/15.
//  Copyright © 2016年 luxiaoming. All rights reserved.
//
//https://github.com/Phelthas/Demo_ButtonImageTitleEdgeInsets
// 用button的titleEdgeInsets和 imageEdgeInsets属性来实现button文字图片上下或者左右排列的

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LTxImagePosition) {
    LTxImagePositionLeft = 0,              //图片在左，文字在右，默认
    LTxImagePositionRight = 1,             //图片在右，文字在左
    LTxImagePositionTop = 2,               //图片在上，文字在下
    LTxImagePositionBottom = 3,            //图片在下，文字在上
};


@interface UIButton (LTxImagePosition)
/**
 *  利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 *  注意：这个方法需要在设置图片和文字之后才可以调用，且button的大小要大于 图片大小+文字大小+spacing
 *
 *  @param spacing 图片和文字的间隔
 */
- (void)ltx_setImagePosition:(LTxImagePosition)postion spacing:(CGFloat)spacing;
@end
