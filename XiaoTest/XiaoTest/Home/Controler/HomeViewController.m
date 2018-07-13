//
//  HomeViewController.m
//  XiaoTest
//
//  Created by shen on 2018/7/9.
//  Copyright © 2018年 shen. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeDetailViewController.h"
#import "HeaderViewCell.h"
#import "HomeFistrCell.h"
#import "HomeSecondCell.h"
#import "HomeThirdCell.h"
#import "HomeSearchCell.h"

typedef NS_ENUM(NSInteger, UICollectionViewState) {
    UICollectionViewStateFirst,
    UICollectionViewStateSecond
};

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *header1Btn;
@property (weak, nonatomic) IBOutlet UIButton *header2Btn;
@property (weak, nonatomic) IBOutlet UIView *headerLine;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineX;

@end

@implementation HomeViewController{
    UICollectionViewState collectionState;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getToken];
    collectionState = UICollectionViewStateFirst;
    [_collectionView registerNib:[UINib nibWithNibName:@"HomeThirdCell" bundle:nil] forCellWithReuseIdentifier:@"HomeThirdCell"];
    [_collectionView registerNib:[UINib nibWithNibName:@"HomeSecondCell" bundle:nil] forCellWithReuseIdentifier:@"HomeSecondCell"];
    [_collectionView registerNib:[UINib nibWithNibName:@"HomeFistrCell" bundle:nil] forCellWithReuseIdentifier:@"HomeFistrCell"];
    [_collectionView registerNib:[UINib nibWithNibName:@"HeaderViewCell" bundle:nil] forCellWithReuseIdentifier:@"HeaderViewCell"];
    [_collectionView registerNib:[UINib nibWithNibName:@"HomeSearchCell" bundle:nil] forCellWithReuseIdentifier:@"HomeSearchCell"];
    // Do any additional setup after loading the view.
}


#pragma mark - UICollectionViewDelegate,Datasource -
//一共有多少个组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (collectionState == UICollectionViewStateFirst) {
       return 5;
    }
    return 5;
   
}
//每一组有多少个cell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionState == UICollectionViewStateFirst) {
        if (section == 0 || section == 1 || section == 2) {
            return 1;
        }
        return 2;
    }
    if (section == 0 || section == 1) {
        return 1;
    }
    return 2;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionState == UICollectionViewStateFirst) {
        if (indexPath.section == 0) {
            HeaderViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HeaderViewCell" forIndexPath:indexPath];
            return cell;
        }else if (indexPath.section == 1){
            HomeFistrCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeFistrCell" forIndexPath:indexPath];
            return cell;
        }else if (indexPath.section == 2){
            HomeSecondCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeSecondCell" forIndexPath:indexPath];
            return cell;
        }else{
            HomeThirdCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeThirdCell" forIndexPath:indexPath];
            return cell;
        }
    }
    if (indexPath.section == 0) {
        HeaderViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HeaderViewCell" forIndexPath:indexPath];
        return cell;
    }else if (indexPath.section == 1){
        HomeSearchCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeSearchCell" forIndexPath:indexPath];
        return cell;
    }else{
        HomeThirdCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeThirdCell" forIndexPath:indexPath];
        return cell;
    }
    
}

//每一个分组的上左下右间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (collectionState == UICollectionViewStateFirst) {
        if (section == 0) {
            return UIEdgeInsetsMake(0, 0, 0, 0);
        }else if (section == 1){
            return UIEdgeInsetsMake(15, 0, 0, 0);
        }else if (section == 2){
            return UIEdgeInsetsMake(15, 0, 0, 0);
        }else{
            return UIEdgeInsetsMake(15, 20, 15, 20);
        }
    }
    if (section == 0) {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }else if (section == 1){
        return UIEdgeInsetsMake(15, 0, 0, 0);
    }else{
        return UIEdgeInsetsMake(15, 20, 15, 20);
    }
}
//定义每一个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionState == UICollectionViewStateFirst) {
        if (indexPath.section == 0) {
            return CGSizeMake(KscreenWidth, 215);
        }else if (indexPath.section == 1){
            return CGSizeMake(KscreenWidth, 175);
        }else if (indexPath.section == 2){
            return CGSizeMake(KscreenWidth, 120);
        }else{
            return CGSizeMake((KscreenWidth - 70) / 2, 177);
        }
    }
    if (indexPath.section == 0) {
        return CGSizeMake(KscreenWidth, 215);
    }else if (indexPath.section == 1){
        return CGSizeMake(KscreenWidth, 30);
    }else{
        return CGSizeMake((KscreenWidth - 70) / 2, 177);
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionState == UICollectionViewStateFirst) {
        HomeDetailViewController *detailVc = [[HomeDetailViewController alloc] init];
        detailVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:detailVc animated:YES];
    }
}

- (IBAction)handleTouchHeader1:(UIButton *)sender {
    [_header1Btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_header2Btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    _lineX.constant = -30.0f;
    [self.view updateConstraintsIfNeeded];
    collectionState = UICollectionViewStateFirst;
    [self.collectionView reloadData];
}
- (IBAction)handleTouchHeader2:(UIButton *)sender {
    [_header2Btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_header1Btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    _lineX.constant = 30.0f;
    [self.view updateConstraintsIfNeeded];
    collectionState = UICollectionViewStateSecond;
    [self.collectionView reloadData];
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
