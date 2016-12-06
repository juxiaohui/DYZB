//
//  XHAnchorGroupModel.h
//  DYZB
//
//  Created by juxiaohui on 16/12/2.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XHAnchorRoomModel;

@interface XHAnchorGroupModel : NSObject
///  房间列表
@property(nonatomic, copy)NSArray <XHAnchorRoomModel *>* room_list;

@property(nonatomic, assign)BOOL  push_vertical_screen;
/// 图标
@property(nonatomic, copy)NSString * icon_url;
/// 组标题
@property(nonatomic, copy)NSString * tag_name;

@property(nonatomic, strong)NSNumber * tag_id;

@property(nonatomic, copy)NSString * defaultImage;

@end
