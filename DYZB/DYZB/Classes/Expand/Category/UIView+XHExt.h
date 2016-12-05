//
//  UIView+XHExt.h
//  DYZB
//
//  Created by juxiaohui on 16/11/25.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XHExt)

@property (nonatomic, assign) CGFloat xh_x;

@property (nonatomic, assign) CGFloat xh_y;

@property (nonatomic, assign) CGFloat xh_width;

@property (nonatomic, assign) CGFloat xh_height;

@property (nonatomic, assign) CGFloat xh_centerX;

@property (nonatomic, assign) CGFloat xh_centerY;

@property (nonatomic, assign) CGFloat xh_right;

@property (nonatomic, assign) CGFloat xh_bottom;

+ (instancetype)viewFromXib;

@end
