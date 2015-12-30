//
//  CustomButton.h
//  CD1505Weibo
//
//  Created by 千锋 on 15/12/29.
//  Copyright (c) 2015年 1111111111. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomButton : UIButton
//图片高度占比 0 ~ 1 默认是0.6
@property (nonatomic, assign)CGFloat ratio;

@property (nonatomic, strong)UITabBarItem * tabBarItem;

@end
