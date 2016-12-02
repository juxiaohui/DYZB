//
//  XHRecommendViewModel.h
//  DYZB
//
//  Created by juxiaohui on 16/12/2.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XHAnchorGroupModel;

typedef void(^requestResultBlock)(BOOL success);

@interface XHRecommendViewModel : NSObject

@property(nonatomic, strong)NSMutableArray <XHAnchorGroupModel *>* anchorGroups;


-(void)requestDataWith:(requestResultBlock)resultBlock;

@end
