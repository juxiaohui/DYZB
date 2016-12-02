//
//  XHPrettyCollectionViewCell.m
//  DYZB
//
//  Created by juxiaohui on 16/12/1.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHPrettyCollectionViewCell.h"
#import "XHAnchorRoomModel.h"

@interface XHPrettyCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *onelineLabel;


@end

@implementation XHPrettyCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconImageView.layer.cornerRadius = 5.0;
    self.iconImageView.layer.masksToBounds = YES;
}

-(void)setAnchorRoom:(XHAnchorRoomModel *)anchorRoom{
    
    _anchorRoom = anchorRoom;
    self.cityLabel.text = anchorRoom.anchor_city;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:anchorRoom.vertical_src]];
    self.nickNameLabel.text = anchorRoom.nickname;
    self.onelineLabel.text = [NSString stringWithFormat:@"%ld",anchorRoom.online];
}

@end
