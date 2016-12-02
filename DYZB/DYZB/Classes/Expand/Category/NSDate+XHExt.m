//
//  NSDate+XHExt.m
//  DYZB
//
//  Created by juxiaohui on 16/12/2.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "NSDate+XHExt.h"

@implementation NSDate (XHExt)

+(NSString *)getCurrentTime{

    NSDate * newDate = [NSDate date];
    
    NSInteger  interval = [newDate timeIntervalSince1970];
    
    return [NSString stringWithFormat:@"%ld",interval];
}
@end
