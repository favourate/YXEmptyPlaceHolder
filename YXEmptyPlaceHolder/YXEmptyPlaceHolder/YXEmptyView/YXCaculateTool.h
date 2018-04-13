//
//  YXCaculateTool.h
//  YXEmptyPlaceHolder
//
//  Created by Color on 2018/4/2.
//  Copyright © 2018年 ColorBlue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

UIKIT_EXTERN CGFloat const labelPadding;

@interface YXCaculateTool : NSObject

+(CGSize)caculateOriginalStr:(NSString *)str font:(CGFloat)font size:(CGSize)size;

+(NSMutableAttributedString *)attributeStrFromOriginalStr:(NSString *)str;

+(NSMutableAttributedString *)attributeStrFromOriginalStr:(NSString *)str padding:(CGFloat)padding font:(CGFloat)font color:(UIColor *)foregroundColor;
@end
