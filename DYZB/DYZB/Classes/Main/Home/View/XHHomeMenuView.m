//
//  XHHomeMenuView.m
//  DYZB
//
//  Created by juxiaohui on 16/12/14.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHHomeMenuView.h"
#import "XHMenuCollectionViewCell.h"
#import "XHAnchorGroupModel.h"
#import "XHAnchorRoomModel.h"

static NSString * const menuCellID = @"menuCellID";

@interface XHHomeMenuView ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewBottomConstraint;

@end

@implementation XHHomeMenuView

-(void)awakeFromNib{

    [super awakeFromNib];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([XHMenuCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:menuCellID];
}

-(void)setTagName:(NSString *)tagName{
    
    _tagName = [tagName copy];
}


-(void)setAnchorGroups:(NSMutableArray<XHAnchorGroupModel *> *)anchorGroups{
    _anchorGroups = anchorGroups;
    
    [self.anchorGroups removeObjectAtIndex:0];
    
    if (self.anchorGroups.count < 9) {
        self.pageControl.hidden = YES;
        self.collectionViewBottomConstraint.constant = 0;
    }else{
        self.pageControl.hidden = NO;
        self.pageControl.numberOfPages = 2;
        self.collectionViewBottomConstraint.constant = 27;
    }
    
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (self.anchorGroups == nil) return 0;
    
    if (self.anchorGroups.count > 9) {
        return 2;
    }else{
        return 1;
    }
    
//    NSInteger pageNum = (self.anchorGroups.count - 1) / 8 + 1 ;
//    self.pageControl.numberOfPages = pageNum;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    XHMenuCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:menuCellID forIndexPath:indexPath];

    if (self.anchorGroups.count > 9) {
        if (indexPath.item == 0) {
            NSIndexSet * idxSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 8)];
            cell.anchorGroups = [self.anchorGroups objectsAtIndexes:idxSet];
        }else if (indexPath.item == 1){
            
            if (self.anchorGroups.count > 17) {
                NSIndexSet * idxSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(8, 7)];
                NSMutableArray <XHAnchorGroupModel *>* tempArray = [NSMutableArray arrayWithArray:[self.anchorGroups objectsAtIndexes:idxSet]];
                XHAnchorGroupModel * anchorGroup = [[XHAnchorGroupModel alloc]init];
                anchorGroup.tag_name = @"更多分类";
                [tempArray addObject:anchorGroup];
                cell.anchorGroups = tempArray;
            }else{
                NSIndexSet * idxSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(8, self.anchorGroups.count - 8)];
                cell.anchorGroups = [self.anchorGroups objectsAtIndexes:idxSet];
            }
        }
    }else{
        cell.anchorGroups = self.anchorGroups;
    }

    // 0页: 0 ~ 7
    // 1页: 8 ~ 15
//    NSInteger startIndex = indexPath.item * 8;
//    NSInteger endIndex = (indexPath.item + 1) * 8 - 1;
//    if (endIndex > self.anchorGroups.count - 1) {
//        endIndex = self.anchorGroups.count - 1;
//    }
//    
//    NSIndexSet * idxSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(startIndex, endIndex - startIndex + 1)];
//    cell.anchorGroups = [self.anchorGroups objectsAtIndexes:idxSet];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.collectionView.bounds.size;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.pageControl.currentPage = scrollView.contentOffset.x / scrollView.xh_width;
}



@end
