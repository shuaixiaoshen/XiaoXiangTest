//
//  HomeViewController.m
//  XiaoTest
//
//  Cr/Users/shen/Downloads/SDCycleScrollView-master/Pods/SDWebImageeated by shen on 2018/6/11.
//  Copyright © 2018年 shen. All rights reserved.
//

#import "HomeViewController.h"
#import "SDCycleScrollView.h"
#import "HomeViewCell.h"
#import "HomeFootCell.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getToken];
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.sectionFooterHeight = 0.0f;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [_tableView registerNib:[UINib nibWithNibName:@"HomeViewCell" bundle:nil] forCellReuseIdentifier:@"HomeViewCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"HomeFootCell" bundle:nil] forCellReuseIdentifier:@"HomeFootCell"];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(@0);
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
        return 190;
    }
    return 160;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        HomeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeViewCell"];
        return cell;
    }
    HomeFootCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeFootCell"];
    return cell;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 250)];
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 200) shouldInfiniteLoop:YES imageNamesGroup:@[@"banner1"]];
        cycleScrollView.delegate = self;
        cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        [headerView addSubview:cycleScrollView];
        [self addCycleFootViewWith:headerView cycleView:cycleScrollView];
        return headerView;
    }
    return [[UIView alloc] init];
}

- (void)addCycleFootViewWith:(UIView *)headerView cycleView:(SDCycleScrollView *)cycleScrollView{
    UIView *footView = [[UIView alloc] init];
    footView.backgroundColor = [UIColor whiteColor];
    [headerView addSubview:footView];
    [footView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(@0);
        make.top.equalTo(cycleScrollView.mas_bottom).mas_offset(@0);
        make.bottom.mas_offset(@0);
    }];
    [self addFootViewWithLeftOrRight:YES andView:footView];
    [self addFootViewWithLeftOrRight:NO andView:footView];
    UILabel *lineLab = [[UILabel alloc] init];
    lineLab.backgroundColor = [UIColor blackColor];
    [footView addSubview:lineLab];
    [lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(footView);
        make.width.mas_offset(@1);
        make.top.mas_offset(@10);
        make.bottom.mas_offset(@-10);
    }];
}

- (void)addFootViewWithLeftOrRight:(BOOL)isLeft andView:(UIView *)footView{
    UIView *detailView = [[UIView alloc] init];
    [footView addSubview:detailView];
    if (isLeft) {
        detailView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame) / 2, 60);
    }else{
        detailView.frame = CGRectMake(CGRectGetMidX(self.view.frame), 0, CGRectGetWidth(self.view.frame) / 2, 60);
    }
    UIImageView *activeImg = [[UIImageView alloc] init];
    [detailView addSubview:activeImg];
    activeImg.contentMode = UIViewContentModeCenter;
    [activeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        if (isLeft) {
            make.centerX.equalTo(detailView).mas_offset(@-20);
        }else{
            make.centerX.equalTo(detailView).mas_offset(@-50);
        }
        make.centerY.equalTo(detailView);
        make.width.height.mas_offset(@50);
    }];
    UILabel *nameLab = [[UILabel alloc] initWithFrame:CGRectZero];
    nameLab.textAlignment = NSTextAlignmentCenter;
    nameLab.font = [UIFont systemFontOfSize:13];
    nameLab.textColor = [UIColor blackColor];
    [detailView addSubview:nameLab];
    [nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(@10);
        make.left.equalTo(activeImg.mas_right).mas_offset(10);
//        make.right.mas_offset(-3);
        make.width.mas_offset(@60);
    }];
    UILabel *detailLab = [[UILabel alloc] initWithFrame:CGRectZero];
    detailLab.textAlignment = NSTextAlignmentCenter;
    detailLab.font = [UIFont systemFontOfSize:13];
    detailLab.textColor = [UIColor blackColor];
    [detailView addSubview:detailLab];
    [detailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(@-10);
        make.centerX.equalTo(nameLab);
    }];
    if (isLeft) {
        activeImg.image = [UIImage imageNamed:@"index-ico_05"];
        nameLab.text = @"每期租金";
        detailLab.text = @"¥550.00";
    }else{
        activeImg.image = [UIImage imageNamed:@"index-ico_07"];
        nameLab.text = @"逾期费率";
        detailLab.text = @"3%";
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 260;
    }
    return 0;
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

