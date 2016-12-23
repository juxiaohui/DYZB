//
//  XHRecommendViewController.m
//  DYZB
//
//  Created by juxiaohui on 16/12/1.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHRecommendViewController.h"
#import "XHAnchorGroupModel.h"
#import "XHBaseCollectionViewCell.h"
#import "XHRecommendCycleView.h"
#import "XHRecommendGameView.h"

#define cycleViewH ScreenWidth * 3 / 8

@interface XHRecommendViewController ()

@property(nonatomic, weak)XHRecommendCycleView * cycleView;
@property(nonatomic, weak)XHRecommendGameView * gameView;

@end

@implementation XHRecommendViewController

-(XHRecommendGameView *)gameView{
    if (!_gameView) {
        XHRecommendGameView * gameView = [XHRecommendGameView viewFromXib];
        [self.collectionView addSubview:gameView];
        _gameView = gameView;
    }
    return _gameView;
}
-(XHRecommendCycleView *)cycleView{
    if (!_cycleView) {
        XHRecommendCycleView * cycleView = [XHRecommendCycleView viewFromXib];
        [self.collectionView addSubview:cycleView];
        _cycleView = cycleView;
    }
    return _cycleView;
}

-(void)viewWillLayoutSubviews{
    
    [super viewWillLayoutSubviews];
    
    self.cycleView.frame = CGRectMake(0, -((cycleViewH) + gameViewH), ScreenWidth, cycleViewH);
    self.gameView.frame = CGRectMake(0, -gameViewH, ScreenWidth, gameViewH);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置内边距
    self.collectionView.contentInset = UIEdgeInsetsMake(cycleViewH + gameViewH, 0, 0, 0);
    [self showLoadingAnimation];
    
    [self.viewModel requestDataWith:^(BOOL success) {
        if (success) {
            self.gameView.gameGoups = [NSMutableArray arrayWithArray:self.viewModel.anchorGroups];
            
            [self.loadingView dismiss];
            
            [self.collectionView reloadData];
        }
    }];
    
    [self.viewModel requestCycleDataWith:^(BOOL success) {
        if (success) {
            self.cycleView.cycleDatas = self.viewModel.cycleDatas;
        }
    }];
}



-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1) {
        XHAnchorGroupModel * group = [self.viewModel.anchorGroups objectAtIndex:indexPath.section];
        XHAnchorRoomModel * anchorRoom = [group.room_list objectAtIndex:indexPath.row];
        XHBaseCollectionViewCell * cell = nil;
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:prettyCellID forIndexPath:indexPath];
        cell.anchorRoom = anchorRoom;
        return cell;
    }else{
        return [super collectionView:collectionView cellForItemAtIndexPath:indexPath];
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat itemW = (ScreenWidth - 3 * itemMargin) / 2 ;
    CGFloat itemNormalH = itemW * 3 / 4 ;
    CGFloat itemPrettyH = itemW * 4 / 3;
    if (indexPath.section == 1) {
        return CGSizeMake(itemW, itemPrettyH);
    }else{
        return CGSizeMake(itemW, itemNormalH);
    }
}


@end
