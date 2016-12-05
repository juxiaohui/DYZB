//
//  XHPrettyCollectionViewCell.m
//  DYZB
//
//  Created by juxiaohui on 16/12/1.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHPrettyCollectionViewCell.h"

@interface XHPrettyCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

@end

@implementation XHPrettyCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}
-(void)setAnchorRoom:(XHAnchorRoomModel *)anchorRoom{
    super.anchorRoom = anchorRoom;
    self.cityLabel.text = anchorRoom.anchor_city;
}

@end
