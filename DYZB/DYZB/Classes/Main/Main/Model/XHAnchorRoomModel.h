//
//  XHAnchorRoomModel.h
//  DYZB
//
//  Created by juxiaohui on 16/12/2.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHAnchorRoomModel : NSObject

/// 房间ID
@property(nonatomic, strong)NSNumber * room_id;
/// 房间名称
@property(nonatomic, copy)NSString * room_name;
/// 主播昵称
@property(nonatomic, copy)NSString * nickname;
/// 直播间图片
@property(nonatomic, copy)NSString * vertical_src;
/// 是否是手机直播 0电脑1手机
@property(nonatomic, assign)BOOL  isVertical;
/// 在线人数
@property(nonatomic, assign)NSInteger  online;
/// 所在城市
@property(nonatomic, copy)NSString * anchor_city;

@end
