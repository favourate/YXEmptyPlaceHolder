//
//  YXCaculateTool.m
//  YXEmptyPlaceHolder
//
//  Created by Color on 2018/4/2.
//  Copyright © 2018年 ColorBlue. All rights reserved.
//

#import "YXCaculateTool.h"

CGFloat const labelPadding = 10;

@implementation YXCaculateTool

+(CGSize)caculateOriginalStr:(NSString *)str font:(CGFloat)font size:(CGSize)size
{
    return [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
}

+(NSMutableAttributedString *)attributeStrFromOriginalStr:(NSString *)str
{
    return [YXCaculateTool attributeStrFromOriginalStr:str padding:labelPadding font:0 color:nil];
}

+(NSMutableAttributedString *)attributeStrFromOriginalStr:(NSString *)str padding:(CGFloat)padding font:(CGFloat)font color:(nullable UIColor *)foregroundColor
{
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:str];
    
    if (padding > 0) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.paragraphSpacing = padding;
        [attributeStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, str.length)];
    }
    if (font > 0) {
        [attributeStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:NSMakeRange(0, str.length)];
    }
    if (foregroundColor != nil) {
         [attributeStr addAttribute:NSForegroundColorAttributeName value:foregroundColor range:NSMakeRange(0, str.length)];
    }
    
    return attributeStr;
}
@end
