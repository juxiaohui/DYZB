//
//  XHRecommendViewController.m
//  DYZB
//
//  Created by juxiaohui on 16/12/1.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHRecommendViewController.h"
#import "XHSectionHeaderView.h"
#import "XHNormalCollectionViewCell.h"
#import "XHPrettyCollectionViewCell.h"
#import "XHRecommendViewModel.h"
#import "XHAnchorGroupModel.h"
#import "XHBaseCollectionViewCell.h"
#import "XHRecommendCycleView.h"
#import "XHRecommendGameView.h"

static CGFloat const itemMargin = 10;
static NSString * const normalCellID = @"normalCellID";
static NSString * const prettyCellID = @"prettyCellID";
static NSString * const sectionHeaderID = @"sectionHeaderID";
static CGFloat    const sectionHeaderH = 50;
#define cycleViewH ScreenWidth * 3 / 8

@interface XHRecommendViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic, weak)UICollectionView * collectionView;
@property(nonatomic, strong)XHRecommendViewModel * viewModel;
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

-(XHRecommendViewModel *)viewModel{
    
    if (!_viewModel) {
        _viewModel = [[XHRecommendViewModel alloc]init];
    }
    return _viewModel;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
    
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
       // layout.itemSize = CGSizeMake(itemW, itemNormalH);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = itemMargin;
        layout.headerReferenceSize = CGSizeMake(ScreenWidth, sectionHeaderH);
        layout.sectionInset = UIEdgeInsetsMake(0, itemMargin, 0, itemMargin);
        UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        collectionView.contentInset = UIEdgeInsetsMake(cycleViewH + gameViewH, 0, 0, 0);
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([XHNormalCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:normalCellID];
         [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([XHPrettyCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:prettyCellID];
        [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([XHSectionHeaderView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:sectionHeaderID];
        [self.view addSubview:collectionView];
        _collectionView = collectionView;
    }
    return _collectionView;
}


-(void)viewWillLayoutSubviews{
    
    [super viewWillLayoutSubviews];
    
    self.cycleView.frame = CGRectMake(0, -((cycleViewH) + gameViewH), ScreenWidth, cycleViewH);
    self.gameView.frame = CGRectMake(0, -gameViewH, ScreenWidth, gameViewH);
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.viewModel requestDataWith:^(BOOL success) {
        if (success) {
            self.gameView.gameGoups = [NSMutableArray arrayWithArray:self.viewModel.anchorGroups];
            [self.collectionView reloadData];
        }
    }];
    
    [self.viewModel requestCycleDataWith:^(BOOL success) {
        if (success) {
            self.cycleView.cycleDatas = self.viewModel.cycleDatas;
        }
    }];
}

#pragma mark - UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  self.viewModel.anchorGroups.count;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    XHAnchorGroupModel * group = [self.viewModel.anchorGroups objectAtIndex:section];
    return group.room_list.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    XHAnchorGroupModel * group = [self.viewModel.anchorGroups objectAtIndex:indexPath.section];
    XHAnchorRoomModel * anchorRoom = [group.room_list objectAtIndex:indexPath.row];
    
    XHBaseCollectionViewCell * cell = nil;
    
    if (indexPath.section == 1) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:prettyCellID forIndexPath:indexPath];
    }else{
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:normalCellID forIndexPath:indexPath];
    }
    cell.anchorRoom = anchorRoom;
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    XHSectionHeaderView * header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:sectionHeaderID forIndexPath:indexPath];
     XHAnchorGroupModel * group = [self.viewModel.anchorGroups objectAtIndex:indexPath.section];
    header.anchorGroup = group;
    
    return header;
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
