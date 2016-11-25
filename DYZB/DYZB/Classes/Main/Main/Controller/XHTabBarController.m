//
//  XHTabBarController.m
//  DYZB
//
//  Created by juxiaohui on 16/11/24.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHTabBarController.h"
#import "XHNavigationController.h"
#import "XHHomeViewController.h"
#import "XHLiveViewController.h"
#import "XHFollowViewController.h"
#import "XHProfileViewController.h"

@interface XHTabBarController ()

@end

@implementation XHTabBarController

/**
 *  单例实现
 */
XHSingletonM(XHTabBarController)


+(void)initialize{

    [UITabBar appearance].barTintColor = [UIColor colorWithRed:0.97f green:0.97f blue:0.97f alpha:1.00f];
    
    //    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, 1.5)];
    //
    NSMutableDictionary * normalDic = [NSMutableDictionary dictionary];
    
    normalDic[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.62f green:0.62f blue:0.63f alpha:1.00f];

    normalDic[NSFontAttributeName] = XHNormalFont(12);
    
    NSMutableDictionary * selectlDic = [NSMutableDictionary dictionary];
    
    selectlDic[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    [[UITabBarItem appearance] setTitleTextAttributes:normalDic forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:selectlDic forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildController];
}

-(void)addChildController{
    
    [self setupChildVc:[[XHHomeViewController alloc] init] title:@"首页" image:@"tabHome" selectedImage:@"tabHomeHL"];
    
    [self setupChildVc:[[XHLiveViewController alloc] init] title:@"直播" image:@"tabLiving" selectedImage:@"tabLivingHL"];
    
    [self setupChildVc:[[XHFollowViewController alloc] init] title:@"关注" image:@"tabFocus" selectedImage:@"tabFocusHL"];
    
    [self setupChildVc:[[XHProfileViewController alloc] init] title:@"我的" image:@"tabMine" selectedImage:@"tabMineHL"];
    
}
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 包装一个导航控制器
    XHNavigationController *nav = [[XHNavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];
    
    // 设置子控制器的tabBarItem
    nav.tabBarItem.title = title;
    
    nav.tabBarItem.image = [UIImage imageNamed:image];
    
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
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
