//
//  GTMediator.m
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/13.
//

#import "GTMediator.h"
#import "GTDetailViewController.h"

@implementation GTMediator

+ (__kindof UIViewController *) detailViewControllerWithUrl:(NSString *)detailUrl {
    GTDetailViewController *controller = [[GTDetailViewController alloc] initWithUrlString:detailUrl];
    return controller;
}

@end
