//
//  MyViewController.m
//  XiaoTest
//
//  Created by shen on 2018/6/11.
//  Copyright © 2018年 shen. All rights reserved.
//

#import "MyViewController.h"
#import "CertificateViewController.h"
#import "MyCell.h"

@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (weak, nonatomic) IBOutlet NaviBarView *naviBar;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[MyCell class] forCellReuseIdentifier:@"cell"];
    _tableView.sectionFooterHeight = 0.0f;
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_naviBar.mas_bottom);
        make.left.mas_offset(@0);
        make.right.mas_offset(@0);
        make.bottom.mas_offset(@0);
    }];
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 45 * 5 + 15;
    }
    return 45 * 2 + 15;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSArray *imgArr;
    NSArray *titleArr;
    if (indexPath.section == 0) {
        imgArr = @[@"my_18",@"my_14",@"my_16",@"my_18",@"my_20"];
        titleArr = @[@"待审核租赁订单",@"待结清租赁订单",@"租赁结清记录",@"身份信息",@"消息中心",];
    }else{
        imgArr = @[@"my_22",@"my_24"];
        titleArr = @[@"客服帮助",@"设置"];
    }
    [cell configureModelWithimgArr:imgArr titleArr:titleArr];
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 200)];
        [self addHeadViewWith:headerView];
        return headerView;
    }
    return [[UIView alloc] init];
}

- (void)addHeadViewWith:(UIView *)headerView{
    UIImageView *headerImg = [[UIImageView alloc] initWithFrame:CGRectZero];
    [headerView addSubview:headerImg];
    headerImg.layer.cornerRadius = 5.0f;
    headerImg.layer.masksToBounds = YES;
    headerImg.image = [UIImage imageNamed:@"my_03"];
    [headerImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@10);
        make.right.mas_offset(@-10);
        make.top.mas_offset(@0);
        make.bottom.mas_offset(@0);
    }];
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectZero];
    [headerView addSubview:icon];
    icon.layer.cornerRadius = 75 / 2;
    icon.layer.masksToBounds = YES;
    icon.image = [UIImage imageNamed:@"sign_03"];
    icon.backgroundColor = [UIColor whiteColor];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerView);
        make.top.mas_offset(@15);
        make.width.height.mas_offset(@75);
    }];
   
    UILabel *moblieLab = [[UILabel alloc] initWithFrame:CGRectZero];
    moblieLab.textAlignment = NSTextAlignmentCenter;
    moblieLab.font = [UIFont systemFontOfSize:13];
    moblieLab.textColor = [UIColor whiteColor];
    [headerView addSubview:moblieLab];
    moblieLab.text = @"18621973763";
    [moblieLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerImg);
        make.top.equalTo(icon.mas_bottom).mas_offset(10);
    }];
    UILabel *detailLab = [[UILabel alloc] initWithFrame:CGRectZero];
    detailLab.textAlignment = NSTextAlignmentCenter;
    detailLab.font = [UIFont systemFontOfSize:11];
    detailLab.textColor = [UIColor whiteColor];
    [headerView addSubview:detailLab];
    detailLab.text = @"完善个人信息>>";
    [detailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerImg);
        make.top.equalTo(moblieLab.mas_bottom).mas_offset(3);
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 150;
    }
    return 5;
}
- (IBAction)pushSettingController {
    CertificateViewController *vc = [SBMain instantiateViewControllerWithIdentifier:@"CertificateViewController"];
    vc.hidesBottomBarWhenPushed = YES;
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
