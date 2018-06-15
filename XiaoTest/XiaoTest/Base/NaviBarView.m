//
//  NaviBarView.m
//  XiaoTest
//
//  Created by shen on 2018/6/13.
//  Copyright © 2018年 shen. All rights reserved.
//

#import "NaviBarView.h"

@implementation NaviBarView

- (instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

+ (NaviBarView *)defaultNaviBarWith:(UIView *)aView{
    NaviBarView *navi = [[NaviBarView alloc] init];
    navi.backgroundColor = [UIColor clearColor];
    [aView addSubview:navi];
    [navi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_offset(@0);
        make.height.mas_offset(@64);
    }];
    return navi;
}

- (void)setTitleName:(NSString *)titleName{
    _titleName = titleName;
    [self initView];
}

- (void)initView{
    UILabel *moblieLab = [[UILabel alloc] initWithFrame:CGRectZero];
    moblieLab.textAlignment = NSTextAlignmentLeft;
    moblieLab.font = [UIFont systemFontOfSize:18];
    moblieLab.textColor = [UIColor blackColor];
    [self addSubview:moblieLab];
    if (_titleName) {
       moblieLab.text = _titleName;
    }
   
    [moblieLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.mas_offset(30);
    }];
    
}

@end
