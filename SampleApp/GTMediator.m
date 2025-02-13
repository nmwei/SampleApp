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
    UIViewController *controller = [[detailCls alloc] performSelector:@selector(initWithUrlString:) withObject:detailUrl];
    
    return controller;
}

@end
