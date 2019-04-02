//
//  LTxBaseEmptyDataSet.h
//  DZNEmptyDataSet
//
//  Created by liang tong on 2019/3/31.
//

#import <Foundation/Foundation.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
#import <LTxConfig/LTxConfig.h>
NS_ASSUME_NONNULL_BEGIN

@interface LTxBaseEmptyDataSet : NSObject<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

//初始化
+(LTxBaseEmptyDataSet*)defaultDataSet;

//图片
@property (nonatomic, assign) BOOL errorOccurred;
@property (nonatomic, strong, nullable) UIImage* emptyImage;
//标题
@property (nonatomic, copy, nullable) NSAttributedString* attributedTitle;
//描述
@property (nonatomic, copy, nullable) NSString* emptyDescription;
@property (nonatomic, copy, nullable) NSAttributedString* attributedEmptyDescription;

//点击空画面的回调
@property (nonatomic, copy) LTxCallbackBlock refreshAction;
@property (nonatomic, copy) LTxCallbackBlock emptyDataSetChangeCallback;
@end

NS_ASSUME_NONNULL_END
