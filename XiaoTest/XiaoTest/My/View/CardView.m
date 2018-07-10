//
//  CardView.m
//  XiaoTest
//
//  Created by shen on 2018/7/7.
//  Copyright © 2018年 shen. All rights reserved.
//

#import "CardView.h"

@implementation CardView{
    UIScrollView *scrollView;
}

+ (CardView *)cardAddSubView:(UIView *)subView{
    CardView *headerView = [[CardView alloc] init];
    [subView addSubview:headerView];
    return headerView;
}

- (void)startSetUp{
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    [self addSubview:scrollView];
    [self addCardWithTitle:@"拍摄人像面" img:@"card——1" type:0];
    [self addCardWithTitle:nil img:@"card——2" type:1];
    [self addCardWithTitle:nil img:@"card——3" type:2];
}

- (void)addCardWithTitle:(NSString *)title img:(NSString *)imgStr type:(NSInteger)type{
    UIImageView *cardImg = [[UIImageView alloc] init];
    [scrollView addSubview:cardImg];
    cardImg.image = [UIImage imageNamed:imgStr];
    [cardImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@75);
        make.right.mas_offset(@-75);
        make.height.mas_offset(@117);
        make.top.mas_offset(15 + (117 +15) * type);
    }];
    UIImageView *touchImg = [[UIImageView alloc] init];
    [cardImg addSubview:touchImg];
    touchImg.image = [UIImage imageNamed:@"card_carmer"];
    [touchImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_offset(@60);
        make.centerX.equalTo(cardImg);
        make.centerY.equalTo(cardImg);
    }];
    if (title) {
        UILabel *cardLab = [[UILabel alloc] init];
        cardLab.text = title;
        cardLab.font = [UIFont systemFontOfSize:12];
        cardLab.textColor = [UIColor blackColor];
        [cardImg addSubview:cardLab];
        [cardLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(touchImg);
            make.top.equalTo(touchImg.mas_bottom).mas_offset(5);
        }];
    }
    
}

@end
