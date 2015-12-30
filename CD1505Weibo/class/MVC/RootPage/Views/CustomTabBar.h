//
//  CustomTabBar.h
//  CD1505Weibo
//
//  Created by 千锋 on 15/12/29.
//  Copyright (c) 2015年 1111111111. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomTabBarDelegate <NSObject>

-(void)passIndex:(NSInteger )index;

@end

typedef void(^CustomBlock)(NSInteger index);

@interface CustomTabBar : UIView
//用来传递title image等信息
@property(nonatomic,strong)UITabBarItem * tabBarItem;

@property(nonatomic,weak)id<CustomTabBarDelegate>delegate;
@property(nonatomic,copy)CustomBlock block;

@end
