//
//  HomeDetailViewController.m
//  XiaoTest
//
//  Created by shen on 2018/7/11.
//  Copyright © 2018年 shen. All rights reserved.
//

#import "HomeDetailViewController.h"
#import "OrderViewController.h"

#define blueColor [UIColor colorWithRed:98 /255.0 green:161 / 255.0 blue:242 / 255.0 alpha:1]
#define defaultColor [UIColor grayColor]
#define blueLayerColor [UIColor colorWithRed:188 /255.0 green:217 / 255.0 blue:246 / 255.0 alpha:1].CGColor
#define defaultLayerColor [UIColor lightGrayColor].CGColor
@interface HomeDetailViewController ()

@property(strong, nonatomic) UIScrollView *scrollView;

@end

@implementation HomeDetailViewController{
    UIView *baseView;
    NSArray *netArr;
    NSArray *colorArr;
    NSArray *memaryArr;
    NSArray *timeArr;
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 64)];
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame), 340 + 250 + 64);
        baseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KscreenWidth, 340 + 250 + 64)];
        [_scrollView addSubview:baseView];
    }
    return _scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NaviBarView *naviBar = [[NaviBarView alloc] init];
    naviBar.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    naviBar.title = @"商品详情";
    [self.view addSubview:self.scrollView];
    [self.view addSubview:naviBar];
    [self addHeaderWith:naviBar];
    // Do any additional setup after loading the view.
}

- (void)addHeaderWith:(UIView *)aView{
    UIView *headerView = [[UIView alloc] init];
    headerView.layer.cornerRadius = 8.0f;
    headerView.layer.masksToBounds = YES;
    headerView.backgroundColor = [UIColor whiteColor];
    [baseView addSubview:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(@0);
        make.left.mas_offset(@15);
        make.right.mas_offset(@-15);
        make.height.mas_offset(@340);
    }];
    UIImageView *addressImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iPhone X1"]];
    addressImg.contentMode = UIViewContentModeCenter;
    [headerView addSubview:addressImg];
    [addressImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(@20);
        make.centerX.equalTo(headerView);
        make.width.mas_offset(@115);
        make.height.mas_offset(@200);
    }];
    UILabel *productLab = [[UILabel alloc] init];
    productLab.text = @"iPhone X 我有,你也有";
    productLab.font = [UIFont boldSystemFontOfSize:14];
    [headerView addSubview:productLab];
    [productLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@20);
        make.bottom.mas_offset(@-50);
    }];
    UILabel *moneyLab = [[UILabel alloc] init];
    moneyLab.text = @"￥399.99/月";
    moneyLab.font = [UIFont boldSystemFontOfSize:14];
    [headerView addSubview:moneyLab];
    [moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@20);
        make.bottom.mas_offset(@-15);
    }];
    UILabel *allMoneyLab = [[UILabel alloc] init];
    allMoneyLab.text = @"商品价值￥8913";
    allMoneyLab.font = [UIFont systemFontOfSize:9];
    [headerView addSubview:allMoneyLab];
    [allMoneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(@-20);
        make.centerY.equalTo(moneyLab);
    }];
    [self addMidviewWith:headerView];
}

- (void)addMidviewWith:(UIView *)aView{
    UIView *midView = [[UIView alloc] init];
    [baseView addSubview:midView];
    [midView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(aView.mas_bottom);
        make.height.mas_offset(@250);
        make.left.right.mas_offset(@0);
    }];
    netArr = @[@"全网通"];
    [self addMidDetailViewWithTitle:@"网络" andTitleDetailArr:netArr aView:midView type:0];
    colorArr = @[@"黑色",@"白色",@"金色"];
    [self addMidDetailViewWithTitle:@"颜色" andTitleDetailArr:colorArr aView:midView type:1];
    memaryArr = @[@"64GB",@"128GB",@"256GB"];
    [self addMidDetailViewWithTitle:@"内存" andTitleDetailArr:memaryArr aView:midView type:2];
    timeArr = @[@"3月",@"6月",@"9月"];
    [self addMidDetailViewWithTitle:@"租期" andTitleDetailArr:timeArr aView:midView type:3];
    UIButton *requestBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    requestBtn.backgroundColor = [UIColor colorWithRed:73 /255.0 green:146 / 255.0 blue:241 / 255.0 alpha:1];
    requestBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [requestBtn setTitle:@"确认申请" forState:UIControlStateNormal];
    [midView addSubview:requestBtn];
    [requestBtn addTarget:self action:@selector(handleRequestBtn) forControlEvents:UIControlEventTouchUpInside];
    [requestBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(@32);
        make.left.mas_offset(@40);
        make.right.mas_offset(@-40);
        make.bottom.mas_offset(@-20);
    }];
}

- (void)addMidDetailViewWithTitle:(NSString *)title andTitleDetailArr:(NSArray *)titleArr aView:(UIView *)aView type:(NSInteger)type{
    UIView *midView = [[UIView alloc] init];
    [aView addSubview:midView];
    [midView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@15);
        make.right.mas_offset(@-15);
        make.height.mas_offset(@45);
        make.top.mas_offset(type * 45);
    }];
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.text = title;
    titleLab.font = [UIFont systemFontOfSize:13];
    [midView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@10);
        make.centerY.equalTo(midView);
    }];
    for (NSInteger i = 0;i < titleArr.count; i++) {
        UIButton *aBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        if (i == 0) {
          aBtn.layer.borderColor = blueLayerColor;
          [aBtn setTitleColor:blueColor forState:UIControlStateNormal];
        }else{
          aBtn.layer.borderColor = defaultLayerColor;
          [aBtn setTitleColor:defaultColor forState:UIControlStateNormal];
        }
        aBtn.layer.cornerRadius = 3.0f;
        aBtn.layer.masksToBounds = YES;
        aBtn.layer.borderWidth = 1.5f;
        aBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [aBtn setTitle:titleArr[i] forState:UIControlStateNormal];
        [midView addSubview:aBtn];
        [aBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_offset(@26);
            make.width.mas_offset(@57);
            make.centerY.equalTo(midView);
            if (KscreenWidth == 320) {
                make.left.equalTo(titleLab.mas_right).mas_offset(i * (57 + 22) + 27);
            }else{
                make.left.equalTo(titleLab.mas_right).mas_offset(i * (57 + 22) + 57);
            }
            
        }];
        aBtn.tag = 3333 + i + type * 1000;
        [aBtn addTarget:self action:@selector(handleChangeBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
}


- (void)handleChangeBtn:(UIButton *)btn{
    NSInteger type = (btn.tag - 3333) / 1000;
    NSInteger count = 0;
    switch (type) {
        case 0:
            count = netArr.count;
            break;
        case 1:
            count = colorArr.count;
            break;
        case 2:
            count = memaryArr.count;
            break;
        case 3:
            count = timeArr.count;
            break;
        default:
            break;
    }
    for (NSInteger i = 0; i < count; i++) {
        NSInteger currentTag = 3333 + i + type * 1000;
        if (btn.tag == currentTag) {
            btn.layer.borderColor = blueLayerColor;
            [btn setTitleColor:blueColor forState:UIControlStateNormal];
        }else{
            UIButton *otherBtn = [baseView viewWithTag:currentTag];
            otherBtn.layer.borderColor = defaultLayerColor;
            [otherBtn setTitleColor:defaultColor forState:UIControlStateNormal];
        }
    }
}


- (void)handleRequestBtn{
    OrderViewController *orderVc = [[OrderViewController alloc] init];
    orderVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:orderVc animated:YES];
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
