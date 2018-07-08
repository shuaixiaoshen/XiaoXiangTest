//
//  CertificateDetailViewController.m
//  XiaoTest
//
//  Created by shen on 2018/7/7.
//  Copyright © 2018年 shen. All rights reserved.
//

#import "CertificateDetailViewController.h"
#import "CetificateHeaderView.h"
#import "BqsServiceId.h"
#import "BqsCrawlerCloudSDK.h"

@interface CertificateDetailViewController ()<BqsCrawlerCloudSDKDelegate>

@end

@implementation CertificateDetailViewController{
    NSArray *imgArr;
    NSArray *titleArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    titleArr = @[@"身份认证",@"信息认证",@"运营商认证",@"淘宝认证",@"支付宝认证",@"征信认证"];
    imgArr = @[@"moblie_img",@"moblie_img",@"moblie_img",@"taobao_img",@"aliPay_img",@"student_img"];
    NaviBarView *naviBar = [[NaviBarView alloc] init];
    [self.view addSubview:naviBar];
    naviBar.title = titleArr[_sourceType];
    CetificateHeaderView *headerView = [CetificateHeaderView cetiAddSubView:self.view];
    headerView.sourceType = _sourceType;
    [headerView startSetUp];
    if (_sourceType > 1) {
        //注册白骑士
        [self setUpWith:headerView];
      [self registBqsSdk];
    }
    // Do any additional setup after loading the view.
}
- (void)registBqsSdk{
    [BqsCrawlerCloudSDK shared].fromController = self;
    [BqsCrawlerCloudSDK shared].delegate = self;
    
    //客户参数
    [BqsCrawlerCloudSDK shared].partnerId = @"xiaoxiang";
    [BqsCrawlerCloudSDK shared].certNo = @"411325199402131938";
    [BqsCrawlerCloudSDK shared].name = @"申帅";
    [BqsCrawlerCloudSDK shared].mobile = @"18621973763";
    //主题
    [BqsCrawlerCloudSDK shared].foreColor = [UIColor blackColor];
    [BqsCrawlerCloudSDK shared].themeColor = [UIColor whiteColor];
    [BqsCrawlerCloudSDK shared].fontColor = [UIColor blackColor];
    [BqsCrawlerCloudSDK shared].progressBarColor = [UIColor blueColor];
}

- (void)setUpWith:(UIView *)subView{
    UIView *backView = [[UIView alloc] init];
    [self.view addSubview:backView];
    backView.backgroundColor = [UIColor blueColor];
    backView.layer.cornerRadius = 10.0f;
    backView.layer.masksToBounds = YES;
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@25);
        make.right.mas_offset(@-25);
        make.top.equalTo(subView.mas_bottom).mas_offset(15);
        make.height.mas_offset(@205);
    }];
    UIImageView *logoImg = [[UIImageView alloc] init];
    logoImg.image = [UIImage imageNamed:imgArr[_sourceType]];
    [backView addSubview:logoImg];
    [logoImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(backView);
        make.centerY.equalTo(backView).mas_offset(-15);
        make.width.height.mas_offset(@95);
    }];
    UILabel *logoLab = [[UILabel alloc] init];
    logoLab.text = titleArr[_sourceType];
    logoLab.textColor = [UIColor whiteColor];
    logoLab.font = [UIFont boldSystemFontOfSize:16];
    [backView addSubview:logoLab];
    [logoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(logoImg.mas_bottom).mas_offset(5);
        make.centerX.equalTo(logoImg);
    }];
    UILabel *loginLab = [[UILabel alloc] init];
    loginLab.text = @"登陆后将获取以下权限";
    loginLab.textColor = [UIColor blackColor];
    loginLab.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:loginLab];
    [loginLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_bottom).mas_offset(35);
        make.left.mas_offset(@30);
    }];
    UILabel *detailLab = [[UILabel alloc] init];
    detailLab.text = [NSString stringWithFormat:@"%@需要提供本人账号和密码等信息",titleArr[_sourceType]];
    detailLab.textColor = [UIColor grayColor];
    detailLab.font = [UIFont boldSystemFontOfSize:13];
    [self.view addSubview:detailLab];
    [detailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginLab.mas_bottom).mas_offset(5);
        make.left.mas_offset(@35);
    }];
    UIButton *requestBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    requestBtn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:requestBtn];
    [requestBtn setTitle:@"授权认证" forState:UIControlStateNormal];
    [requestBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    requestBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [requestBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(@-20);
        make.left.mas_equalTo(@70);
        make.right.mas_equalTo(@-70);
        make.height.mas_equalTo(@45);
    }];
    [requestBtn addTarget:self action:@selector(handleRequestBtn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)handleRequestBtn{
    switch (_sourceType) {
        case 2:
            [[BqsCrawlerCloudSDK shared] loginMno];
            break;
        case 3:
            [[BqsCrawlerCloudSDK shared] loginTaobao];
            break;
        case 4:
            [[BqsCrawlerCloudSDK shared] loginAlipay];
            break;
        default:
            [[BqsCrawlerCloudSDK shared] loginChsi];
            break;
    }
}

#pragma mark - BqsCrawlerCloudSDKDelegate
-(void)onBqsCrawlerCloudResult:(NSString *)resultCode withDesc:(NSString *)resultDesc withServiceId:(int)serviceId{
    NSLog(@"========resultCode=%@,resultDesc=%@", resultCode, resultDesc);
    NSString *type;
    NSString *requestUrl;
    if(MNO_SERVICE_ID == serviceId){//运营商授权成功
        type = @"运营商";
        requestUrl = [NSString stringWithFormat:@"%@/custom/mobileAuth",KBaseUrl];
    } else if(TB_SERVICE_ID == serviceId){//淘宝授权成功
        type = @"淘宝";
        requestUrl = [NSString stringWithFormat:@"%@/custom/taobaoAuth",KBaseUrl];
    } else if(ALIPAY_SERVICE_ID == serviceId){//支付宝授权成功
        type = @"支付宝";
        requestUrl = [NSString stringWithFormat:@"%@/custom/zhifbAuth",KBaseUrl];
    } else if(CHSI_SERVICE_ID == serviceId){//学信网授权成功
        type = @"学信网征信";
        requestUrl = [NSString stringWithFormat:@"%@/custom/learnLetAuth",KBaseUrl];
    } else {
        //...
    }
    if([@"CCOM1000" isEqualToString:resultCode]){
        NSLog(@"%@授权成功", type);
        [self postWithURLString:requestUrl parameters:@{@"result":resultDesc} success:^(id _Nullable data) {
            NSLog(@"%@",data);
        } failure:^(NSString * _Nullable error) {
            NSLog(@"%@",error);
        }];
    } else {
        NSLog(@"%@授权失败", type);
    }
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
