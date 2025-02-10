//
//  GTListItem.m
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/10.
//

#import "GTListItem.h"

@implementation GTListItem

# pragma mark - NSSecturCooding 协议
- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.category forKey:@"category"];
    [coder encodeObject:self.picUrl forKey:@"picUrl"];
    [coder encodeObject:self.uniquekey forKey:@"uniquekey"];
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.date forKey:@"date"];
    [coder encodeObject:self.authorName forKey:@"authorName"];
    [coder encodeObject:self.articleUrl forKey:@"articleUrl"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if(self) {
        self.category = [coder decodeObjectForKey:@"category"];
        self.picUrl = [coder decodeObjectForKey:@"picUrl"];
        self.uniquekey = [coder decodeObjectForKey:@"uniquekey"];
        self.title = [coder decodeObjectForKey:@"title"];
        self.date = [coder decodeObjectForKey:@"date"];
        self.authorName = [coder decodeObjectForKey:@"authorName"];
        self.articleUrl = [coder decodeObjectForKey:@"articleUrl"];
    }
    
    return self;
}

+(BOOL) supportsSecureCoding {
    return YES;
}

# pragma mark - public method

- (void) configWithDictionary:(NSDictionary *) dictionary {
# warning 类型是否匹配
    self.category = [dictionary objectForKey:@"category"];
    self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];
    self.uniquekey = [dictionary objectForKey:@"uniquekey"];
    self.title = [dictionary objectForKey:@"title"];
    self.date = [dictionary objectForKey:@"date"];
    self.authorName = [dictionary objectForKey:@"author_name"];
    self.articleUrl = [dictionary objectForKey:@"url"];
};

@end
