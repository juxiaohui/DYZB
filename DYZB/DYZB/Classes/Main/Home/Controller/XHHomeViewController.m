//
//  XHHomeViewController.m
//  DYZB
//
//  Created by juxiaohui on 16/11/24.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHHomeViewController.h"
#import "UIBarButtonItem+XHExt.h"
#import "XHPageTitleView.h"
#import "XHPageContentView.h"

@interface XHHomeViewController ()<XHPageTitleViewDelegate,XHPageContentViewDelegate>

@property(nonatomic, strong)XHPageTitleView * titleView;
@property(nonatomic, strong)XHPageContentView * contentView;

@end

@implementation XHHomeViewController

#pragma mark - lazyLoad

-(XHPageContentView *)contentView{
    if (!_contentView) {
        CGFloat contentH = ScreenHeight - NavigationBarH - titleViewH;

        CGRect rect = CGRectMake(0, NavigationBarH + titleViewH, ScreenWidth, contentH);
        NSMutableArray * VCs = [NSMutableArray array];
        for (int i= 0; i<4; i++) {
            
            UIViewController * vc = [[UIViewController alloc]init];
            vc.view.backgroundColor = XHRandomColor;
            [VCs addObject:vc];
        }
        XHPageContentView * contentView = [[XHPageContentView alloc]initWithFrame:rect childViewControllers:VCs parentViewController:self];
            contentView.delegate = self;
        _contentView = contentView;
    }
    return _contentView;
}
-(XHPageTitleView *)titleView{
    if (!_titleView) {
        XHPageTitleView * titleView = [[XHPageTitleView alloc]initWithFrame:CGRectMake(0, NavigationBarH, ScreenWidth, titleViewH) titles:@[@"推荐",@"游戏",@"娱乐",@"趣玩"]];
        titleView.delegate = self;
        _titleView = titleView;
    }
    return _titleView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setupUI];
    [self setupNavigationBar];
    
}

-(void)setupUI{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.contentView];
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


#pragma mark - XHPageTitleViewDelegate

-(void)XHPageTitleView:(XHPageTitleView *)titleView selectedIndex:(NSInteger)index{
    
    [self.contentView setCurrentIndex:index];
}

#pragma mark - XHPageContentViewDelegate

-(void)XHPageContentView:(XHPageContentView *)contentView scrollWithSourceIndex:(NSInteger)sourceIndex targetIndex:(NSInteger)targetIndex progress:(CGFloat)progress{
    
    [self.titleView setTitleViewWithSourceIndex:sourceIndex targetIndex:targetIndex progress:progress];
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
