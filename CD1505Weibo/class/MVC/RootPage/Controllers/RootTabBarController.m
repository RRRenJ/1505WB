//
//  RootTabBarController.m
//  CD1505Weibo
//
//  Created by 千锋 on 15/12/29.
//  Copyright (c) 2015年 1111111111. All rights reserved.
//

#import "RootTabBarController.h"
#import "HomeTableViewController.h"
#import "MessageTableViewController.h"
#import "DiscoverTableViewController.h"
#import "PersonalTableViewController.h"
#import "CustomTabBar.h"

@interface RootTabBarController ()<CustomTabBarDelegate>

@property(nonatomic,strong)CustomTabBar * wbTabBar;


@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addCustomTabBar];
    [self addViewControllers];
    
    
    
   
}
-(void)addCustomTabBar{
    //隐藏自带的 tabBar
    self.tabBar.hidden = YES;
    self.wbTabBar = [[CustomTabBar alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-49, SCREEN_WIDTH, 49)];
    [self.view addSubview:self.wbTabBar];
    //根据图片获取颜色
    self.wbTabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background"]];
//    self.wbTabBar.backgroundColor= [UIColor grayColor];
    self.wbTabBar.userInteractionEnabled = YES;
//    self.wbTabBar.delegate = self;
    __weak typeof(self) weakSelf = self;
    self.wbTabBar.block = ^void(NSInteger index){
        weakSelf.selectedIndex = index;
    };
}
#pragma mark - CustomTabBarDelegate
-(void)passIndex:(NSInteger)index{
    self.selectedIndex = index;
}
-(void)addViewControllers{
    
    NSArray * VCNameArray = @[@"HomeTableViewController",@"MessageTableViewController",@"DiscoverTableViewController",@"PersonalTableViewController"];
    NSArray * VCTitleArray = @[@"首页",@"消息",@"发现",@"我"];
    NSArray * normalImages = @[@"tabbar_home",@"tabbar_message_center",@"tabbar_discover",@"tabbar_profile"];
//    NSArray * higImages = @[@"tabbar_home_highligted",@"tabbar_message_center_highligted",@"tabbar_discover_highligted",@"tabbar_profile_highligted"];
    NSArray * selImages = @[@"tabbar_home_selected",@"tabbar_message_center_selected",@"tabbar_discover_selected",@"tabbar_profile_selected"];
    
    for (NSString * VCName in VCNameArray) {
        Class VCClass = NSClassFromString(VCName);
        NSInteger index = [VCNameArray indexOfObject:VCName];
        UITableViewController * VC = [[VCClass alloc]init];
        //设置文字
        VC.title = VCTitleArray[index];
        //修改文字颜色
//        NSDictionary * normalAttr = @{NSFontAttributeName :[UIFont systemFontOfSize:13], NSForegroundColorAttributeName : [UIColor lightGrayColor]};
//        NSDictionary * selmalAttr = @{NSFontAttributeName :[UIFont systemFontOfSize:13], NSForegroundColorAttributeName : [UIColor orangeColor]};
//        [VC.tabBarItem setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
//        [VC.tabBarItem setTitleTextAttributes:selmalAttr forState:UIControlStateSelected];
        //设置图片
        VC.tabBarItem.image = [[UIImage imageNamed:normalImages[index]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        VC.tabBarItem.selectedImage = [[UIImage imageNamed:selImages[index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UINavigationController * naviVC = [[UINavigationController alloc]initWithRootViewController:VC];
        [self addChildViewController:naviVC];
        self.wbTabBar.tabBarItem = VC.tabBarItem;
    }
    
    
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
