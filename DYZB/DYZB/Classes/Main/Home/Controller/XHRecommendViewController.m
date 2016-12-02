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

static CGFloat const itemMargin = 10;

static NSString * const normalCellID = @"normalCellID";
static NSString * const prettyCellID = @"prettyCellID";
static NSString * const sectionHeaderID = @"sectionHeaderID";
static CGFloat const sectionHeaderH = 50;

@interface XHRecommendViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic, weak)UICollectionView * collectionView;

@end

@implementation XHRecommendViewController

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


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.collectionView reloadData];
    
}

#pragma mark - UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  12;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 8;
    }
    return 4;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1) {
        XHPrettyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:prettyCellID forIndexPath:indexPath];
        return  cell;
    }
    
    XHNormalCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:normalCellID forIndexPath:indexPath];
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView * header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:sectionHeaderID forIndexPath:indexPath];
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
