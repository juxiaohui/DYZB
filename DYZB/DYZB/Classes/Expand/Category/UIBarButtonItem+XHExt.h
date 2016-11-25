//
//  UIBarButtonItem+XHExt.h
//  DYZB
//
//  Created by juxiaohui on 16/11/25.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XHExt)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage size:(CGSize)size target:(id)target action:(SEL)action;


@end
