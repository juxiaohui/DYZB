//
//  XHBaseAnchorViewController.m
//  DYZB
//
//  Created by juxiaohui on 16/12/14.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHBaseAnchorViewController.h"
#import "XHNormalCollectionViewCell.h"
#import "XHPrettyCollectionViewCell.h"
#import "XHSectionHeaderView.h"
#import "XHAnchorGroupModel.h"

static NSString * const sectionHeaderID = @"sectionHeaderID";
static CGFloat    const sectionHeaderH = 50;

@interface XHBaseAnchorViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation XHBaseAnchorViewController


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

-(void)viewDidLoad{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
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
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:normalCellID forIndexPath:indexPath];
    
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
    return CGSizeMake(itemW, itemNormalH);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
