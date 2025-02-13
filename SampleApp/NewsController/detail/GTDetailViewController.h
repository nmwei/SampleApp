//
//  GTDetailViewController.h
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/7.
//

#import <UIKit/UIKit.h>
#import "GTMediator.h"

NS_ASSUME_NONNULL_BEGIN


/// 文章底层页
@interface GTDetailViewController : UIViewController<GTDetailViewControllerProtocal>

- (instancetype) initWithUrlString:(NSString *) urlString;

-(UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

@end

NS_ASSUME_NONNULL_END
