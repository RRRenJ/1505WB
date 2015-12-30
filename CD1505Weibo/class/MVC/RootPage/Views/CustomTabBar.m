//
//  CustomTabBar.m
//  CD1505Weibo
//
//  Created by 千锋 on 15/12/29.
//  Copyright (c) 2015年 1111111111. All rights reserved.
//

#import "CustomTabBar.h"
#import "CustomButton.h"



@interface CustomTabBar ()

@property (nonatomic,strong) CustomButton * selectedButton;
@property (nonatomic,strong) NSMutableArray * buttonArray;
@property (nonatomic,strong) UIButton * plusButton;

@end


@implementation CustomTabBar

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_plusButton];
        [_plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [_plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [_plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        [_plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    }
    return self;
}


-(NSMutableArray *)buttonArray{
    if (_buttonArray == nil) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}



-(void)setTabBarItem:(UITabBarItem *)tabBarItem{
    CustomButton * button = [CustomButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:button];
    button.tabBarItem = tabBarItem;
    [self.buttonArray addObject:button];
    button.ratio = 0.7;
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
//    button.imageEdgeInsets = uii
    if (self.buttonArray.count == 1) {
        [self buttonClicked:button];
    }
}
-(void)buttonClicked:(CustomButton *)sender{
    sender.selected = !sender.selected;
////  单一选择  1.循环
//    for (CustomButton * button in self.buttonArray) {
//        button.selected = NO;
//    }
//    sender.selected = YES;
//    2.记录
    _selectedButton.selected = NO;
    sender.selected = YES;
    _selectedButton = sender;
    NSInteger index = [self.buttonArray indexOfObject:sender];
    //代理
//    if ([self.delegate respondsToSelector:@selector(passIndex:)]) {
//        [self.delegate passIndex:index];
//    }
    if (self.block) {
        self.block(index);
    }
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    if (self.buttonArray.count != 0) {
        CGFloat buttonWidth = CGRectGetWidth(self.frame)/((CGFloat)self.buttonArray.count+1);
    
        for (int index = 0; index < self.buttonArray.count+1; index++) {
            
            CGFloat buttonX = buttonWidth * index;
            CGFloat buttonY = 0;
            CGFloat buttonW = buttonWidth;
            CGFloat buttonH = CGRectGetHeight(self.frame);
            if (index < 2) {
                CustomButton * button = self.buttonArray[index];
                button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
            }else if(index == 2){
                self.plusButton.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
            }else if (index > 2){
                CustomButton * button = self.buttonArray[index -1];
                button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
            }
        }
    }
    
}





@end
