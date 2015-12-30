//
//  CustomButton.m
//  CD1505Weibo
//
//  Created by 千锋 on 15/12/29.
//  Copyright (c) 2015年 1111111111. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton




-(void)setRatio:(CGFloat)ratio{
    if (ratio <0 && ratio > 1) {
        NSException * expre = [NSException exceptionWithName:@"异常" reason:@"参数范围不在0 ~ 1区间内" userInfo:nil];
        @throw expre;
    }else
    _ratio = ratio;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _ratio = 0.6;
        
    }
    
    return self;
}

-(void)setTabBarItem:(UITabBarItem *)tabBarItem{
     //获取标题title image
    [self setTitle:tabBarItem.title forState:UIControlStateNormal];
    [self setImage:tabBarItem.image forState:UIControlStateNormal];
    [self setImage:tabBarItem.selectedImage forState:UIControlStateSelected];
    
    [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    
    self.titleLabel.font = [UIFont systemFontOfSize:10];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}
//拦截高亮状态响应
-(void)setHighlighted:(BOOL)highlighted{
    
}

//定义图片位置  contentRect 按钮自身的frame
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
   return CGRectMake(0, 0, CGRectGetWidth(contentRect), CGRectGetHeight(contentRect) * _ratio);
    
}
//定义文字位置
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, CGRectGetHeight(contentRect)* _ratio, CGRectGetWidth(contentRect), CGRectGetHeight(contentRect) *(1 - _ratio));
}


@end
