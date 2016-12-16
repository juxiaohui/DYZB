//
//  XHMenuCollectionViewCell.m
//  DYZB
//
//  Created by juxiaohui on 16/12/14.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHMenuCollectionViewCell.h"
#import "XHRecommendGameCell.h"
#import "XHAnchorRoomModel.h"
#import "XHAnchorGroupModel.h"

static NSString * const gameCellID = @"gameCellID";

@interface XHMenuCollectionViewCell ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation XHMenuCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([XHRecommendGameCell class]) bundle:nil] forCellWithReuseIdentifier:gameCellID];
}


-(void)setAnchorGroups:(NSArray *)anchorGroups{
    _anchorGroups = anchorGroups;
    [self.collectionView reloadData];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    UICollectionViewFlowLayout * layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize =CGSizeMake(self.collectionView.xh_width/4, self.collectionView.xh_height/2);
}

#pragma mark - UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.anchorGroups.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    XHRecommendGameCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:gameCellID forIndexPath:indexPath];

    XHAnchorGroupModel * anchorRoom = [self.anchorGroups objectAtIndex:indexPath.item];
    cell.roomModel = anchorRoom;
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
//
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//    CGFloat itemW =  self.collectionView.xh_width / 4;
//    CGFloat itemH =  self.collectionView.xh_height / 2 ;
//    
//    return CGSizeMake(itemW, itemH);
//}


@end
