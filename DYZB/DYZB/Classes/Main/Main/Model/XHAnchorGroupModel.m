//
//  XHAnchorGroupModel.m
//  DYZB
//
//  Created by juxiaohui on 16/12/2.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHAnchorGroupModel.h"

@implementation XHAnchorGroupModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"room_list" :    @"XHAnchorRoomModel",
             };
}

-(NSString *)defaultImage{
    if (!_defaultImage) {
        _defaultImage = @"home_header_normal";
    }
    return _defaultImage;
}
@end
