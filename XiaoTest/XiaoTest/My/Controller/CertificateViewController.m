//
//  CertificateViewController.m
//  XiaoTest
//
//  Created by shen on 2018/7/7.
//  Copyright © 2018年 shen. All rights reserved.
//

#import "CertificateViewController.h"
#import "CertificateDetailViewController.h"


@interface CertificateViewController ()

@end

@implementation CertificateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpHeaderView];
    [self setUpDetail];
    // Do any additional setup after loading the view.
}



- (void)setUpHeaderView{
    UIView *headerView = [[UIView alloc] init];
    [self.view addSubview:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(@0);
        make.top.mas_offset(@64);
        make.height.mas_offset(@235);
    }];
    UIImageView *headerImg = [[UIImageView alloc] init];
    [headerView addSubview:headerImg];
    headerImg.image = [UIImage imageNamed:@"auth_icon_phone_bg"];
    [headerImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_offset(@0);
        make.bottom.mas_offset(@-35);
    }];
    UILabel *headLab = [[UILabel alloc] init];
    [headerView addSubview:headLab];
    headLab.text = @"授权信息";
    headLab.font = [UIFont boldSystemFontOfSize:16];
    headLab.textColor = [UIColor blackColor];
    [headLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(@-5);
        make.left.mas_offset(@30);
    }];
    UIView *line = [[UIView alloc] init];
    [headerView addSubview:line];
    line.backgroundColor = [UIColor lightGrayColor];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@30);
        make.right.mas_offset(@-30);
        make.bottom.mas_offset(@0);
        make.height.mas_offset(@.5);
    }];
}
- (void)setUpDetail{
    UIView *detailView = [[UIView alloc] init];
    [self.view addSubview:detailView];
    [detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(@300);
        make.left.mas_offset(@30);
        make.right.mas_offset(@-30);
        make.bottom.mas_offset(@0);
    }];
    NSArray *titleArr = @[@"身份信息",@"个人信息",@"联系人信息",@"常用联系人",@"运营商认证",@"淘宝",@"支付宝认证",@"征信认证"];
    NSArray *imgArr = @[@"auth_icon_id",@"auth_icon_personal",@"auth_icon_contact",@"auth_icon_contact_more",@"auth_icon_run",@"auth_icon_taobao",@"auth_icon_ali",@"auth_icon_school"];
    for (int i = 0; i < 8; i++) {
        CGFloat startX = 0.0f;
        CGFloat startY = 0.0f;
        startX = (KscreenWidth - 60) / 3 * (i % 3);
        startY = 75 * (i / 3);
        UIView *btnView = [[UIView alloc] initWithFrame:CGRectMake(startX, startY, (KscreenWidth - 60) / 3, 75)];
        btnView.tag = 3333 + i;
        [detailView addSubview:btnView];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapCertifiView:)];
        [btnView addGestureRecognizer:tapGesture];
        UIImageView *img = [[UIImageView alloc] init];
        img.contentMode = UIViewContentModeCenter;
        [btnView addSubview:img];
        img.image = [UIImage imageNamed:imgArr[i]];
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(btnView);
            make.centerY.equalTo(btnView).mas_offset(-15);
            make.width.height.mas_equalTo(@25);
        }];
        UILabel *headLab = [[UILabel alloc] init];
        [btnView addSubview:headLab];
        headLab.text = titleArr[i];
        headLab.font = [UIFont systemFontOfSize:13];
        headLab.textColor = [UIColor blackColor];
        [headLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(btnView);
            make.top.equalTo(img.mas_bottom).mas_equalTo(@3);
        }];
    }
}

- (void)handleTapCertifiView:(UIGestureRecognizer *)gesture{
    UIView *gestureView = gesture.view;
    NSInteger gestureTag = gestureView.tag - 3333;
    CertificateDetailViewController *vc = [[CertificateDetailViewController alloc] init];
    switch (gestureTag) {
        case 0:
            vc.sourceType = 0;
            break;
        case 1:
            vc.sourceType = 1;
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            vc.sourceType = 2;
            break;
        case 5:
            vc.sourceType = 3;
            break;
        case 6:
            vc.sourceType = 4;
            break;
        default:
            vc.sourceType = 5;
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
