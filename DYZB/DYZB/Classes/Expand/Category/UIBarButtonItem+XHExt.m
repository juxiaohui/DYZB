//
//  UIBarButtonItem+XHExt.m
//  DYZB
//
//  Created by juxiaohui on 16/11/25.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "UIBarButtonItem+XHExt.h"

@implementation UIBarButtonItem (XHExt)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage size:(CGSize)size target:(id)target action:(SEL)action{
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    
    if (size.width ==0 && size.height == 0) {
        [button sizeToFit];
    }else{
        button.frame = CGRectMake(0, 0, size.width, size.height);
    }
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc]initWithCustomView:button];
}
@end
