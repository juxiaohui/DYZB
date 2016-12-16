//
//  XHHomeMenuView.h
//  DYZB
//
//  Created by juxiaohui on 16/12/14.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XHAnchorGroupModel;

@interface XHHomeMenuView : UIView

@property(nonatomic, strong)NSMutableArray <XHAnchorGroupModel *>* anchorGroups;

@property(nonatomic, copy)NSString * tagName;


@end
