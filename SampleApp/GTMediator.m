//
//  GTMediator.m
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/13.
//

#import "GTMediator.h"
// #import "GTDetailViewController.h"

@implementation GTMediator

+ (__kindof UIViewController *) detailViewControllerWithUrl:(NSString *)detailUrl {
    
    Class detailCls = NSClassFromString(@"GTDetailViewController");
    
    // GTDetailViewController *controller = [[GTDetailViewController alloc] initWithUrlString:detailUrl];
    UIViewController *controller = [[detailCls alloc] performSelector:NSSelectorFromString(@"initWithUrlString:") withObject:detailUrl];
    
    return controller;
}

#pragma mark - URL Scheme

+(NSMutableDictionary *) mediatorCache{
    static NSMutableDictionary *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = @{}.mutableCopy;
    });
    return cache;
}
+(void)registerScheme:(NSString *)scheme processBlock: (GTMediatorProcessBlock)processBlock {
    if(scheme && processBlock) {
        [[[self class] mediatorCache] setObject:processBlock forKey:scheme];
    }
}

+(void)openUrl:(NSString *)url params:(NSDictionary *)params{
    GTMediatorProcessBlock block = [[[self class] mediatorCache] objectForKey:url];
    if(block) {
        block(params);
    }
}

+(void)registerProtol:(Protocol *)proto class:(Class)cls{
    if(proto && cls) {
        [[[self class] mediatorCache]setObject:cls forKey:NSStringFromProtocol(proto)];
    }
}
+(Class)classForProtol:(Protocol *)proto{
    return [[[self class] mediatorCache] objectForKey:NSStringFromProtocol(proto)];
};

@end
