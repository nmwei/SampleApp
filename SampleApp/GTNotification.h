//
//  GTNotification.h
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// APP 推送管理
@interface GTNotification : NSObject

+(GTNotification *) notificationManager;

-(void) checkNotificationAuthorization;

@end

NS_ASSUME_NONNULL_END
