//
//  UserModel.h
//  XiaoTest
//
//  Created by shen on 2018/7/7.
//  Copyright © 2018年 shen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject


+ (UserModel *)defaultModel;

@property(strong, nonatomic) NSString *seesionToken;
@property(strong, nonatomic) NSString *cid;
@property(strong, nonatomic) NSString *family_flg;




@end
