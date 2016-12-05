//
//  XHCycleCollectionViewCell.m
//  DYZB
//
//  Created by juxiaohui on 16/12/5.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHCycleCollectionViewCell.h"
#import "XHCycleModel.h"

@interface XHCycleCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end

@implementation XHCycleCollectionViewCell


-(void)setCycleModel:(XHCycleModel *)cycleModel{

    _cycleModel = cycleModel;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:cycleModel.pic_url]];
    self.title.text = cycleModel.title;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

@end
