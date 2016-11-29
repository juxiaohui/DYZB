//
//  XHPageContentView.h
//  DYZB
//
//  Created by juxiaohui on 16/11/25.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XHPageContentView;
@protocol XHPageContentViewDelegate <NSObject>

-(void)XHPageContentView:(XHPageContentView *)contentView scrollWithSourceIndex:(NSInteger)sourceIndex targetIndex:(NSInteger)targetIndex progress:(CGFloat)progress;

@end

@interface XHPageContentView : UIView

@property(nonatomic, copy)NSArray <UIViewController *> * childViewControllers;

@property(nonatomic, weak)UIViewController * parentViewController;

@property(nonatomic, assign)id <XHPageContentViewDelegate> delegate;

-(instancetype)initWithFrame:(CGRect)frame childViewControllers:(NSArray <UIViewController *>*)childViewControllers parentViewController :(UIViewController *) parentViewController;

-(void)setCurrentIndex:(NSInteger)index;

@end
