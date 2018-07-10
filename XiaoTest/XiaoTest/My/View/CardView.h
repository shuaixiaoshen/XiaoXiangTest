//
//  CardView.h
//  XiaoTest
//
//  Created by shen on 2018/7/7.
//  Copyright © 2018年 shen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardView : UIView

+ (CardView *)cardAddSubView:(UIView *)subView;

- (void)startSetUp;

@end
