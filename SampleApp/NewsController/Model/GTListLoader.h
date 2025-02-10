//
//  GTListLoader.h
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/8.
//

#import <Foundation/Foundation.h>

@class GTListItem;
NS_ASSUME_NONNULL_BEGIN

typedef void(^GTListLoaderFinishBlock)(BOOL success, NSArray<GTListItem *> *dataArray);

/// 列表请求
@interface GTListLoader : NSObject

-(void) loadListDataWithFinishBlock:(GTListLoaderFinishBlock) finishBlock;

@end

NS_ASSUME_NONNULL_END
