//
//  XHLoadingAnimationView.m
//  DYZB
//
//  Created by juxiaohui on 16/12/19.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHLoadingAnimationView.h"

@interface XHLoadingAnimationView ()

@property(nonatomic, weak)UIImageView * imageView;

@property(nonatomic, strong)NSMutableArray * imageArray;

@property(nonatomic, weak)UILabel * textLabel;

@end

@implementation XHLoadingAnimationView

- (NSMutableArray *)imageArray {
    if (!_imageArray) {
        _imageArray = [NSMutableArray new];
        for (NSInteger i = 1; i < 5; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"img_loading_%ld",i]];
            [_imageArray addObject:image];
        }
    }
    return _imageArray;
}
- (UIImageView *)imageView {
    if (!_imageView) {
        UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"img_loading_1"]];
        imageView.animationDuration = 1.0;
        imageView.animationRepeatCount = 0;
        imageView.animationImages = self.imageArray;
        [self addSubview:imageView];
        _imageView = imageView;
    }
    return _imageView;
}


-(UILabel *)textLabel{
    if (!_textLabel) {
        UILabel * label = [[UILabel alloc]init];
        label.text = @"鲨鱼娘拼命加载中...";
        label.textColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentCenter;
        _textLabel = label;
        [self addSubview:label];
    }
    return _textLabel;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor = XHRGBColor(245, 245, 245);
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];

    self.imageView.frame = CGRectMake(0, 0, 160, 180);
    
    self.imageView.center = CGPointMake(ScreenWidth * 0.5, ScreenHeight * 0.5 - 22);
    
    self.textLabel.frame = CGRectMake(0, 0, 200, 12);

    self.textLabel.center = CGPointMake(self.imageView.xh_centerX, self.imageView.xh_bottom + 10);
}


- (void)showInView:(UIView *)view {
    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    [view addSubview:self];
    
    self.frame = view.bounds;
    
    [self layoutIfNeeded];
    
    [self.imageView startAnimating];
}

- (void)dismiss {
    
    [_imageView stopAnimating];
    [_imageView removeFromSuperview];
    [_textLabel removeFromSuperview];
    [self removeFromSuperview];
}

#warning 为什么不实现此方法点击时imageView会消失？
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

}

@end
