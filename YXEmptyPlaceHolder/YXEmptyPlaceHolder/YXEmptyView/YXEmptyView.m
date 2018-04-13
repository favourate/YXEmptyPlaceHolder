//
//  YXEmptyView.m
//  YXEmptyPlaceHolder
//
//  Created by Color on 2018/3/31.
//  Copyright © 2018年 ColorBlue. All rights reserved.
//

#import "YXEmptyView.h"

#import "YXCaculateTool.h"

#define DescribeFont      [UIFont systemFontOfSize:14]
#define DescribeTextColor [UIColor lightGrayColor]
#define BtnTitleFont      [UIFont systemFontOfSize:12]
#define BtnTitleColor     [UIColor lightGrayColor]
#define BtnBorderColor    [UIColor blueColor]



@implementation YXEmptyView
{
    CGFloat emptyImgHeight;
    CGFloat descLabHeight;
    CGFloat btnHeight;
    CGFloat contentViewHeight;
}
static CGFloat const btnRadius = 5;
static CGFloat const borderWidth = 0.5;
static CGFloat const containerSpace = 15;

-(void)prepareGui
{
    [super prepareGui];
}
-(void)setupSubViews
{
    [super setupSubViews];
    [self creatDefaultColor];
}

-(void)creatDefaultColor{
    
    
    _describeFont = self.describeFont == nil ? DescribeFont : self.describeFont;
    _describeTextColor = self.describeTextColor == nil ? DescribeTextColor : self.describeTextColor;
    _btnTitleFont = self.btnTitleFont == nil ? BtnTitleFont : self.btnTitleFont;
    _btnTitleColor = self.btnTitleColor == nil ? BtnTitleColor : self.btnTitleColor;
    _btnBorderColor = self.btnBorderColor == nil ? BtnBorderColor : self.btnBorderColor;
    _btnCornerRadius = !self.btnCornerRadius ? btnRadius : self.btnCornerRadius;
    _btnBorderWidth = !self.btnBorderWidth  ? borderWidth : self.btnBorderWidth;
    
    [self setAllSubViewPropertys];
}

-(void)setAllSubViewPropertys{
    self.descLab.font = _describeFont;
    self.descLab.textColor = _describeTextColor;
    [self.refreshBtn setTitleColor:_btnTitleColor forState:UIControlStateNormal];
    self.refreshBtn.layer.borderWidth = _btnBorderWidth;
    self.refreshBtn.layer.borderColor = _btnBorderColor.CGColor;
    self.refreshBtn.layer.cornerRadius = _btnCornerRadius;
    self.refreshBtn.titleLabel.font = _btnTitleFont;
    
    [self setSubViewFrame];
}

-(void)setSubViewFrame{
    /*****************************/
    UIImage *img = [UIImage imageNamed:self.imgStr];
    CGFloat imgWidth = img.size.width;
    CGFloat imgHeight = img.size.height;
    if (imgWidth >= imgHeight) {
        if (imgWidth > self.yx_width) {
            imgWidth = imgHeight / imgWidth * (self.yx_width - 30);
            imgHeight = self.yx_width - 30;
        }
    }else
    {
        if (imgHeight > self.yx_width) {
            imgWidth = imgHeight / imgWidth * (self.yx_width - 30);
            imgHeight = self.yx_width - 30;
        }
    }
    contentViewHeight = 0 + imgHeight;
    self.imgView.frame = CGRectMake(0, 0, imgWidth, imgHeight);
    self.imgView.yx_center_x = self.yx_center_x;
    /*****************************/
    if (self.describeStr.length > 0) {
        CGSize size = [YXCaculateTool caculateOriginalStr:self.describeStr font:14 size:CGSizeMake(1000, 14)];
        
        self.descLab.frame = CGRectMake(0, contentViewHeight + containerSpace, size.width, size.height);
        self.descLab.yx_center_x = self.yx_center_x;
        contentViewHeight += contentViewHeight + containerSpace + size.height;
    }
    
    
    if (self.btnTitleStr.length > 0) {
        self.refreshBtn.frame = CGRectMake(0, contentViewHeight, 70, 40);
        self.refreshBtn.yx_center_x = self.yx_center_x;
        contentViewHeight += contentViewHeight + 70 + containerSpace;
    }
    
    self.contentView.frame = CGRectMake(0, 0, self.yx_width, contentViewHeight);
    self.contentView.yx_center = self.center;
    
}








#pragma mark - -------------------setter -------------


-(void)setContentViewOffSetY:(CGFloat)contentViewOffSetY
{
    _contentViewOffSetY = contentViewOffSetY;
}

-(void)setDescribeFont:(UIFont *)describeFont
{
    _describeFont = describeFont;
}
-(void)setDescribeTextColor:(UIColor *)describeTextColor
{
    _describeTextColor = describeTextColor;
}
-(void)setBtnTitleFont:(UIFont *)btnTitleFont
{
    _btnTitleFont = btnTitleFont;
}
-(void)setBtnTitleColor:(UIColor *)btnTitleColor
{
    _btnTitleColor = btnTitleColor;
}
-(void)setBtnBorderColor:(UIColor *)btnBorderColor
{
    _btnBorderColor = btnBorderColor;
}
-(void)setBtnCornerRadius:(CGFloat)btnCornerRadius
{
    _btnCornerRadius = btnCornerRadius;
}
-(void)setBtnBorderWidth:(CGFloat)btnBorderWidth
{
    _btnBorderWidth = btnBorderWidth;
}





@end
