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
@property (weak, nonatomic) IBOutlet NaviBarView *naviBar;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineX;

@property (weak, nonatomic) IBOutlet UIButton *header_one;
@property (weak, nonatomic) IBOutlet UIButton *header_two;
@property (weak, nonatomic) IBOutlet UIButton *header_three;

@end

@implementation TradeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _lineX.constant = -60.0f;
    [self.view updateConstraintsIfNeeded];
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.sectionFooterHeight = 10.0f;
    _tableView.rowHeight = 130.0f;
    [_tableView registerClass:[TradeViewCell class] forCellReuseIdentifier:@"cell"];
    [_tableView registerClass:[TradeHeaderView class] forHeaderFooterViewReuseIdentifier:@"TradeHeaderView"];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_naviBar.mas_bottom);
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
    signVc.isRegist= NO;
    [self presentViewController:signVc animated:YES completion:nil];
}
#pragma mark - 按钮切换 -

- (IBAction)handleTouchHeaderBtn:(UIButton *)sender {
    NSString *btnStr = sender.titleLabel.text;
    if ([btnStr isEqualToString:@"已完成"]) {
        _lineX.constant = -60.0f;
         [_header_one setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_header_two setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_header_three setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }else if ([btnStr isEqualToString:@"待还"]){
        _lineX.constant = 0.0f;
        [_header_one setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_header_two setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_header_three setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }else{
        _lineX.constant = 60.0f;
        [_header_one setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_header_two setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_header_three setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [self.view updateConstraintsIfNeeded];
}
- (IBAction)traerChat:(UIButton *)sender {
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
