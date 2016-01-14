//
//  LOLStringUtility.m
//  LOL
//
//  Created by feibai on 16/1/13.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLStringUtility.h"

@implementation LOLStringUtility


inline NSString* strOrEmpty(id str){
    
    if ([str isKindOfClass:[NSNull class]]|| str == nil) {
        return  @"";
        
    }else if ([str isKindOfClass:[NSNumber class]]) {
        return  [NSString stringWithFormat:@"%@",[str description]];
    }else if([str isKindOfClass:[NSString class]]){
        
        return (NSString *)str;
        
    }else if ([str isEqual:[NSNull null]]) {
        return  @"";
    } else if ([str isEqualToString:@"(null)"]) {
        return @"";
    }
    
    return (str==nil?@"":str);
}

+ (CGSize )getStringSize:(NSString*)input font:(UIFont*)font width:(CGFloat)width{
    if (input == nil || font == nil || width <= 0) {
        return CGSizeMake(0., 0.);
    }
    
    CGSize size ;
    
    size  = [strOrEmpty(input) boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    
    
    return size;
}

+(CGFloat)getStringHight:(NSString*)input font:(UIFont*)font width:(CGFloat)width
{
    if (input == nil || font == nil || width <= 0) {
        return 0.0f;
    }
    
    CGSize size ;
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 3.0;
    size  = [strOrEmpty(input) boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:style} context:nil].size;
    
    return size.height;
}

+(CGFloat)getStringWidth:(NSString*)input font:(UIFont*)font height:(CGFloat)height
{
    if (input == nil || font == nil || height <= 0) {
        return 0.0f;
    }
    
    CGSize size ;
    size  = [strOrEmpty(input) boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    
    return size.width;
}

+ (NSString *)trimmingString:(NSString *)str{
    
    NSString *replaceStr = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *resultStr = [replaceStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return  resultStr;
    
}


@end
