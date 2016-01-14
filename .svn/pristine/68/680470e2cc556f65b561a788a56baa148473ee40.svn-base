//
//  LOLStringUtility.h
//  LOL
//
//  Created by feibai on 16/1/13.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* strOrEmpty(id str);

extern NSString* numberOrEmpty(NSNumber * str);

extern BOOL isUserLogin();

extern BOOL is7DaysLater(NSString *date);

//extern NSString* formatPriceNumber(NSNumber *value);

extern CGRect reframeWithY(CGRect frame);


@interface LOLStringUtility : NSObject

/**
 *  返回label的size
 *
 *  @param input 内容
 *  @param font  字体
 *  @param width 宽度
 *
 *  @return size
 */
+(CGSize )getStringSize:(NSString*)input font:(UIFont*)font width:(CGFloat)width;
/**
 根据指定的字体，和宽度计算字符串的高度
 @param input 字符串
 @param font  使用的字体
 @param width 宽度
 */
+(CGFloat)getStringHight:(NSString*)input font:(UIFont*)font width:(CGFloat)width;

/**
 根据指定的字体，和高度计算字符串的宽度
 @param input 字符串
 @param font  使用的字体
 @param height 高度
 */
+(CGFloat)getStringWidth:(NSString*)input font:(UIFont*)font height:(CGFloat)height;



@end

