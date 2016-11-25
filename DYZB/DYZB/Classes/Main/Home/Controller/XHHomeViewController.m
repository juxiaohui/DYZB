//
//  XHHomeViewController.m
//  DYZB
//
//  Created by juxiaohui on 16/11/24.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHHomeViewController.h"
#import "UIBarButtonItem+XHExt.h"

@interface XHHomeViewController ()

@end

@implementation XHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self setupNavigationBar];
    
}

-(void)setupNavigationBar{
    
    UIBarButtonItem * logoItem = [UIBarButtonItem itemWithImage:@"homeLogoIcon" highImage:nil size:CGSizeZero target:self action:@selector(logoItemClick)];
    self.navigationItem.leftBarButtonItem = logoItem;
    
    
    CGSize  size = CGSizeMake(35, 35);
    UIBarButtonItem * historyItem = [UIBarButtonItem itemWithImage:@"viewHistoryIcon" highImage:nil size:size target:self action:@selector(historyItemClick)];
    UIBarButtonItem * searchItem = [UIBarButtonItem itemWithImage:@"searchBtnIcon" highImage:nil size:size target:self action:@selector(searchItemClick)];
    UIBarButtonItem * qrcodeItem = [UIBarButtonItem itemWithImage:@"scanIcon" highImage:nil size:size target:self action:@selector(qrcodeItemClick)];
    self.navigationItem.rightBarButtonItems = @[historyItem,searchItem,qrcodeItem];
}

#pragma mark - 按钮事件监听


-(void)logoItemClick{
    
    
}
-(void)historyItemClick{
    
    
}
-(void)searchItemClick{
    
    
}
-(void)qrcodeItemClick{
    
    
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
