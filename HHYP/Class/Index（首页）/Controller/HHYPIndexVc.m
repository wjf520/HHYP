
//
//  HHYPIndexVc.m
//  HHYP
//
//  Created by JFWoo on 2018/9/29.
//  Copyright © 2018年 JFWoo. All rights reserved.
//

#import "HHYPIndexVc.h"
#import "HHYPIndexCollectionViewCell.h"
#import "HHYPIndexGoodsCollectionViewCell.h"
#import "HHYPIndexHeader.h"
#import "HHYPIndexClassfifyHeader.h"
@interface HHYPIndexVc ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,ZYBannerViewDelegate,ZYBannerViewDataSource>
@property (strong,nonatomic) UICollectionView *collectionView;
@end

@implementation HHYPIndexVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createView];
    [self changeNavagation];
    // Do any additional setup after loading the view.
}
- (void)createView{
    UICollectionViewFlowLayout  *layout = [[UICollectionViewFlowLayout alloc]init];
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, Height_NavBar, WIDTH, HEIGHT-Height_NavBar-Height_TabBar) collectionViewLayout:layout];
    self.collectionView.dataSource=self;
    self.collectionView.delegate =self;
    [self.collectionView registerClass:[HHYPIndexCollectionViewCell class] forCellWithReuseIdentifier:@"HHYPIndexCollectionViewCell"];
    [self.collectionView registerClass:[HHYPIndexGoodsCollectionViewCell class] forCellWithReuseIdentifier:@"HHYPIndexGoodsCollectionViewCell"];
    [self.collectionView registerClass:[HHYPIndexHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HHYPIndexHeader"];
    [self.collectionView registerClass:[HHYPIndexClassfifyHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HHYPIndexClassfifyHeader"];
    self.collectionView.backgroundColor = [UIColor  groupTableViewBackgroundColor];
    [self.view addSubview:self.collectionView];
}
- (void)changeNavagation{
    UITextField  *searchField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 30)];
    searchField.backgroundColor =[UIColor groupTableViewBackgroundColor];
    searchField.placeholder=@"搜索你想要的商品";
    self.navigationItem.titleView =searchField;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0){
        return CGSizeMake(WIDTH/5.5, 105);
    }
    return CGSizeMake(WIDTH/3.5, 160);
        
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(section==0)
    {
        return 4;
        
    }
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    if(indexPath.section==0){
         HHYPIndexCollectionViewCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HHYPIndexCollectionViewCell" forIndexPath:indexPath];
        cell.backgroundColor =[UIColor groupTableViewBackgroundColor];
        return  cell;
    }
    HHYPIndexGoodsCollectionViewCell *goodsCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HHYPIndexGoodsCollectionViewCell" forIndexPath:indexPath];
    goodsCell.backgroundColor = [UIColor whiteColor];
    return  goodsCell;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return  UIEdgeInsetsMake(5, 10, 5, 10);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if([kind isEqualToString:UICollectionElementKindSectionHeader]){
        //头部视图
        if(indexPath.section==0){
            HHYPIndexHeader *header= [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HHYPIndexHeader" forIndexPath:indexPath];
            header.bannerView.delegate =self;
            header.bannerView.autoScroll=YES;
            header.bannerView.pageControl.hidden=YES;
            header.bannerView.dataSource = self;
            return  header;
        }else{
            HHYPIndexClassfifyHeader  *classfifyheader = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HHYPIndexClassfifyHeader" forIndexPath:indexPath];
            return  classfifyheader;
        }
        
    }
    return  nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if(section==0){
        return CGSizeMake(WIDTH, 150);
    }
    return CGSizeMake(WIDTH, 40);
        
}
#pragma Zybannerdatasourece
- (NSInteger)numberOfItemsInBanner:(ZYBannerView *)banner{
    return 3;
}
- (UIView *)banner:(ZYBannerView *)banner viewForItemAtIndex:(NSInteger)index{
    UIImageView  *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 150)];
    imageView.image = [UIImage imageNamed:@"Banner"];
    return imageView;
}


@end
