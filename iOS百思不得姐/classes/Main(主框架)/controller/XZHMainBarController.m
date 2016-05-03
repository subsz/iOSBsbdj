//
//  XZHMainBarController.m
//  XZH百思
//
//  Created by xuzhenhao on 16/4/15.
//  Copyright © 2016年 xuzhenhao. All rights reserved.
//

#import "XZHMainBarController.h"
#import "XZHTabBar.h"
@interface XZHMainBarController ()

@end

@implementation XZHMainBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //通过apperance属性统一设置tabbarItem中所有文字的属性
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attr[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
    NSMutableDictionary *attrSel = [NSMutableDictionary dictionary];
    attrSel[NSFontAttributeName] = attr[NSFontAttributeName];
    attrSel[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attr forState:UIControlStateNormal];
    [item setTitleTextAttributes:attrSel forState:UIControlStateSelected];
    // Do any additional setup after loading the view.
    //创建子控制器
    [self setController:[self loadControllerWithStoryboardName:@"Essence"] withTitle:@"精华" imageName:@"tabBar_essence_icon" selImageName:@"tabBar_essence_click_icon"];
    [self setController:[self loadControllerWithStoryboardName:@"FriendTrends"] withTitle:@"关注" imageName:@"tabBar_friendTrends_icon" selImageName:@"tabBar_friendTrends_click_icon"];
    [self setController:[self loadControllerWithStoryboardName:@"Me"] withTitle:@"我的" imageName:@"tabBar_me_icon" selImageName:@"tabBar_me_click_icon"];
    [self setController:[self loadControllerWithStoryboardName:@"New"] withTitle:@"新帖" imageName:@"tabBar_new_icon" selImageName:@"tabBar_new_click_icon"];
    //tabBar是只读属性的，但通过kvc可以修改
    [self setValue:[[XZHTabBar alloc]init] forKeyPath:@"tabBar"];
    
  
}

#pragma mark -通过storyBoard来创建相应的控制器
- (UIViewController *)loadControllerWithStoryboardName:(NSString *)name{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:name bundle:nil];
    return [sb instantiateInitialViewController];
}

#pragma mark - 设置控制器属性
- (void)setController:(UIViewController *)childController withTitle:(NSString *)title imageName:(NSString *)imageName selImageName:(NSString *)selImageName{
    childController.tabBarItem.title = title;
    childController.tabBarItem.image = [[UIImage imageNamed:imageName ]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selImageName ]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //把子控制器添加到标签控制器中
    [self addChildViewController:childController];
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
