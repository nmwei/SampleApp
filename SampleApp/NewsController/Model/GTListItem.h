//
//  GTListItem.h
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/// 列表结构化数据
@interface GTListItem : NSObject <NSSecureCoding>

@property(nonatomic, copy, readwrite) NSString *category;
@property(nonatomic, copy, readwrite) NSString *picUrl;
@property(nonatomic, copy, readwrite) NSString *uniquekey;
@property(nonatomic, copy, readwrite) NSString *title;
@property(nonatomic, copy, readwrite) NSString *date;
@property(nonatomic, copy, readwrite) NSString *authorName;
@property(nonatomic, copy, readwrite) NSString *articleUrl;

- (void) configWithDictionary:(NSDictionary *) dictionary;

@end

NS_ASSUME_NONNULL_END
