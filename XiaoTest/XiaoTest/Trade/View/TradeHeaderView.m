//
//  TradeHeaderView.m
//  XiaoTest
//
//  Created by shen on 2018/6/15.
//  Copyright © 2018年 shen. All rights reserved.
//

#import "TradeHeaderView.h"

@implementation TradeHeaderView

- (void)configureModel:(id)model{
    self.backgroundColor = [UIColor whiteColor];
    UIImageView *headerImg = [[UIImageView alloc] init];
    headerImg.image = [UIImage imageNamed:@"trade_normal"];
    [self.contentView addSubview:headerImg];
    [headerImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_offset(@10);
        make.bottom.mas_offset(@-45);
        make.right.mas_offset(@-10);
    }];
    UILabel *activeLab = [[UILabel alloc] initWithFrame:CGRectZero];
    activeLab.textAlignment = NSTextAlignmentLeft;
    activeLab.font = [UIFont systemFontOfSize:18];
    activeLab.textColor = [UIColor whiteColor];
    [headerImg addSubview:activeLab];
    activeLab.text = @"租";
    [activeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(@3);
        make.left.mas_offset(@3);
    }];
    UILabel *orderLab = [[UILabel alloc] initWithFrame:CGRectZero];
    orderLab.textAlignment = NSTextAlignmentLeft;
    orderLab.font = [UIFont systemFontOfSize:12];
    orderLab.textColor = [UIColor whiteColor];
    [headerImg addSubview:orderLab];
    orderLab.text = @"订单号 123456789";
    [orderLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(@5);
        make.right.mas_offset(@-10);
    }];
    UIView *detailView = [[UIView alloc] initWithFrame:CGRectZero];
    [headerImg addSubview:detailView];
    [detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@25);
        make.right.mas_offset(@-15);
        make.top.mas_offset(@50);
        make.height.mas_offset(@50);
    }];
    UILabel *moblieLab = [[UILabel alloc] initWithFrame:CGRectZero];
    moblieLab.textAlignment = NSTextAlignmentLeft;
    moblieLab.font = [UIFont boldSystemFontOfSize:16];
    moblieLab.textColor = [UIColor whiteColor];
    [detailView addSubview:moblieLab];
    moblieLab.text = @"iPhone X";
    [moblieLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(@0);
        make.left.mas_offset(@0);
    }];
    UILabel *dateLab = [[UILabel alloc] initWithFrame:CGRectZero];
    dateLab.textAlignment = NSTextAlignmentLeft;
    dateLab.font = [UIFont boldSystemFontOfSize:12];
    dateLab.textColor = [UIColor whiteColor];
    [detailView addSubview:dateLab];
    dateLab.text = @"租赁日期：2018/06/15";
    [dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(@0);
        make.left.mas_offset(@0);
    }];
    UIButton *compulteBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [compulteBtn setTitle:@"结清账单" forState:UIControlStateNormal];
    [compulteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    compulteBtn.layer.cornerRadius = 5.0f;
    compulteBtn.layer.masksToBounds = YES;
    compulteBtn.backgroundColor = [UIColor colorWithRed:83 / 255.0 green:149 / 255.0 blue:240 /255.0 alpha:1];
    [detailView addSubview:compulteBtn];
    [compulteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(@-15);
        make.centerY.equalTo(detailView);
        make.width.mas_offset(@95);
    }];
    [self addDetailViewWith:headerImg andIndex:0];
    [self addDetailViewWith:headerImg andIndex:1];
    [self addDetailViewWith:headerImg andIndex:2];
}

- (void)addDetailViewWith:(UIImageView *)headerImg andIndex:(NSInteger)index{
    UIView *detailView = [[UIView alloc] init];
    [headerImg addSubview:detailView];
    [detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset((KscreenWidth - 20) / 3 * index);
        make.width.mas_offset((KscreenWidth - 20) / 3);
        make.height.mas_offset(@45);
        make.bottom.mas_offset(@-10);
    }];
    UILabel *moblieLab = [[UILabel alloc] initWithFrame:CGRectZero];
    moblieLab.textAlignment = NSTextAlignmentCenter;
    moblieLab.font = [UIFont boldSystemFontOfSize:12];
    moblieLab.textColor = [UIColor whiteColor];
    [detailView addSubview:moblieLab];
    moblieLab.text = @"本期租金";
    [moblieLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(@0);
        make.centerX.equalTo(detailView);
    }];
    UILabel *dateLab = [[UILabel alloc] initWithFrame:CGRectZero];
    dateLab.textAlignment = NSTextAlignmentCenter;
    dateLab.font = [UIFont boldSystemFontOfSize:16];
    dateLab.textColor = [UIColor whiteColor];
    [detailView addSubview:dateLab];
    dateLab.text = @"888.00";
    [dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(@0);
        make.centerX.equalTo(detailView);
    }];
    if (index != 2) {
        UILabel *lineLab = [[UILabel alloc] init];
        lineLab.backgroundColor = [UIColor colorWithRed:83 / 255.0 green:149 / 255.0 blue:240 /255.0 alpha:1];
        [detailView addSubview:lineLab];
        [lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(@0);
            make.width.mas_offset(@1);
            make.top.mas_offset(@10);
            make.bottom.mas_offset(@-10);
        }];
    }
}

@end
