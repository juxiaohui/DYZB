//
//  XHRecommendViewModel.h
//  DYZB
//
//  Created by juxiaohui on 16/12/2.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XHAnchorGroupModel,XHCycleModel;

typedef void(^requestResultBlock)(BOOL success);

@interface XHRecommendViewModel : NSObject

@property(nonatomic, strong)NSMutableArray <XHAnchorGroupModel *>* anchorGroups;

@property(nonatomic, strong)NSMutableArray <XHCycleModel *>* cycleDatas;


-(void)requestDataWith:(requestResultBlock)resultBlock;

-(void)requestCycleDataWith:(requestResultBlock)resultBlock;

-(void)requestOtherTagDataWith:(NSString *)title handle:(requestResultBlock)resultBlock;


@end
