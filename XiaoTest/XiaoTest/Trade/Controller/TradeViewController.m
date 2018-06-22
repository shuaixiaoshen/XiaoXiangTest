//
//  TradeViewController.m
//  XiaoTest
//
//  Created by shen on 2018/6/11.
//  Copyright © 2018年 shen. All rights reserved.
//

#import "TradeViewController.h"
#import "TradeHeaderView.h"
#import "TradeViewCell.h"
#import "SignViewController.h"
@interface TradeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation TradeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NaviBarView *naviBar = [NaviBarView defaultNaviBarWith:self.view];
    naviBar.titleName = @"订单";
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.sectionFooterHeight = 10.0f;
    _tableView.rowHeight = 130.0f;
    [_tableView registerClass:[TradeViewCell class] forCellReuseIdentifier:@"cell"];
    [_tableView registerClass:[TradeHeaderView class] forHeaderFooterViewReuseIdentifier:@"TradeHeaderView"];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(naviBar.mas_bottom);
        make.left.mas_offset(@0);
        make.right.mas_offset(@0);
        make.bottom.mas_offset(@0);
    }];
    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TradeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell configureModel:nil];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    TradeHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"TradeHeaderView"];
    [headerView configureModel:nil];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 245.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SignViewController *signVc = [[SignViewController alloc] init];
    [self presentViewController:signVc animated:YES completion:nil];
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
