//
//  XHCycleModel.h
//  DYZB
//
//  Created by juxiaohui on 16/12/5.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XHAnchorRoomModel;

@interface XHCycleModel : NSObject
/// 标题
@property(nonatomic, copy)NSString * title;
/// 图片地址
@property(nonatomic, copy)NSString * pic_url;
/// 房间信息
@property(nonatomic, strong)XHAnchorRoomModel * room;

@end
