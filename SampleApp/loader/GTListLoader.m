//
//  GTListLoader.m
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/8.
//

#import "GTListLoader.h"
#import "AFNetworking.h"

@implementation GTListLoader

-(void) loadListData {
    NSString *urlString = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";
    
//    [[AFHTTPSessionManager manager]GET:urlString parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"");
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"");
//    }];
    
    // 创建url
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
