//
//  UIButton+YW.m
//  YWShop
//
//  Created by xingyong on 14-5-16.
//  Copyright (c) 2014年 YiYaoWang. All rights reserved.
//

#import "UIButton+YW.h"

@implementation UIButton (YW)
+ (id) buttonWithFrame:(CGRect)frame{
	return [UIButton buttonWithFrame:frame title:nil];
}
+ (id) buttonWithFrame:(CGRect)frame title:(NSString*)title{
	return [UIButton buttonWithFrame:frame title:title backgroundImage:nil];
}
+ (id) buttonWithFrame:(CGRect)frame title:(NSString*)title backgroundImage:(UIImage*)backgroundImage{
	return [UIButton buttonWithFrame:frame title:title backgroundImage:backgroundImage highlightedBackgroundImage:nil];
}
+ (id) buttonWithFrame:(CGRect)frame title:(NSString*)title backgroundImage:(UIImage*)backgroundImage highlightedBackgroundImage:(UIImage*)highlightedBackgroundImage{
	UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
	btn.frame = frame;
	[btn setTitle:title forState:UIControlStateNormal];
//    [btn setShowsTouchWhenHighlighted:YES];
    [btn setExclusiveTouch:YES];
	[btn setBackgroundImage:backgroundImage forState:UIControlStateNormal];
	[btn setBackgroundImage:highlightedBackgroundImage forState:UIControlStateHighlighted];
	return btn;
}

+ (id) buttonWithFrame:(CGRect)frame image:(UIImage*)image{
	return [UIButton buttonWithFrame:frame image:image highlightedImage:nil];
}
+ (id) buttonWithFrame:(CGRect)frame image:(UIImage*)image highlightedImage:(UIImage*)highlightedImage{
	UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
	btn.frame = frame;
	[btn setImage:image forState:UIControlStateNormal];
	[btn setImage:image forState:UIControlStateHighlighted];
    [btn setExclusiveTouch:YES];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)];
    
	return btn;
}
@end
