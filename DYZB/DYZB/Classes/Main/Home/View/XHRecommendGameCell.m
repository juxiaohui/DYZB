//
//  XHRecommendGameCell.m
//  DYZB
//
//  Created by juxiaohui on 16/12/5.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHRecommendGameCell.h"
#import "XHAnchorGroupModel.h"

@interface XHRecommendGameCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconIamegView;

@property (weak, nonatomic) IBOutlet UILabel *title;

@end

@implementation XHRecommendGameCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconIamegView.layer.cornerRadius = 22.5;
    self.iconIamegView.layer.masksToBounds = YES;
}

-(void)setRoomModel:(XHAnchorGroupModel *)roomModel{
    
    _roomModel = roomModel;
    
    self.title.text = roomModel.tag_name;
    [self.iconIamegView sd_setImageWithURL:[NSURL URLWithString:roomModel.icon_url] placeholderImage:[UIImage imageNamed:@"home_more_btn"]];
}

@end
