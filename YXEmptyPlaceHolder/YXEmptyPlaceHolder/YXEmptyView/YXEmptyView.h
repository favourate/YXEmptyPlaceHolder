//
//  YXEmptyView.h
//  YXEmptyPlaceHolder
//
//  Created by Color on 2018/3/31.
//  Copyright © 2018年 ColorBlue. All rights reserved.
//

#import "YXEmptyBaseView.h"

@interface YXEmptyView : YXEmptyBaseView

/** 中心视图偏移位置 */
@property (nonatomic , assign) CGFloat contentViewOffSetY;

/** 描述文字的字体 */
@property (nonatomic , strong) UIFont *describeFont;
/** 描述文字的颜色 */
@property (nonatomic , strong) UIColor *describeTextColor;
/** 按钮的border颜色 */
@property (nonatomic , strong) UIColor *btnBorderColor;
/** 按钮的border宽 */
@property (nonatomic , assign) CGFloat btnBorderWidth;
/** 按钮圆角 */
@property (nonatomic , assign) CGFloat btnCornerRadius;
/** 按钮字体颜色 */
@property (nonatomic , strong) UIColor *btnTitleColor;
/** 按钮字体 */
@property (nonatomic , strong) UIFont *btnTitleFont;



@end
