//
//  XHPageTitleView.h
//  DYZB
//
//  Created by juxiaohui on 16/11/25.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XHPageTitleView;

@protocol XHPageTitleViewDelegate <NSObject>

-(void)XHPageTitleView:(XHPageTitleView *)titleView selectedIndex:(NSInteger)index;

@end

@interface XHPageTitleView : UIView

-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray <NSString *> *)titles;

@property(nonatomic, copy)NSArray <NSString *>* titles;

@property(nonatomic, assign)id <XHPageTitleViewDelegate> delegate;

-(void)setTitleViewWithSourceIndex:(NSInteger)sourceIndex targetIndex:(NSInteger)targetIndex progress:(CGFloat)progress;

@end
