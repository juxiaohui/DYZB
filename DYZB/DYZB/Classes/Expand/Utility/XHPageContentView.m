//
//  XHPageContentView.m
//  DYZB
//
//  Created by juxiaohui on 16/11/25.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHPageContentView.h"

static NSString * const contentCellId = @"contentCellId";

@interface XHPageContentView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic, strong)UICollectionView * collectionView;

@property(nonatomic, assign)CGFloat  startOffsetX;

@property(nonatomic, assign)BOOL  isForbidScrollDelegate;

@end
@implementation XHPageContentView

-(UICollectionView *)collectionView{
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = self.bounds.size;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.pagingEnabled = YES;
        collectionView.bounces = NO;
        collectionView.delegate = self;
        collectionView.dataSource =self;
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:contentCellId];
        _collectionView = collectionView;
    }
    return _collectionView;
}

-(instancetype)initWithFrame:(CGRect)frame childViewControllers:(NSArray<UIViewController *> *)childViewControllers parentViewController:(UIViewController *)parentViewController{
    
    if (self = [super initWithFrame:frame]) {
        _childViewControllers = childViewControllers;
        _parentViewController = parentViewController;
        [self setupUI];
    }
    return  self;
}

-(void)setupUI{
    
    for (UIViewController * childVc in self.childViewControllers) {
        [self.parentViewController addChildViewController:childVc];
    }
    [self addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.childViewControllers.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:contentCellId forIndexPath:indexPath];
    for (UIView * view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    UIViewController * vc = self.childViewControllers[indexPath.item];
    vc.view.frame = cell.contentView.bounds;
    [cell.contentView addSubview:vc.view];
    return cell;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    self.isForbidScrollDelegate = NO;
    self.startOffsetX = scrollView.contentOffset.x;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (self.isForbidScrollDelegate)return;
    
    CGFloat progress = 0;
    NSInteger sourceIndex = 0;
    NSInteger targetIndex = 0;
    //判断左滑还是右滑
    
    CGFloat currentOffsetX = scrollView.contentOffset.x;
    if (currentOffsetX > self.startOffsetX) {//左滑
      //计算滑动进度
        progress = currentOffsetX / scrollView.xh_width - floor(currentOffsetX / scrollView.xh_width);
      //计算sourceIndex
        sourceIndex = (NSInteger)(currentOffsetX / scrollView.xh_width);
      //计算targetIndex
        targetIndex = sourceIndex + 1;
        if (targetIndex >= self.childViewControllers.count) {
            targetIndex = self.childViewControllers.count - 1;
        }
        if (currentOffsetX - self.startOffsetX == scrollView.xh_width ) {
            progress = 1.0;
            targetIndex = sourceIndex;
        }
    }else{
        progress = 1 - (currentOffsetX / scrollView.xh_width - floor(currentOffsetX / scrollView.xh_width));
        
        //计算targetIndex
        targetIndex = (NSInteger)(currentOffsetX / scrollView.xh_width);

        //计算sourceIndex
        sourceIndex = targetIndex + 1;
        if (sourceIndex >= self.childViewControllers.count) {
            sourceIndex = self.childViewControllers.count - 1;
        }
    }
    
//    XHLog(@"%.3f**%ld***%ld",progress,sourceIndex,targetIndex);
    //把数据告诉代理
    if (self.delegate && [self.delegate respondsToSelector:@selector(XHPageContentView:scrollWithSourceIndex:targetIndex:progress:)]) {
        [self.delegate XHPageContentView:self scrollWithSourceIndex:sourceIndex targetIndex:targetIndex progress:progress];
    }
}

-(void)setCurrentIndex:(NSInteger)index{
    self.isForbidScrollDelegate = YES;
    CGFloat offsetX = index * self.collectionView.xh_width;
    [self.collectionView setContentOffset:CGPointMake(offsetX, 0) animated:NO];
}
@end
