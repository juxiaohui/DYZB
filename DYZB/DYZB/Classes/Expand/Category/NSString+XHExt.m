//
//  NSString+XHExt.m
//  DYZB
//
//  Created by juxiaohui on 16/12/6.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "NSString+XHExt.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>

@implementation NSString (XHExt)

- (NSString *)xh_md5String
{
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(string, length, bytes);
    return [self xh_stringFromBytes:bytes length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)xh_stringFromBytes:(unsigned char *)bytes length:(int)length
{
    NSMutableString *mutableString = @"".mutableCopy;
    for (int i = 0; i < length; i++)
        [mutableString appendFormat:@"%02x", bytes[i]];
    return [NSString stringWithString:mutableString];
}

@end
