//
//  XHRecommendGameView.m
//  DYZB
//
//  Created by juxiaohui on 16/12/5.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHRecommendGameView.h"
#import "XHAnchorGroupModel.h"
#import "XHRecommendGameCell.h"

static NSString * const gameViewCellID = @"gameViewCellID";
static CGFloat const gameViewInsetLR = 10;

@interface XHRecommendGameView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

@implementation XHRecommendGameView

-(void)awakeFromNib{
    [super awakeFromNib];
    self.collectionView.contentInset = UIEdgeInsetsMake(0, gameViewInsetLR, 0, gameViewInsetLR);
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([XHRecommendGameCell class]) bundle:nil] forCellWithReuseIdentifier:gameViewCellID];
}

-(void)setGameGoups:(NSMutableArray<XHAnchorGroupModel *> *)gameGoups{
    _gameGoups = gameGoups;
    
    [self.gameGoups removeObjectAtIndex:0];
    [self.gameGoups removeObjectAtIndex:0];

    XHAnchorGroupModel * group = [[XHAnchorGroupModel alloc]init];
    group.tag_name = @"更多";
    
    [self.gameGoups addObject:group];
    [self.collectionView reloadData];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    UICollectionViewFlowLayout * layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake(gameViewW, gameViewH);
}

#pragma mark - UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.gameGoups.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XHRecommendGameCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:gameViewCellID forIndexPath:indexPath];
    cell.roomModel = self.gameGoups[indexPath.item];
    return cell;
}

#pragma mark - UICollectionViewDelegate



@end
