//
//  YXEmptyBaseView.m
//  YXEmptyPlaceHolder
//
//  Created by Color on 2018/3/31.
//  Copyright © 2018年 ColorBlue. All rights reserved.
//

#import "YXEmptyBaseView.h"
@interface YXEmptyBaseView()



@end
@implementation YXEmptyBaseView


-(instancetype)init
{
    self = [super init];
    if (self) {
        [self prepareGui];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    UIView *subV = self.superview;
    if (subV && [subV isKindOfClass:[UIScrollView class]]) {
        self.yx_width = subV.yx_width;
        self.yx_height = subV.yx_height;
    }
    
    [self setupSubViews];
    
}

-(void)prepareGui
{
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  
}



-(void)setSubViewValues{
    
}

-(void)setupSubViews
{
    
}
#pragma mark - lazy

-(UIView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = [UIColor clearColor];
        [self addSubview:_contentView];
    }
    return _contentView;
}
-(UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_imgView];
    }
    return _imgView;
}
-(UILabel *)descLab
{
    if (!_descLab) {
        _descLab = [[UILabel alloc] initWithFrame:CGRectZero];
        _descLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_descLab];
    }
    return _descLab;
}

-(UIButton *)refreshBtn
{
    if (!_refreshBtn) {
        _refreshBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_refreshBtn];
    }
    return _refreshBtn;
}
#pragma mark - ---------------initMethod -------
+(instancetype)createEmptyViewCustomView:(UIView *)customView
{
    YXEmptyBaseView *baseView = [[self alloc] init];
    baseView.customView = customView;
    [baseView createContentViewWithCustomView];
//    baseView.
    return baseView;
}

+(instancetype)createEmptyViewWithImgStr:(NSString *)imgStr describeStr:(NSString *)descStr
{
    YXEmptyBaseView *baseView = [[self alloc] init];
    [baseView creatContentViewWithImgStr:imgStr describeStr:descStr];
    return baseView;
}

+(instancetype)createEmptyViewWithImgStr:(NSString *)imgStr describeStr:(NSString *)descStr btnTitle:(NSString *)btnTitle btnBlock:(btnActionBlock)actionBlock{
    YXEmptyBaseView *baseView = [[self alloc] init];
    [baseView creatContentViewWithImgStr:imgStr describeStr:descStr];
    [baseView creatBtnWithBtnTitle:btnTitle Target:nil sel:nil block:actionBlock];
    return baseView;
}
+(instancetype)createEmptyViewWithImgStr:(NSString *)imgStr describeStr:(NSString *)descStr btnTitle:(NSString *)btnTitle btnTarget:(id)target btnAction:(SEL)action
{
    YXEmptyBaseView *baseView = [[self alloc] init];
    [baseView creatContentViewWithImgStr:imgStr describeStr:descStr];
    [baseView creatBtnWithBtnTitle:btnTitle Target:target sel:action block:nil];
    return baseView;
}

-(void)createContentViewWithCustomView{
    
    if (!_contentView) {
        [self contentView];
        if (_customView) {
            [self.contentView addSubview:_customView];
        }
    }
    
}

-(void)creatContentViewWithImgStr:(NSString *)imgStr describeStr:(NSString *)describeStr{
    
    _imgStr = imgStr;
    _describeStr = describeStr;

    if (!_imgView) {
        [self imgView];
        self.imgView.image = [UIImage imageNamed:imgStr];
    }
    
    if (describeStr.length > 0) {
        [self descLab];
        self.descLab.text = _describeStr;
    }
}

-(void)creatBtnWithBtnTitle:(NSString *)btnTitle Target:(id)target sel:(SEL)sel block:(btnActionBlock)block{
    
    _btnTitleStr = btnTitle;
    
    if (btnTitle) {
        [self refreshBtn];
    }
    if (target !=nil && sel != nil) {
        [self.refreshBtn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (block) {
        if (self.actionCallBack) {
            self.actionCallBack();
        }
    }
}



#pragma mark - ---------setter----------------

-(void)setDescribeStr:(NSString *)describeStr
{
    _describeStr = describeStr;
    self.descLab.text = describeStr;
}
-(void)setImgStr:(NSString *)imgStr
{
    _imgStr = imgStr;
    self.imgView.image = [UIImage imageNamed:imgStr];
}
-(void)setBtnTitleStr:(NSString *)btnTitleStr
{
    _btnTitleStr = btnTitleStr;
    [self.refreshBtn setTitle:btnTitleStr forState:UIControlStateNormal];
}
@end
