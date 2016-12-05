//
//  UIView+XHExt.m
//  DYZB
//
//  Created by juxiaohui on 16/11/25.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "UIView+XHExt.h"

@implementation UIView (XHExt)

-(CGFloat)xh_x{
    
    return self.frame.origin.x;
}

-(void)setXh_x:(CGFloat)xh_x{
    
    CGRect frame = self.frame;
    
    frame.origin.x=xh_x;
    
    self.frame=frame;
    
}

-(CGFloat)xh_y{
    
    return self.frame.origin.y;
}

-(void)setXh_y:(CGFloat)xh_y{
    
    CGRect frame = self.frame;
    
    frame.origin.y=xh_y;
    
    self.frame=frame;
    
}

-(CGFloat)xh_width{
    
    return self.frame.size.width;
}

-(void)setXh_width:(CGFloat)xh_width{
    
    CGRect frame = self.frame;
    
    frame.size.width = xh_width;
    
    self.frame = frame;
}

-(CGFloat)xh_height{
    
    return self.frame.size.height;
}

-(void)setXh_height:(CGFloat)xh_height{
    
    CGRect frame = self.frame;
    
    frame.size.height = xh_height;
    
    self.frame = frame;
}

-(void)setXh_centerX:(CGFloat)xh_centerX{
    
    CGPoint center = self.center;
    
    center.x = xh_centerX;
    
    self.center = center;
    
}

-(CGFloat)xh_centerX{
    
    return self.center.x;
}

-(void)setXh_centerY:(CGFloat)xh_centerY{
    
    CGPoint center = self.center;
    
    center.y = xh_centerY;
    
    self.center = center;
    
}

-(CGFloat)xh_centerY{
    
    return self.center.y;
    
}

-(void)setXh_right:(CGFloat)xh_right{
    
    self.xh_x = xh_right - self.xh_width;
    
}

-(CGFloat)xh_right{
    
    return CGRectGetMaxX(self.frame);
    
}

-(void)setXh_bottom:(CGFloat)xh_bottom{
    
    self.xh_y = xh_bottom - self.xh_height;
    
}
-(CGFloat)xh_bottom{
    
    return CGRectGetMaxY(self.frame);
}

+ (instancetype)viewFromXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}


@end
