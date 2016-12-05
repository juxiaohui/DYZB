//
//  XHBaseCollectionViewCell.m
//  DYZB
//
//  Created by juxiaohui on 16/12/5.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHBaseCollectionViewCell.h"

@interface XHBaseCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *onelineLabel;

@end

@implementation XHBaseCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconImageView.layer.cornerRadius = 5.0;
    self.iconImageView.layer.masksToBounds = YES;
}

-(void)setAnchorRoom:(XHAnchorRoomModel *)anchorRoom{
    _anchorRoom = anchorRoom;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:anchorRoom.vertical_src]];
    
    self.nickNameLabel.text = anchorRoom.nickname;
    
    if (anchorRoom.online>=10000) {
        self.onelineLabel.text = [NSString stringWithFormat:@"%.1f万在线",(anchorRoom.online / 10000.0)];
    }else{
        self.onelineLabel.text = [NSString stringWithFormat:@"%ld",anchorRoom.online];
    }
}


@end
