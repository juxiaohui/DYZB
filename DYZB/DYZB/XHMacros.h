//
//  XHMacros.h
//  DYZB
//
//  Created by juxiaohui on 16/11/24.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#ifndef XHMacros_h
#define XHMacros_h

//**************调试和发布版本之间的设置*****************
#ifdef DEBUG //调试模式--模拟器

#define XHLog(...) NSLog(__VA_ARGS__)  //公司自定义打印

#else //发布模式 RELEASE--真机

#define XHLog(...)  //发布版本下取消自定义打印，自定义打印不起作用

#endif

#define SH  [UIScreen mainScreen].bounds.size.height

#define SW  [UIScreen mainScreen].bounds.size.width

#define ScreenWidth  (SH < SW ? SH : SW)

#define ScreenHeight (SH > SW ? SH : SW)

#define iOS(version) ([[UIDevice currentDevice].systemVersion doubleValue]>=(version))


#define XHImage(image) [UIImage imageNamed:image]

#define XHNormalFont(size) [UIFont systemFontOfSize:size]

#define XHBoldFont(size) [UIFont boldSystemFontOfSize:size]

#define XHRGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define XHRGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define XHGlobalColor  [UIColor colorWithRed:0.94f green:0.94f blue:0.94f alpha:1.00f];
#define XHRandomColor XHRGBColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

#define XHWeakSelf __weak typeof(self) weakSelf = self;

#define XHUserDefaults [NSUserDefaults standardUserDefaults]

#define XHLogFunc XHLog(@"%s", __FUNCTION__);


#endif /* XHMacros_h */
