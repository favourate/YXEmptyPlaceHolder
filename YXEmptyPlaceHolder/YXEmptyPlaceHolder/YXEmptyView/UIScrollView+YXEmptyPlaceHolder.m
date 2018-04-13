//
//  UIScrollView+YXEmptyPlaceHolder.m
//  YXEmptyPlaceHolder
//
//  Created by Color on 2018/3/31.
//  Copyright © 2018年 ColorBlue. All rights reserved.
//

#import "UIScrollView+YXEmptyPlaceHolder.h"
#import <objc/runtime.h>
#import "YXEmptyView.h"


@implementation NSObject (YXMethodChange)
+(void)originalMethod:(SEL)methodOne changeWithMethodTwo:(SEL)methodTwo{
    method_exchangeImplementations(class_getInstanceMethod(self, methodOne), class_getInstanceMethod(self, methodTwo));
}
@end
@implementation UIScrollView (YXEmptyPlaceHolder)

static char emptyViewKey;

-(void)showEmptyViewWithRowOrSectionCount:(NSInteger)count imgViewName:(NSString *)imgStr describeStr:(NSString *)describeStr refreshBtnStr:(NSString *)refreshBtnStr target:(id)target action:(SEL)action
{
    if (!count) {
        YXEmptyView *emptyView = [YXEmptyView createEmptyViewWithImgStr:imgStr describeStr:describeStr btnTitle:refreshBtnStr btnTarget:target btnAction:action];
        emptyView.frame = self.frame;
        [self addSubview:emptyView];
        [emptyView bringSubviewToFront:self];
    }else
    {
        for (UIView *sub in self.subviews) {
            if ([sub isKindOfClass:[YXEmptyView class]]) {
                [sub removeFromSuperview];
            }
        }
    }
}

-(void)setEmptyView:(YXEmptyView *)emptyView
{
//    for (UIView *sub in self.subviews) {
//        if ([sub isKindOfClass:[YXEmptyView class]]) {
//            [sub removeFromSuperview];
//            break;
//        }
//    }
    objc_setAssociatedObject(self, &emptyViewKey, emptyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self addSubview:emptyView];
}

-(YXEmptyView *)emptyView
{
    return  objc_getAssociatedObject(self, &emptyViewKey);
}


-(void)yx_startLoading
{
    self.emptyView.hidden = YES;
}
-(void)yx_endLoading
{
    if ([self totalCellNum] == 0) {
        self.emptyView.hidden = NO;
    }else
    {
        self.emptyView.hidden = YES;
    }
}

-(void)yx_showEmptyView
{
//    [self.emptyView.superview layoutSubviews];
    
    self.emptyView.hidden = NO;
    [self bringSubviewToFront:self.emptyView];
}
-(void)yx_hideEmptyView
{
    self.emptyView.hidden = YES;
}


-(NSInteger)totalCellNum{
    
    NSInteger totalNum = 0;
    if ([self isKindOfClass:[UITableView class]]) {
        UITableView *tableView = (UITableView *)self;
        for (NSInteger i = 0; i< tableView.numberOfSections; i++) {
            totalNum += [tableView numberOfRowsInSection:i];
        }
    }else if ([self isKindOfClass:[UICollectionView class]]){
        UICollectionView *collectionView = (UICollectionView *)self;
        for (NSInteger i = 0; i< collectionView.numberOfSections; i++) {
            totalNum += [collectionView numberOfItemsInSection:i];
        }
    }
    
    return totalNum;
}

-(void)getAllDataCell{
    
    if (self.emptyView == nil) {
        return;
    }
    
    if ([self totalCellNum] == 0) {
        [self yx_showEmptyView];
    }else
    {
        [self yx_hideEmptyView];
    }
    
}


@end

@implementation UITableView (YXEmptyTableView)

