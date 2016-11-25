//
//  XHNavigationController.m
//  DYZB
//
//  Created by juxiaohui on 16/11/24.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "XHNavigationController.h"

@interface XHNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation XHNavigationController


+(void)initialize{
    // 设置导航栏背景颜色
    [UINavigationBar appearance].barTintColor = [UIColor orangeColor];
    
    // 设置导航栏标题文字属性
    NSMutableDictionary *barAttrs = [NSMutableDictionary dictionary];
    barAttrs[NSFontAttributeName] =XHNormalFont(18);
    barAttrs[NSForegroundColorAttributeName] =  [UIColor whiteColor];
    [[UINavigationBar appearance] setTitleTextAttributes:barAttrs];
    
    
    //设置Item的标题属性
    [[UIBarButtonItem appearance] setTintColor: [UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f]];
    NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
    itemAttrs[NSFontAttributeName] = XHNormalFont(17);
    itemAttrs[NSForegroundColorAttributeName] =  [UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f];
    [[UIBarButtonItem appearance]setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
    
    //把背景图和分割线图清空
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    //    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}


- (void)viewDidLoad {
    [super viewDidLoad];
   self.interactivePopGestureRecognizer.delegate = self;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count >= 1) {
        // 左上角的返回
        
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:@"navBackBtn"] forState:UIControlStateNormal];
        backButton.frame = CGRectMake(0, 0, 22, 22);
        backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        viewController.hidesBottomBarWhenPushed = YES; // 隐藏底部的工具条
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

#pragma mark - <UIGestureRecognizerDelegate>
/**
 * 每当用户触发[返回手势]时都会调用一次这个方法
 * 返回值:返回YES,手势有效; 返回NO,手势失效
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    return self.childViewControllers.count > 1;
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
