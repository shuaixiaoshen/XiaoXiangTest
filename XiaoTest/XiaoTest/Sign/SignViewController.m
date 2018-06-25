//
//  SignViewController.m
//  XiaoTest
//
//  Created by shen on 2018/6/18.
//  Copyright © 2018年 shen. All rights reserved.
//

#import "SignViewController.h"


@interface SignViewController ()

@property(strong, nonatomic) UIScrollView *scrollView;
@property(strong, nonatomic) UIView *baseView;
@property(strong, nonatomic) UITextField *moblieField;
@property(strong, nonatomic) UITextField *passwordField;
@end

@implementation SignViewController{
    NSString *yzmToken;
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KscreenWidth, CGRectGetHeight(self.view.frame))];
        _scrollView.contentSize = CGSizeMake(KscreenWidth, CGRectGetHeight(_scrollView.frame));
        _scrollView.bounces = YES;
        _baseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KscreenWidth, _scrollView.contentSize.height)];
        [_scrollView addSubview:_baseView];
    }
    return _scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *cancleField = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endEdit)];
    [self.view addGestureRecognizer:cancleField];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scrollView];
    [self addHeaderLogo];
    // Do any additional setup after loading the view.
}

- (void)addHeaderLogo{
    UIView *headerLogo = [[UIView alloc] init];
    [_baseView addSubview:headerLogo];
    [headerLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(@0);
        make.top.mas_offset(@34);
        make.height.mas_offset(@100);
    }];
    UIImageView *logoImg = [[UIImageView alloc] init];
    [headerLogo addSubview:logoImg];
    logoImg.contentMode = UIViewContentModeCenter;
    logoImg.image = [UIImage imageNamed:@"sign_03"];
    [logoImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@10);
        make.centerY.equalTo(headerLogo);
        make.height.mas_offset(@90);
        make.width.mas_offset(@65);
    }];
    UILabel *logoLab = [[UILabel alloc] init];
    [headerLogo addSubview:logoLab];
    logoLab.text = @"乐享租";
    logoLab.font = [UIFont boldSystemFontOfSize:16];
    [logoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(logoImg.mas_right).mas_offset(3);
        make.centerY.equalTo(headerLogo).mas_offset(-10);
    }];
    UILabel *logoDetailLab = [[UILabel alloc] init];
    [headerLogo addSubview:logoDetailLab];
    logoDetailLab.textColor = [UIColor grayColor];
    logoDetailLab.text = @"信用租机 你有我也有";
    logoDetailLab.font = [UIFont boldSystemFontOfSize:13];
    [logoDetailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(logoImg.mas_right).mas_offset(3);
        make.top.equalTo(logoLab.mas_bottom).mas_offset(5);
    }];
    [self addMidViewWithHeaderView:headerLogo];
}

- (void)addMidViewWithHeaderView:(UIView *)headerView{
    UIView *midView = [[UIView alloc] init];
    [_baseView addSubview:midView];
    [midView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(@0);
        make.top.equalTo(headerView.mas_bottom).mas_offset(50);
        make.bottom.mas_offset(@50);
    }];
    UILabel *logoLab = [[UILabel alloc] init];
    [midView addSubview:logoLab];
    logoLab.text = @"欢迎您！";
    logoLab.font = [UIFont boldSystemFontOfSize:18];
    [logoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(30);
        make.top.mas_offset(@0);
    }];
    UIView *moblieView = [[UIView alloc] init];
    [midView addSubview:moblieView];
    [moblieView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(logoLab.mas_bottom);
        make.height.mas_offset(@70);
        make.left.mas_offset(@25);
        make.right.mas_offset(@-25);
    }];
    _moblieField = [[UITextField alloc] init];
    [moblieView addSubview:_moblieField];
    _moblieField.keyboardType = UIKeyboardTypePhonePad;
    _moblieField.clearsOnBeginEditing = YES;
    _moblieField.placeholder = @"请输入手机号";
    [_moblieField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(@0);
        make.bottom.mas_offset(@0);
        make.height.mas_offset(@45);
    }];
    UILabel *line = [[UILabel alloc] init];
    [moblieView addSubview:line];
    line.backgroundColor = [UIColor grayColor];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(@0);
        make.height.mas_offset(@.5);
        make.bottom.mas_offset(@0);
    }];
    UIView *passwordView = [[UIView alloc] init];
    [midView addSubview:passwordView];
    [passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(moblieView.mas_bottom);
        make.height.mas_offset(@70);
        make.left.mas_offset(@25);
        make.right.mas_offset(@-25);
    }];
    UIButton *sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sendBtn.backgroundColor = [UIColor colorWithRed:95 / 255.0 green:156 / 255.0 blue:249 / 255.0 alpha:1];
    [sendBtn setTitle:@"获取" forState:UIControlStateNormal];
    sendBtn.layer.cornerRadius = 15.0f;
    sendBtn.layer.masksToBounds = YES;
    sendBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [sendBtn addTarget:self action:@selector(handleSendCode) forControlEvents:UIControlEventTouchUpInside];
    [passwordView addSubview:sendBtn];
    [sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(@0);
        make.bottom.mas_offset(@-15);
        make.height.mas_offset(@30);
        make.width.mas_offset(@115);
    }];
    _passwordField = [[UITextField alloc] init];
    [passwordView addSubview:_passwordField];
    _passwordField.keyboardType = UIKeyboardTypePhonePad;
    _passwordField.placeholder = @"请输入手机验证码";
    [_passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@0);
        make.right.equalTo(sendBtn.mas_left).mas_offset(3);
        make.bottom.mas_offset(@0);
        make.height.mas_offset(@45);
    }];
    UILabel *line1 = [[UILabel alloc] init];
    [passwordView addSubview:line1];
    line1.backgroundColor = [UIColor grayColor];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(@0);
        make.height.mas_offset(@.5);
        make.bottom.mas_offset(@0);
    }];
    UIButton *fastBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    fastBtn.backgroundColor = [UIColor colorWithRed:95 / 255.0 green:156 / 255.0 blue:249 / 255.0 alpha:1];
    [fastBtn setTitle:@"快速登录" forState:UIControlStateNormal];
    fastBtn.layer.cornerRadius = 18.0f;
    fastBtn.layer.masksToBounds = YES;
    fastBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [fastBtn addTarget:self action:@selector(handleSignBtn) forControlEvents:UIControlEventTouchUpInside];
    [midView addSubview:fastBtn];
    [fastBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(@-20);
        make.left.mas_offset(@20);
        make.top.equalTo(passwordView.mas_bottom).mas_offset(50);
        make.height.mas_offset(@36);
    }];
    [self addBottomViewWithMidView:midView];
}

