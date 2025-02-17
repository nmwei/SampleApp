//
//  GTLocation.h
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTLocation : NSObject

-(void) checkLocationAuthorization;

+(GTLocation *) locationManager;

@end

NS_ASSUME_NONNULL_END
