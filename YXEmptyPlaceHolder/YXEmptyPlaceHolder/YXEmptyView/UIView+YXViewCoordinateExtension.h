//
//  UIView+YXViewCoordinateExtension.h
//  YXEmptyPlaceHolder
//
//  Created by Color on 2018/3/31.
//  Copyright © 2018年 ColorBlue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YXViewCoordinateExtension)

/** 设置获取视图坐标x */
@property (nonatomic , assign) CGFloat yx_x;
/** 设置获取视图坐标y */
@property (nonatomic , assign) CGFloat yx_y;
/** 设置获取视图中心点坐标x */
@property (nonatomic , assign) CGFloat yx_center_x;
/** 设置获取视图中心点坐标y */
@property (nonatomic , assign) CGFloat yx_center_y;
/** 设置获取视图中心点坐标 */
@property (nonatomic , assign) CGPoint yx_center;
/** 设置获取视图宽 */
@property (nonatomic , assign) CGFloat yx_width;
/** 设置获取视图高 */
@property (nonatomic , assign) CGFloat yx_height;


@end