- (void)addBottomViewWithMidView:(UIView *)midView{
    UIView *bottomView = [[UIView alloc] init];
    [_baseView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(@0);
        make.bottom.mas_offset(@-15);
        make.height.mas_offset(@20);
    }];
    UILabel *signLab = [[UILabel alloc] init];
    [bottomView addSubview:signLab];
    signLab.textColor = [UIColor grayColor];
    signLab.text = @"登陆即同意";
    signLab.font = [UIFont boldSystemFontOfSize:13];
    [signLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bottomView).mas_offset(-30);
        make.centerY.equalTo(bottomView);
    }];
    UIButton *fuBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [fuBtn setTitle:@"用户服务协议" forState:UIControlStateNormal];
    fuBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [bottomView addSubview:fuBtn];
    [fuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(signLab.mas_right);
        make.centerY.equalTo(bottomView);
    }];
}

#pragma mark - 按钮事件 -

- (void)handleSendCode{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:_moblieField.text forKey:@"phone"];
    [dic setValue:[NSString stringWithFormat:@"%@%@%@",[self getRandomStringWithNum:6],NSUserDefaultsGet(Session_token),[self getRandomStringWithNum:6]] forKey:@"token"];
    [self postWithURLString:[NSString stringWithFormat:@"%@/custom/sendRegistCode",KBaseUrl] parameters:dic success:^(id _Nullable data) {
        NSLog(@"%@",data);
        yzmToken = [data valueForKey:@"data"];
    } failure:^(NSString * _Nullable error) {
        NSLog(@"%@",error);
    }];
}

- (void)handleSignBtn{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:_moblieField.text forKey:@"phone"];
    [dic setValue:yzmToken forKey:@"yzmToken"];
    [dic setValue:_passwordField.text forKey:@"yzmCode"];
    [self postWithURLString:[NSString stringWithFormat:@"%@/custom/register",KBaseUrl] parameters:dic success:^(id _Nullable data) {
        NSLog(@"%@",data);
    } failure:^(NSString * _Nullable error) {
        NSLog(@"%@",error);
    }];
}

/**
 随机数生成
 
 @param num 位数
 @return 随机数
 */
- (NSString *)getRandomStringWithNum:(NSInteger)num
{
    NSString *string = [[NSString alloc]init];
    for (int i = 0; i < num; i++) {
        int number = arc4random() % 36;
        if (number < 10) {
            int figure = arc4random() % 10;
            NSString *tempString = [NSString stringWithFormat:@"%d", figure];
            string = [string stringByAppendingString:tempString];
        }else {
            int figure = (arc4random() % 26) + 97;
            char character = figure;
            NSString *tempString = [NSString stringWithFormat:@"%c", character];
            string = [string stringByAppendingString:tempString];
        }
    }
    return string;
}

- (void)endEdit{
    [self.view endEditing:YES];
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
