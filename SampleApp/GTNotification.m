//
//  GTNotification.m
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/17.
//

#import "UIKit/UIKit.h"
#import "GTNotification.h"
#import "UserNotifications/UserNotifications.h";


@interface GTNotification()<UNUserNotificationCenterDelegate>

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
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    [center requestAuthorizationWithOptions:UNAuthorizationOptionBadge | UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError * _Nullable error) {
        //触发一次本地推送
        if(granted) {
//            [self _pushLocalNotification];
            dispatch_async(dispatch_get_main_queue(), ^{
                [[UIApplication sharedApplication] registerForRemoteNotifications];
            });
        }
        
    }];
};

#pragma mark - 本地推送
-(void)_pushLocalNotification{
    //生成content
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.badge = @(1);
    content.title = @"极客时间";
    content.body = @"从0开发一款iOS App";
    
    //生成trigger
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:30.f repeats:NO];
    //生成request
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"__pushLocalNotification" content:content trigger:trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"");
    }];
}

#pragma mark -
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler{
    completionHandler(UNNotificationPresentationOptionAlert);
};

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler{
    //处理业务逻辑
    completionHandler();
};


@end
