//
//  XHRecommendViewModel.m
//  DYZB
//
//  Created by juxiaohui on 16/12/2.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHRecommendViewModel.h"
#import "NSDate+XHExt.h"
#import "XHAnchorGroupModel.h"
#import "XHAnchorRoomModel.h"
#import "XHCycleModel.h"
#import "NSString+XHExt.h"

@interface XHRecommendViewModel ()

@property(nonatomic, strong)XHAnchorGroupModel *  hotGroup;
@property(nonatomic, strong)XHAnchorGroupModel *  prettyGroup;

@end

@implementation XHRecommendViewModel

-(NSMutableArray<XHAnchorGroupModel *> *)anchorGroups{
    if (!_anchorGroups) {
        _anchorGroups = [NSMutableArray array];
    }
    return _anchorGroups;
}

-(NSMutableArray<XHCycleModel *> *)cycleDatas{
    if (!_cycleDatas) {
        _cycleDatas = [NSMutableArray array];
    }
    return _cycleDatas;
}

-(void)requestCycleDataWith:(requestResultBlock)resultBlock{
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"version"] = @2.410;
    [CBNetworking requestWithUrl:@"http://www.douyutv.com/api/v1/slide/6" params:params useCache:NO httpMedthod:CBGETRequest progressBlock:nil successBlock:^(id response) {
        if ([response[error] integerValue] == 0) {
            self.cycleDatas = [XHCycleModel mj_objectArrayWithKeyValuesArray:response[data]];
            resultBlock ? resultBlock(YES) : nil;
        }
    } failBlock:^(NSError *error) {
        
    }];
}


-(void)requestDataWith:(requestResultBlock)resultBlock{
    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"limit"] = @4;
    params[@"offset"] = @0;
    params[@"time"] = [NSDate getCurrentTime];
    
    XHLog(@"%@",[NSDate getCurrentTime]);
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);

    [CBNetworking requestWithUrl:@"http://capi.douyucdn.cn/api/v1/getbigDataRoom" params:params useCache:NO httpMedthod:CBGETRequest progressBlock:nil successBlock:^(id response) {
        if ([response[error] integerValue] == 0) {
            self.hotGroup = [[XHAnchorGroupModel alloc]init];
            self.hotGroup.tag_name = @"热门";
            self.hotGroup.defaultImage = @"home_header_hot";
            NSMutableArray * anchors = [XHAnchorRoomModel mj_objectArrayWithKeyValuesArray:response[data]];
            self.hotGroup.room_list = anchors;
            dispatch_group_leave(group);
        }
        
    } failBlock:^(NSError *error) {
        
    }];
    
    
    //4.请求第二部分颜值数据
    dispatch_group_enter(group);
    [CBNetworking requestWithUrl:@"http://capi.douyucdn.cn/api/v1/getVerticalRoom" params:params useCache:NO httpMedthod:CBGETRequest progressBlock:nil successBlock:^(id response) {
        
        if ([response[error] integerValue] == 0) {
            self.prettyGroup = [[XHAnchorGroupModel alloc]init];
            self.prettyGroup.tag_name = @"颜值";
            self.prettyGroup.defaultImage = @"columnYanzhiIcon";
            NSMutableArray * anchors = [XHAnchorRoomModel mj_objectArrayWithKeyValuesArray:response[data]];
            self.prettyGroup.room_list = anchors;
            dispatch_group_leave(group);
        }
        
    } failBlock:^(NSError *error) {
        
    }];
    
    // 5.请求2-12部分游戏数据
    dispatch_group_enter(group);
    [CBNetworking requestWithUrl:@"http://capi.douyucdn.cn/api/v1/getHotCate" params:params useCache:NO httpMedthod:CBGETRequest progressBlock:nil successBlock:^(id response) {
        if ([response[error] integerValue] == 0) {
            self.anchorGroups = [XHAnchorGroupModel mj_objectArrayWithKeyValuesArray:response[data]];
            [self.anchorGroups removeObjectAtIndex:1];
            dispatch_group_leave(group);
        }
    } failBlock:^(NSError *error) {
        
    }];
    
    // 6.所有的数据都请求到,之后进行排序
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [self.anchorGroups insertObject:self.hotGroup atIndex:0];
        [self.anchorGroups insertObject:self.prettyGroup atIndex:1];
        resultBlock ? resultBlock(YES) : nil;
    });
}

-(void)requestOtherTagDataWith:(NSString *)title handle:(requestResultBlock)resultBlock{

    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"identification"] = title.xh_md5String;
    params[@"client_sys"] = @"ios";
    
    [CBNetworking requestWithUrl:@"http://capi.douyucdn.cn/api/homeCate/getHotRoom" params:params useCache:NO httpMedthod:CBGETRequest progressBlock:nil successBlock:^(id response) {
        if ([response[error] integerValue] == 0) {
            self.anchorGroups = [XHAnchorGroupModel mj_objectArrayWithKeyValuesArray:response[data]];
            self.anchorGroups.firstObject.defaultImage = @"home_header_hot";
             resultBlock ? resultBlock(YES) : nil;
        }
    } failBlock:^(NSError *error) {
        
    }];
}


@end
