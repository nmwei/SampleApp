//
//  GTListLoader.m
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/8.
//

#import "GTListLoader.h"

@implementation GTListLoader

-(void) loadListData {
    //创建url
    NSString *urlString = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";
    NSURL *listURL = [NSURL URLWithString:urlString];
    
    //创建session
    NSURLSession *session = [NSURLSession sharedSession]; //使用默认session
    
    //创建sessionDataTask
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"");
    }];
    
    //启动任务
    [dataTask resume];
}

@end
