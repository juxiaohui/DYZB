//
//  XHBaseAnchorViewController.h
//  DYZB
//
//  Created by juxiaohui on 16/12/14.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHRecommendViewModel.h"
#import "XHLoadingAnimationView.h"
static CGFloat const itemMargin = 10;
static NSString * const normalCellID = @"normalCellID";
static NSString * const prettyCellID = @"prettyCellID";

@interface XHBaseAnchorViewController : UIViewController

@property(nonatomic, weak)UICollectionView * collectionView;

@property(nonatomic, strong)XHRecommendViewModel * viewModel;

@property(nonatomic, weak)XHLoadingAnimationView * loadingView;


-(void)showLoadingAnimation;

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end
