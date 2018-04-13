//
//  YXEmptyBaseView.h
//  YXEmptyPlaceHolder
//
//  Created by Color on 2018/3/31.
//  Copyright © 2018年 ColorBlue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+YXViewCoordinateExtension.h"


typedef void (^btnActionBlock) (void);
@interface YXEmptyBaseView : UIView

/** 背景图 */
@property (nonatomic , strong) UIView *contentView;
/** 图片 */
@property (nonatomic , strong) UIImageView *imgView;
/** 描述 */
@property (nonatomic , strong) UILabel *descLab;
/** 刷新按钮 */
@property (nonatomic , strong) UIButton *refreshBtn;

/** 定制视图，只有在使用类方法创建自定义视图时用到 */
@property (nonatomic , strong) UIView *customView;

/** 图片名 */
@property (nonatomic , copy) NSString *imgStr;
/** 描述文字 */
@property (nonatomic , copy) NSString *describeStr;
/** 按钮文字 */
@property (nonatomic , copy) NSString *btnTitleStr;
/** 按钮返回 */
@property (nonatomic , copy) btnActionBlock actionCallBack;


-(void)prepareGui;

-(void)setupSubViews;
/**
 * 生成视图方法
 @param imgStr 图片名
 @param descStr 描述文字
 @param btnTitle 按钮文字
 @param target
 @prarm action 按钮
 */
+(instancetype)createEmptyViewWithImgStr:(NSString *)imgStr
                             describeStr:(NSString *)descStr
                                btnTitle:(NSString *)btnTitle
                               btnTarget:(id)target
                               btnAction:(SEL)action;

/**
 * 生成视图方法
 @param imgStr 图片名
 @param descStr 描述文字
 @param btnTitle 按钮文字
 @prarm actionBlock 回调
 */
+(instancetype)createEmptyViewWithImgStr:(NSString *)imgStr
                             describeStr:(NSString *)descStr
                                btnTitle:(NSString *)btnTitle
                               btnBlock:(btnActionBlock)actionBlock;

/**
 * 生成视图方法
 @param imgStr 图片名
 @param descStr 描述文字
 */
+(instancetype)createEmptyViewWithImgStr:(NSString *)imgStr
                             describeStr:(NSString *)descStr;
/**
 * 生成视图方法
 @param customView 自定义图
 */
+(instancetype)createEmptyViewCustomView:(UIView *)customView;


@end
