//
//  GTScreen.m
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/12.
//

#import "GTScreen.h"

@implementation GTScreen

//iphone xs max
+(CGSize) sizeFor65Inch{
    return CGSizeMake(414, 896);
}

//iphone xr
+(CGSize)sizeFor61Inch{
    return CGSizeMake(414, 896);
}

//iphone x
+(CGSize)sizeFor58Inch{
    return CGSizeMake(375, 812);
}

@end
