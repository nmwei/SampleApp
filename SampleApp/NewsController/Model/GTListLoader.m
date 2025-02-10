//
//  GTListLoader.m
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/8.
//

#import "GTListLoader.h"
#import "AFNetworking.h"
#import "GTListItem.h"

@implementation GTListLoader

-(void) loadListDataWithFinishBlock:(GTListLoaderFinishBlock) finishBlock {
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
        
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
#warning 类型的检查
        NSArray *dataArray = [((NSDictionary *) [((NSDictionary *)jsonObj) objectForKey:@"result"]) objectForKey: @"data"];
        NSMutableArray *listItemArray = @[].mutableCopy;
        for (NSDictionary *info in dataArray) {
            GTListItem *listItem = [[GTListItem alloc] init];
            [listItem configWithDictionary:info];
            [listItemArray addObject:listItem];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(finishBlock) {
                finishBlock(error == nil, listItemArray.copy);
            }
        });
    }];

    //启动任务
    [dataTask resume];
    [self _getSanBoxPath];
}

-(void) _getSanBoxPath {
    //获取cache文件夹路径
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    //获取fileManager单例
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //生成GTData文件夹路径
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    
    NSError *createError;
    //创建GTData文件夹
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&createError];
    //生成list文件路径
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    //生成abc二进制数据
    NSData *listData = [@"abc" dataUsingEncoding:NSUTF8StringEncoding];
    //创建list文件
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    
    //查询文件
    BOOL fileExist = [fileManager fileExistsAtPath:listDataPath];
    //删除文件
    if(fileExist) {
        [fileManager removeItemAtPath:listDataPath error:nil];
    }
    
    NSLog(@"");
}

@end
