//
//  TradeViewCell.m
//  XiaoTest
//
//  Created by shen on 2018/6/18.
//  Copyright © 2018年 shen. All rights reserved.
//

#import "TradeViewCell.h"

@implementation TradeViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configureModel:(id)model{
    UIView *headerView = [[UIView alloc] init];
    [self.contentView addSubview:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_offset(@0);
        make.height.mas_offset(@30);
    }];
    UIImageView *activeImg = [[UIImageView alloc] init];
    [headerView addSubview:activeImg];
    activeImg.image = [UIImage imageNamed:@"trade_jisuan"];
    activeImg.contentMode = UIViewContentModeCenter;
    [activeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@13);
        make.bottom.mas_offset(@0);
        make.top.mas_offset(@3);
        make.width.mas_offset(@30);
    }];
    UILabel *eidtLab = [[UILabel alloc] initWithFrame:CGRectZero];
    eidtLab.textAlignment = NSTextAlignmentLeft;
    eidtLab.font = [UIFont boldSystemFontOfSize:14];
    eidtLab.textColor = [UIColor darkTextColor];
    [headerView addSubview:eidtLab];
    eidtLab.text = @"1/2期   >";
    [eidtLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(activeImg);
        make.left.equalTo(activeImg.mas_right);
    }];
    UILabel *stateLab = [[UILabel alloc] init];
    stateLab.text = @"待还中";
    stateLab.font = [UIFont systemFontOfSize:13];
    stateLab.textColor = [UIColor redColor];
    [headerView addSubview:stateLab];
    [stateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(@-45);
        make.centerY.equalTo(headerView);
    }];
    UIView *midView = [[UIView alloc] init];
    midView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:midView];
    [midView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(@0);
        make.top.equalTo(headerView.mas_bottom);
        make.height.mas_offset(@60);
    }];
    UIImageView *productImg = [[UIImageView alloc] init];
    [midView addSubview:productImg];
    productImg.contentMode = UIViewContentModeCenter;
    productImg.image = [UIImage imageNamed:@"trade_banner"];
    [productImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@10);
        make.top.mas_offset(@5);
        make.bottom.mas_offset(@5);
        make.width.mas_offset(@80);
    }];
    UILabel *moneryLab = [[UILabel alloc] init];
    [midView addSubview:moneryLab];
    moneryLab.text = @"本期租金";
    moneryLab.font = [UIFont systemFontOfSize:12];
    [moneryLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(stateLab);
        make.top.mas_offset(@5);
    }];
    UILabel *moneryDetailLab = [[UILabel alloc] init];
    [midView addSubview:moneryDetailLab];
    moneryDetailLab.text = @"666.66";
    moneryDetailLab.font = [UIFont systemFontOfSize:16];
    [moneryDetailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(moneryLab);
        make.top.equalTo(moneryLab.mas_bottom).mas_offset(@5);
    }];
    UILabel *midLab = [[UILabel alloc] init];
    [midView addSubview:midLab];
    midLab.textColor = [UIColor darkTextColor];
    midLab.text = @"由于您逾期三天，本产品有租转售\n您将在本期结清剩余所有费用";
    midLab.numberOfLines = 2;
    midLab.font = [UIFont systemFontOfSize:11];
    [midLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(productImg.mas_right).mas_offset(3);
        make.right.equalTo(moneryLab.mas_left).mas_offset(60);
        make.centerY.equalTo(productImg);
        make.height.mas_offset(@40);
    }];
    UIView *footView = [[UIView alloc] init];
    [self.contentView addSubview:footView];
    [footView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@0);
        make.right.mas_offset(@0);
        make.bottom.mas_offset(@0);
        make.top.equalTo(midView.mas_bottom);
    }];
    UILabel *dateLab = [[UILabel alloc] initWithFrame:CGRectZero];
    dateLab.textAlignment = NSTextAlignmentLeft;
    dateLab.font = [UIFont boldSystemFontOfSize:12];
    dateLab.textColor = [UIColor darkTextColor];
    [footView addSubview:dateLab];
    dateLab.text = @"应结算日：2018/06/18";
    [dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(footView);
        make.left.mas_offset(@10);
    }];
    UIImageView *btnImg = [[UIImageView alloc] init];
    [footView addSubview:btnImg];
    btnImg.image = [UIImage imageNamed:@"trade_board"];
    btnImg.contentMode = UIViewContentModeCenter;
    [btnImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(moneryLab);
        make.centerY.equalTo(footView);
        make.height.mas_offset(@25);
        make.width.mas_offset(@58);
    }];
    
    UIButton *activeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [activeBtn setTitle:@"结清" forState:UIControlStateNormal];
    [activeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btnImg addSubview:activeBtn];
    activeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [activeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.mas_offset(@0);
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