+(void)load
{
    [self originalMethod:@selector(reloadData) changeWithMethodTwo:@selector(yx_reloadData)];
    
    [self originalMethod:@selector(insertSections:withRowAnimation:) changeWithMethodTwo:@selector(yx_insertSections:withRowAnimation:)];
    [self originalMethod:@selector(deleteSections:withRowAnimation:) changeWithMethodTwo:@selector(yx_deleteSections:withRowAnimation:)];
    [self originalMethod:@selector(reloadSections:withRowAnimation:) changeWithMethodTwo:@selector(yx_reloadSections:withRowAnimation:)];
    
    [self originalMethod:@selector(insertRowsAtIndexPaths:withRowAnimation:) changeWithMethodTwo:@selector(yx_insertRowsAtIndexPaths:withRowAnimation:)];
    [self originalMethod:@selector(deleteRowsAtIndexPaths:withRowAnimation:) changeWithMethodTwo:@selector(yx_deleteRowsAtIndexPaths:withRowAnimation:)];
    [self originalMethod:@selector(reloadRowsAtIndexPaths:withRowAnimation:) changeWithMethodTwo:@selector(yx_reloadRowsAtIndexPaths:withRowAnimation:)];
    
}
-(void)yx_reloadData
{
    [self yx_reloadData];
    [self getAllDataCell];
}
-(void)yx_reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation
{
    [self yx_reloadSections:sections withRowAnimation:animation];
    [self getAllDataCell];
}
-(void)yx_insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation
{
    [self yx_insertSections:sections withRowAnimation:animation];
    [self getAllDataCell];
}
-(void)yx_deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation
{
    [self yx_deleteSections:sections withRowAnimation:animation];
    [self getAllDataCell];
}
-(void)yx_insertRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{
    [self yx_insertRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self getAllDataCell];
}
-(void)yx_deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{
    [self yx_deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self getAllDataCell];
}
-(void)yx_reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{
    [self yx_reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self getAllDataCell];
}




@end
@implementation UICollectionView (YXEmptyCollectionView)

+(void)load{
    
    [self originalMethod:@selector(reloadData) changeWithMethodTwo:@selector(yx_reloadData)];
    [self originalMethod:@selector(insertSections:withRowAnimation:) changeWithMethodTwo:@selector(yx_insertSections:withRowAnimation:)];
    [self originalMethod:@selector(deleteSections:withRowAnimation:) changeWithMethodTwo:@selector(yx_deleteSections:withRowAnimation:)];
    [self originalMethod:@selector(reloadSections:withRowAnimation:) changeWithMethodTwo:@selector(yx_reloadSections:withRowAnimation:)];
    
    [self originalMethod:@selector(insertRowsAtIndexPaths:withRowAnimation:) changeWithMethodTwo:@selector(yx_insertRowsAtIndexPaths:withRowAnimation:)];
    [self originalMethod:@selector(deleteRowsAtIndexPaths:withRowAnimation:) changeWithMethodTwo:@selector(yx_deleteRowsAtIndexPaths:withRowAnimation:)];
    [self originalMethod:@selector(reloadRowsAtIndexPaths:withRowAnimation:) changeWithMethodTwo:@selector(yx_reloadRowsAtIndexPaths:withRowAnimation:)];
}


-(void)yx_reloadData
{
    [self yx_reloadData];
}
-(void)yx_reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation
{
    [self yx_reloadSections:sections withRowAnimation:animation];
    [self getAllDataCell];
}
-(void)yx_insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation
{
    [self yx_insertSections:sections withRowAnimation:animation];
    [self getAllDataCell];
}
-(void)yx_deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation
{
    [self yx_deleteSections:sections withRowAnimation:animation];
    [self getAllDataCell];
}
-(void)yx_insertRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{
    [self yx_insertRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self getAllDataCell];
}
-(void)yx_deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{
    [self yx_deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self getAllDataCell];
}
-(void)yx_reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{
    [self yx_reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self getAllDataCell];
}


@end
