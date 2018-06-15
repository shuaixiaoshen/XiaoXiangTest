//
//  NaviBarView.h
//  XiaoTest
//
//  Created by shen on 2018/6/13.
//  Copyright © 2018年 shen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NaviBarView : UIView

@property (assign, nonatomic) BOOL showBackBtn;
@property (strong, nonatomic) NSString *titleName;

+ (NaviBarView *)defaultNaviBarWith:(UIView *)aView;

@end
