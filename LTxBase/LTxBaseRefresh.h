//
//  LTxBaseRefresh.h
//  DZNEmptyDataSet
//
//  Created by liang tong on 2019/3/31.
//

#import <Foundation/Foundation.h>
#import <MJRefresh/MJRefresh.h>
#import <LTxConfig/LTxConfig.h>
NS_ASSUME_NONNULL_BEGIN

/**
 * 下拉刷新/加载更多UI控件
 */

#pragma mark - Header
@interface LTxBaseMJRefreshHeader : MJRefreshGifHeader

@end

#pragma mark - Footer
@interface LTxBaseMJRefreshFooter : MJRefreshAutoGifFooter

@end


@interface LTxBaseRefresh : NSObject
+(LTxBaseMJRefreshHeader*)headerWithRefreshingBlock:(LTxCallbackBlock)pullDownRefresh;
+(LTxBaseMJRefreshFooter*)footerWithRefreshingBlock:(LTxCallbackBlock)pullUpRefresh;
@end

NS_ASSUME_NONNULL_END
