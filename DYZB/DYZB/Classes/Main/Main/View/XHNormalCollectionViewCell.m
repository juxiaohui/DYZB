//
//  XHNormalCollectionViewCell.m
//  DYZB
//
//  Created by juxiaohui on 16/12/1.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHNormalCollectionViewCell.h"
#import "XHAnchorRoomModel.h"

@interface XHNormalCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *roomNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *onelineLabel;

@end

@implementation XHNormalCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.iconImageView.layer.cornerRadius = 5.0;
    self.iconImageView.layer.masksToBounds = YES;
}
-(void)setAnchorRoom:(XHAnchorRoomModel *)anchorRoom{
    
    _anchorRoom = anchorRoom;
    self.roomNameLabel.text = anchorRoom.room_name;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:anchorRoom.vertical_src]];
    self.nickNameLabel.text = anchorRoom.nickname;
    self.onelineLabel.text = [NSString stringWithFormat:@"%ld",anchorRoom.online];
}

@end
