//
//  NaviBarView.m
//  YYTest
//
//  Created by shen on 2017/3/22.
//  Copyright © 2017年 dingyuankeji. All rights reserved.
//

#import "NaviBarView.h"

@implementation NaviBarView{
    UILabel *titleLab;
    
}

- (instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self common];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
         [self common];
    }
    return self;
}

- (void)common{
//    self.backgroundColor = [UIColor whiteColor];
    titleLab = [[UILabel alloc] initWithFrame:CGRectMake(KscreenWidth / 2 - KscreenWidth / 3 / 2, 34, KscreenWidth  / 3, 20)];
    titleLab.font = [UIFont boldSystemFontOfSize:18];
    titleLab.textColor = [UIColor darkTextColor];
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.adjustsFontSizeToFitWidth = YES;
    [self addSubview:titleLab];
    _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _backBtn.frame = CGRectMake(10, 20, 100, 40);
    _backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    [_backBtn setImage:[UIImage imageNamed:@"back_arrow"] forState:UIControlStateNormal];
    [_backBtn setTitle:@"<" forState:UIControlStateNormal];
    [_backBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(popToRootController) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_backBtn];
    if (_backBtn.isHidden) {
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 63.5, KscreenWidth, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:line];
    }
}

- (void)setIsHidden:(BOOL)isHidden{
    if (isHidden) {
        _backBtn.hidden = YES;
    }else{
        _backBtn.hidden = NO;
    }
}

- (void)popToRootController{
    UIViewController *vc = [self viewController];
    if (vc) {
        if (vc.navigationController) {
            if (_isBackRootVC) {
              [vc.navigationController popToRootViewControllerAnimated:YES];
            }else{
                [vc.navigationController popViewControllerAnimated:YES];
            }
            
        }else{
            [vc dismissViewControllerAnimated:YES completion:nil];
        }
    }
    
}

//获取当前屏幕显示的viewcontroller
-(UIViewController*)viewController
{
    UIResponder *next = self.nextResponder;
    while (next!=nil)
    {
        if([next isKindOfClass:[UIViewController class]])
        {
            return (UIViewController*)next;
        }else
        {
            next = next.nextResponder;
        }
        
    }
    return nil;
}


- (void)setTitle:(NSString *)title{
    _title = title;
    titleLab.text = _title;
}

@end
