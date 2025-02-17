//
//  GTLocation.m
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/14.
//

#import "GTLocation.h"
#import "CoreLocation/CoreLocation.h"


@interface GTLocation()<CLLocationManagerDelegate>
@property(nonatomic, strong, readwrite) CLLocationManager *manager;

@end

@implementation GTLocation

+(GTLocation *) locationManager{
    static GTLocation *location;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        location = [[GTLocation alloc] init];
    });
    return location;
}

-(instancetype) init {
    self = [super init];
    if(self) {
        self.manager = [[CLLocationManager alloc] init];
        self.manager.delegate = self;
    }
    return self;
}

-(void) checkLocationAuthorization{
    
    // 判断app是否开启：隐私 - 定位服务
    if(![CLLocationManager locationServicesEnabled]) {
        // 引导弹窗
    }
    
    if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        [self.manager requestWhenInUseAuthorization];
    }
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if(status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        //监听状态变成允许
    } else if(status == kCLAuthorizationStatusDenied) {
        // 监听拒绝定位
    }
};

@end
