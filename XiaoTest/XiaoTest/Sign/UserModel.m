//
//  UserModel.m
//  XiaoTest
//
//  Created by shen on 2018/7/7.
//  Copyright © 2018年 shen. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

+ (UserModel *)defaultModel{
    static UserModel *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[UserModel alloc] init];
    });
    return manager;
}

@end
