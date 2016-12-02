//
//  XHSectionHeaderView.m
//  DYZB
//
//  Created by juxiaohui on 16/12/1.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHSectionHeaderView.h"
#import "XHAnchorGroupModel.h"

@interface XHSectionHeaderView ()

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@end

@implementation XHSectionHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setAnchorGroup:(XHAnchorGroupModel *)anchorGroup{
    _anchorGroup = anchorGroup;
    self.title.text = anchorGroup.tag_name;
    self.iconImage.image = [UIImage imageNamed:anchorGroup.defaultImage];
    
}

@end
