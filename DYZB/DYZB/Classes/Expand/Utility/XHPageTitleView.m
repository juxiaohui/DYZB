//
//  XHPageTitleView.m
//  DYZB
//
//  Created by juxiaohui on 16/11/25.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHPageTitleView.h"

static CGFloat const scrollLineH = 2;

@interface XHPageTitleView ()

@property(nonatomic, strong)UIScrollView * scrollView;

@property(nonatomic, strong)UIView * scrollLine;

@property(nonatomic, strong)NSMutableArray <UILabel *>* titleLabels;

@property(nonatomic, assign)NSInteger  curentIndex;

//@property(nonatomic, assign)<#name#>  <#name#>;

@end

@implementation XHPageTitleView
-(NSMutableArray<UILabel *> *)titleLabels{
    if (!_titleLabels) {
        _titleLabels = [NSMutableArray array];
    }
    return _titleLabels;
}
-(UIView *)scrollLine{
    if (!_scrollLine) {
        UIView * scrollLine = [[UIView alloc]init];
        scrollLine.backgroundColor = [UIColor orangeColor];
        _scrollLine = scrollLine;
    }
    return _scrollLine;
}

-(UIScrollView *)scrollView{

    if (!_scrollView) {
        UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.scrollsToTop = NO;
        scrollView.bounces = NO;
        scrollView.pagingEnabled = NO;
        _scrollView = scrollView;
    }
    return _scrollView;
}

-(void)setTitles:(NSArray<NSString *> *)titles{
    
    _titles = titles;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray<NSString *> *)titles{
    
    if (self = [super initWithFrame:frame]) {
        _titles = titles;
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    [self addSubview:self.scrollView];
    [self setupTitles];
    [self setupScrollLineAndBottomLine];
}


-(void)setupTitles{
    
    CGFloat y = 0;
    CGFloat w = self.xh_width / self.titles.count;
    CGFloat h = self.xh_height - scrollLineH;
    [self.titles enumerateObjectsUsingBlock:^(NSString * _Nonnull title, NSUInteger index, BOOL * _Nonnull stop) {
        
        UILabel * label = [[UILabel alloc]init];
        label.text = title;
        label.tag = index;
        label.font = XHNormalFont(16);
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = XHRGBColor(85, 85, 85);
        CGFloat x = index *  w;
        label.frame = CGRectMake(x, y, w, h);
        [self.scrollView addSubview:label];
        [self.titleLabels addObject:label];
        
        label.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelClick:)];
        [label addGestureRecognizer:tap];
    }];
}

-(void)setupScrollLineAndBottomLine{
    
    UIView * bottomLine = [[UIView alloc]init];
    bottomLine.backgroundColor = [UIColor lightGrayColor];
    CGFloat lineH = 0.5;
    bottomLine.frame = CGRectMake(0, self.xh_height-lineH, self.xh_width, lineH);
    [self addSubview:bottomLine];
    
    [self.scrollView addSubview:self.scrollLine];
    
    UILabel * label = self.titleLabels.firstObject;
    label.textColor = XHRGBColor(255, 128, 0);
    self.scrollLine.frame = CGRectMake(label.xh_x, self.xh_height - scrollLineH, label.xh_width, scrollLineH);
}


#pragma mark - LabelClick

-(void)labelClick:(UITapGestureRecognizer *)gesture{
    
    UILabel * currentLabel = (UILabel *) gesture.view;
    UILabel * olderLabel = self.titleLabels[self.curentIndex];
    if (currentLabel == olderLabel) { return;}
    
    currentLabel.textColor = XHRGBColor(255, 128, 0);
    olderLabel.textColor = XHRGBColor(85, 85, 85);
    
    CGFloat scrollLineX = currentLabel.tag * self.scrollLine.xh_width;
    
    [UIView animateWithDuration:0.15 animations:^{
        self.scrollLine.xh_x = scrollLineX;
    } completion:^(BOOL finished) {
        
    }];
    self.curentIndex = currentLabel.tag;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(XHPageTitleView:selectedIndex:)]) {
        [self.delegate XHPageTitleView:self selectedIndex:self.curentIndex];
    }
}



-(void)setTitleViewWithSourceIndex:(NSInteger)sourceIndex targetIndex:(NSInteger)targetIndex progress:(CGFloat)progress{
    
    UILabel * sourceLabel = self.titleLabels[sourceIndex];
    UILabel * targetLabel = self.titleLabels[targetIndex];
    
    CGFloat moveTotalX = targetLabel.xh_x - sourceLabel.xh_x;
    CGFloat moveX = moveTotalX * progress;
    self.scrollLine.xh_x = sourceLabel.xh_x + moveX;
    
    //颜色渐变
    //变化范围
    
    CGFloat rDelta = 255 - 85 ;
    CGFloat gDelta = 128 - 85 ;
    CGFloat bDelta = 0 - 85 ;
    
    sourceLabel.textColor = XHRGBColor(255 - rDelta * progress, 128 - gDelta * progress, 0 - bDelta * progress);
    
    targetLabel.textColor = XHRGBColor(85 + rDelta * progress, 85 + gDelta * progress, 85 + bDelta * progress);
    
    self.curentIndex = targetIndex;
}


@end
