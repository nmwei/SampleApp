//
//  GTNotification.m
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/17.
//

#import "GTNotification.h"
#import "UserNotifications/UserNotifications.h";


@interface GTNotification()

@end

@implementation GTNotification

+(GTNotification *) notificationManager{
    static GTNotification *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GTNotification alloc] init];
    });
    return manager;
}

-(void) checkNotificationAuthorization {
    [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:UNAuthorizationOptionBadge | UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError * _Nullable error) {
        NSLog(@"");
    }];
};

@end
