//
//  BaseViewController.m
//  XiaoTest
//
//  Created by shen on 2018/6/11.
//  Copyright © 2018年 shen. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController{

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)postWithURLString:(NSString *)URLString parameters:(id)parameters success:(void (^)(id _Nullable))success failure:(void (^)(NSString * _Nullable))failure{
    NSString *token = NSUserDefaultsGet(Session_token);
    NSString *requestUrl = [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:requestUrl] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:15];
    request.HTTPMethod = @"POST";
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    if (parameters !=nil)
    {
        [request setHTTPBody:[NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil]];
    }
    //后台+随机 token
//    if (token) {
//        NSString *seesionToken = [NSString stringWithFormat:@"%@%@%@",[self getRandomStringWithNum:6],token,[self getRandomStringWithNum:6]];
//        [request setValue:seesionToken forHTTPHeaderField:@"token"];
//    }
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            //拿到响应头信息
            NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
            NSString *errMsg = [NSString stringWithFormat:@"%@",error.userInfo[@"NSLocalizedDescription"]];
           NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            // use the nsdata... code removed for general purpose
            if (success) {
                success(dic);
            }
        }
    }];
    [task resume];
}



- (void)getToken{
    [self postWithURLString:[NSString stringWithFormat:@"%@/custom/getYzmToken",KBaseUrl] parameters:nil success:^(id _Nullable responseObject) {
        NSString *token = [responseObject valueForKey:@"data"];
        if (token) {
            NSUserDefaultsSave(token, Session_token);
        }
    } failure:^(NSString * _Nullable error) {
        NSLog(@"获取token失败:%@",error);
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
