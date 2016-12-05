//
//  XHNormalCollectionViewCell.m
//  DYZB
//
//  Created by juxiaohui on 16/12/1.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHNormalCollectionViewCell.h"

@interface XHNormalCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *roomNameLabel;
@end

@implementation XHNormalCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void)setAnchorRoom:(XHAnchorRoomModel *)anchorRoom{
    super.anchorRoom = anchorRoom;
    self.roomNameLabel.text = anchorRoom.room_name;
}

@end
