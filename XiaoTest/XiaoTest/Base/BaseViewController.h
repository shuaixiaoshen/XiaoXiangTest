//
//  BaseViewController.h
//  XiaoTest
//
//  Created by shen on 2018/6/11.
//  Copyright © 2018年 shen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)postWithURLString:(NSString *)URLString parameters:(id)parameters success:(void (^)(id _Nullable))success failure:(void (^)(NSString * _Nullable))failure;

- (void)getToken;

@end
