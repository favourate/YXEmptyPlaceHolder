//
//  UIScrollView+YXEmptyPlaceHolder.h
//  YXEmptyPlaceHolder
//
//  Created by Color on 2018/3/31.
//  Copyright © 2018年 ColorBlue. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YXEmptyView;
@interface UIScrollView (YXEmptyPlaceHolder)


/**
 * 该方法用于显示页面数据源为空时的页面  老方法（就只是简单创建一个）
 @param count 这个是数据源的数量
 @param imgStr 图片名
 @param describeStr 描述文字 仅显示一行
 @param refreshBtnStr 按钮文字
 @param target 目标
 
 大致原理其实都是当tableView 或者 collectionView 没有cell的时候显示，有cell的时候移除
 
 */
-(void)showEmptyViewWithRowOrSectionCount:(NSInteger)count
                              imgViewName:(NSString *)imgStr
                              describeStr:(NSString *)describeStr
                            refreshBtnStr:(NSString *)refreshBtnStr
                                   target:(id)target
                                   action:(SEL)action;



/**
 * 下面一堆是网上通用的一种方法，通过直接
 *
 */

/** 空页面 */
@property (nonatomic , strong) YXEmptyView *emptyView;

/** 开始加载数据时隐藏 */
-(void)yx_startLoading;
/** 加载完数据进行判断是否显示 */
-(void)yx_endLoading;
/** 显示 */
-(void)yx_showEmptyView;
/** 隐藏 */
-(void)yx_hideEmptyView;


@end
