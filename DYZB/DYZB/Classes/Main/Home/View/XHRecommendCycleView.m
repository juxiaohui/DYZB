//
//  XHRecommendCycleView.m
//  DYZB
//
//  Created by juxiaohui on 16/12/5.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHRecommendCycleView.h"
#import "XHCycleModel.h"
#import "XHCycleCollectionViewCell.h"

static NSString * const cycleViewCellID = @"cycleViewCellID";
@interface XHRecommendCycleView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property(nonatomic, strong)NSTimer * timer;
@end

@implementation XHRecommendCycleView


-(void)setCycleDatas:(NSArray<XHCycleModel *> *)cycleDatas{
    _cycleDatas = cycleDatas;
    [self.collectionView reloadData];
    self.pageControl.numberOfPages = cycleDatas.count;
    
    //先滚动100照成前面有数据滚动的假象
    NSIndexPath * indexPath = [NSIndexPath indexPathForItem:self.cycleDatas.count * 100 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    [self removeTimer];
    [self setupTimer];
}

-(void)awakeFromNib{

    [super awakeFromNib];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([XHCycleCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:cycleViewCellID];
}

//-(void)layoutSubviews{
//    [super layoutSubviews];
//    UICollectionViewFlowLayout * layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
//    layout.itemSize =self.collectionView.bounds.size;
//}

#pragma mark - UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.cycleDatas.count * 10000;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XHCycleCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cycleViewCellID forIndexPath:indexPath];
    cell.cycleModel = self.cycleDatas[indexPath.item % self.cycleDatas.count];
    return cell;
}

#pragma mark - UICollectionViewDelegate

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.collectionView.bounds.size;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offsetx = scrollView.contentOffset.x + scrollView.xh_width * 0.5; //滚动一半切换pageControl
    
    NSInteger index = (NSInteger)(offsetx / scrollView.xh_width) % (self.cycleDatas.count);
    
    self.pageControl.currentPage = index;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self removeTimer];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self setupTimer];
}


#pragma mark - timer

-(void)setupTimer{

    self.timer = [NSTimer timerWithTimeInterval:3.0 target:self selector:@selector(scrollToNext) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)removeTimer{
    
    [self.timer invalidate];
    self.timer = nil;
}

-(void)scrollToNext{
    
    CGFloat currentOffsetx = self.collectionView.contentOffset.x;
    
    CGFloat toOffsetx = currentOffsetx + self.collectionView.xh_width;
    
    [self.collectionView setContentOffset:CGPointMake(toOffsetx, 0) animated:YES];
}



@end
