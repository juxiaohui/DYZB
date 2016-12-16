//
//  XHOtherCategoryTagController.m
//  DYZB
//
//  Created by juxiaohui on 16/12/6.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHOtherCategoryTagController.h"
#import "XHBaseCollectionViewCell.h"
#import "XHHomeMenuView.h"
#import "XHAnchorRoomModel.h"

//static CGFloat const menuViewH = 200;

@interface XHOtherCategoryTagController ()

@property(nonatomic, weak)XHHomeMenuView * menuView;

@end

@implementation XHOtherCategoryTagController

-(XHHomeMenuView *)menuView{
    if (!_menuView) {
       XHHomeMenuView * menuView = [XHHomeMenuView viewFromXib];
        [self.collectionView addSubview:menuView];
        _menuView = menuView;
    }
    return _menuView;
}

-(void)viewWillLayoutSubviews{
    
    [super viewWillLayoutSubviews];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.viewModel requestOtherTagDataWith:self.tagName handle:^(BOOL success) {
        if (success) {
            
            CGFloat  menuViewH = 0;
            
            if (self.viewModel.anchorGroups.count < 9) {
                menuViewH = 173;
            }else{
                menuViewH = 200;
                
            }
            self.collectionView.contentInset = UIEdgeInsetsMake(menuViewH, 0, 0, 0);
    
            self.menuView.frame = CGRectMake(0, -menuViewH, ScreenWidth, menuViewH);
            
            self.menuView.tagName = self.tagName;
            
            self.menuView.anchorGroups = [NSMutableArray arrayWithArray:self.viewModel.anchorGroups];
            
            [self.collectionView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
