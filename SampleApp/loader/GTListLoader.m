//
//  GTListLoader.m
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/8.
//

#import "GTListLoader.h"

@implementation GTListLoader

-(void) loadListData {
    NSString *urlString = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";
    NSURL *listURL = [NSURL URLWithString:urlString];
    
    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    
}

@end
