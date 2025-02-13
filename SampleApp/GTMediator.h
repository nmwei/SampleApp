//
//  GTMediator.h
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/13.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTMediator : NSObject

+ (__kindof UIViewController *) detailViewControllerWithUrl:(NSString *) detailUrl;

@end

NS_ASSUME_NONNULL_END
