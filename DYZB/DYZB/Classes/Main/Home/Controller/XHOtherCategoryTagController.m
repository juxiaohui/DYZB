//
//  XHOtherCategoryTagController.m
//  DYZB
//
//  Created by juxiaohui on 16/12/6.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHOtherCategoryTagController.h"
#import "XHBaseCollectionViewCell.h"


@interface XHOtherCategoryTagController ()

@end

@implementation XHOtherCategoryTagController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.viewModel requestOtherTagDataWith:self.tagName handle:^(BOOL success) {
        if (success) {
            [self.collectionView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
