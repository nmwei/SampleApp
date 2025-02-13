//
//  GTMediator.h
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/13.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GTDetailViewControllerProtocal <NSObject>
-(__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;
@end

@interface GTMediator : NSObject

//target action
+ (__kindof UIViewController *) detailViewControllerWithUrl:(NSString *) detailUrl;

//url scheme
typedef void(^GTMediatorProcessBlock)(NSDictionary *params);
+(void)registerScheme:(NSString *)scheme processBlock: (GTMediatorProcessBlock)processBlock;
+(void)openUrl:(NSString *)url params:(NSDictionary *)params;

//protocol class
+(void)registerProtol:(Protocol *)proto class:(Class)cls;
+(Class)classForProtol:(Protocol *)proto;

@end

NS_ASSUME_NONNULL_END
