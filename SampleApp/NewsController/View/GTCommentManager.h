//
//  GTCommentManager.h
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTCommentManager : NSObject

+(GTCommentManager *)shareManager;

-(void) showCommentView;

@end

NS_ASSUME_NONNULL_END
