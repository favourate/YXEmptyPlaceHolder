//
//  UIView+YXViewCoordinateExtension.m
//  YXEmptyPlaceHolder
//
//  Created by Color on 2018/3/31.
//  Copyright © 2018年 ColorBlue. All rights reserved.
//

#import "UIView+YXViewCoordinateExtension.h"

@implementation UIView (YXViewCoordinateExtension)

#pragma mark - x
-(void)setYx_x:(CGFloat)yx_x
{
    CGRect frame = self.frame;
    frame.origin.x = yx_x;
    self.frame = frame;
}

-(CGFloat)yx_x
{
    return self.frame.origin.x;
}
#pragma mark - y
-(void)setYx_y:(CGFloat)yx_y
{
    CGRect frame = self.frame;
    frame.origin.y = yx_y;
    self.frame = frame;
}
-(CGFloat)yx_y
{
    return self.frame.origin.y;
}

#pragma mark - center_x
-(void)setYx_center_x:(CGFloat)yx_center_x
{
    CGPoint center = self.center;
    center.x = yx_center_x;
    self.center = center;
}
-(CGFloat)yx_center_x
{
    return self.center.x;
}
#pragma mark - center_y
-(void)setYx_center_y:(CGFloat)yx_center_y
{
    CGPoint center = self.center;
    center.y = yx_center_y;
    self.center = center;
}

-(CGFloat)yx_center_y
{
    return self.center.y;
}
#pragma mark - center
-(void)setYx_center:(CGPoint)yx_center
{
    self.center = yx_center;
}
-(CGPoint)yx_center
{
    return self.center;
}
#pragma mark - width
-(CGFloat)yx_width
{
    return self.frame.size.width;
}

-(void)setYx_width:(CGFloat)yx_width
{
    CGRect frame = self.frame;
    frame.size.width = yx_width;
    self.frame = frame;
}
#pragma mark - height
-(void)setYx_height:(CGFloat)yx_height{
    CGRect frame = self.frame;
    frame.size.height = yx_height;
    self.frame = frame;
}
-(CGFloat)yx_height
{
    return self.frame.size.height;
}

@end
