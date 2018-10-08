//
//  HHYPMineVc.m
//  HHYP
//
//  Created by JFWoo on 2018/9/28.
//  Copyright © 2018年 JFWoo. All rights reserved.
//

#import "HHYPMineVc.h"
#import "HHYPMineCollectionCell.h"
@interface HHYPMineVc ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong,nonatomic) UITableView  *tableView;
@property (strong,nonatomic) UICollectionView  *orderCollectionView;
@property (strong,nonatomic) UICollectionView *wealthCollectionView;
@end

@implementation HHYPMineVc

- (void)viewDidLoad {
    [super viewDidLoad];
     [self createView];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createHeader];
    [self setUpNavagation];
    // Do any additional setup after loading the view.
}
-(void)createView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,WIDTH, HEIGHT-Height_TabBar) style:UITableViewStyleGrouped];
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.contentInset = UIEdgeInsetsMake(-Height_StatusBar, 0, 0, 0);
    self.tableView.delegate = self;
    self.tableView.dataSource =self;
   
    [self.view addSubview:self.tableView];
}
-(void)createHeader{
    UIView *HeaderView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 250)];
    self.tableView.tableHeaderView =HeaderView;
    //78 195 207
    HeaderView.backgroundColor = [UIColor colorWithRed:78/255.0f green:195/255.0f blue:207/255.0f alpha:1.0];
    UIImageView *userIcon = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    [userIcon setImage:[UIImage imageNamed:@"DefaultIcon"]];
    userIcon.centerX=HeaderView.centerX;
    userIcon.centerY =HeaderView.centerY-50;
    [HeaderView addSubview:userIcon];
    UIButton  *loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, userIcon.y+userIcon.height, 80, 30)];
    [loginBtn setTitle:@"点击登录" forState:UIControlStateNormal];
    loginBtn.centerX=HeaderView.centerX;
    [HeaderView addSubview:loginBtn];
    UIView  *bootomView = [[UIView alloc]initWithFrame:CGRectMake(0, 200, WIDTH, 50)];
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = CGRectMake(0, 0,WIDTH, 50);
    effectView.alpha=0.5;
    [bootomView addSubview:effectView];
    [HeaderView addSubview:bootomView];
    NSArray  *titleArray =@[@"商品收藏",@"店铺收藏",@"我的足迹"];
    NSArray *imageArray=@[@"shangpinshoucang",@"dianpushoucang",@"wodezuji"];
    for (int i=0; i<3; i++) {
        UIButton  *btn =[[UIButton alloc]initWithFrame:CGRectMake(i*(WIDTH/3), 0, WIDTH/3, 50)];
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [bootomView addSubview:btn];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        //使图片和文字水平居中显示
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.imageView.frame.size.height ,-btn.imageView.frame.size.width, 0.0,0.0)];
        //文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
        [btn setImageEdgeInsets:UIEdgeInsetsMake(-15, 0.0,0.0, -btn.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
    }
    UIButton  *settingBtn = [[UIButton alloc]initWithFrame:CGRectMake(22, Height_StatusBar, 30, 30)];
    [settingBtn setImage:[UIImage imageNamed:@"shezhi"] forState:UIControlStateNormal];
    [HeaderView addSubview:settingBtn];
    
}
- (void)setUpNavagation{
    self.navigationController.navigationBar.hidden =YES;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section==1||section==0){
        return 0;
    }
    return 0;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
   
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
     cell.backgroundColor =[UIColor groupTableViewBackgroundColor];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==1||indexPath.section==0){
        return 20;
    }
    return 44;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section==0){
        UIView  *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 50)];
        headerView.backgroundColor=[UIColor whiteColor];
        UIButton *orderBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 5, 120, 40)];
        [orderBtn setImage:[UIImage imageNamed:@"myOrder"] forState:UIControlStateNormal];
        [orderBtn setTitle:@"我的订单" forState:UIControlStateNormal];
        [orderBtn setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
        [headerView addSubview:orderBtn];
        UILabel  *lab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-130, 5, 120, 40)];
        lab.text=@"查看全部订单 >";
        lab.textColor = [UIColor lightGrayColor];
        [headerView addSubview:lab];
        UIView  *lineView = [[UIView alloc]initWithFrame:CGRectMake(10, lab.y+lab.height+3, WIDTH-10, 0.5)];
        lineView.backgroundColor =[UIColor lightGrayColor];
        [headerView addSubview:lineView];
        return headerView;
    }else if (section==1){
        UIView  *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 50)];
        headerView.backgroundColor=[UIColor whiteColor];
        UIButton *orderBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 5, 120, 40)];
        [orderBtn setImage:[UIImage imageNamed:@"wodecaichan"] forState:UIControlStateNormal];
        [orderBtn setTitle:@"我的财产" forState:UIControlStateNormal];
        [orderBtn setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
        [headerView addSubview:orderBtn];
        UILabel  *lab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-130, 5, 120, 40)];
        lab.text=@"查看全部财产 >";
        lab.textColor = [UIColor lightGrayColor];
        [headerView addSubview:lab];
        UIView  *lineView = [[UIView alloc]initWithFrame:CGRectMake(10, lab.y+lab.height+3, WIDTH-10, 0.5)];
        lineView.backgroundColor =[UIColor lightGrayColor];
        [headerView addSubview:lineView];
        return headerView;
    }
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if(section==0){
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        self.orderCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 80) collectionViewLayout:layout];
        self.orderCollectionView.delegate =self;
        self.orderCollectionView.dataSource =self;
        self.orderCollectionView.scrollEnabled=NO;
        self.orderCollectionView.backgroundColor =[UIColor whiteColor];
        [self.orderCollectionView registerClass:[HHYPMineCollectionCell class] forCellWithReuseIdentifier:@"HHYPMineCollectionCell"];
        return  self.orderCollectionView;
        
    }else if (section==1){
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
         layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        self.wealthCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 80) collectionViewLayout:layout];
        self.wealthCollectionView.delegate =self;
        self.wealthCollectionView.dataSource =self;
        self.wealthCollectionView.scrollEnabled =NO;
        self.wealthCollectionView.backgroundColor =[UIColor whiteColor];
       [self.wealthCollectionView registerClass:[HHYPMineCollectionCell class] forCellWithReuseIdentifier:@"HHYPMineCollectionCell"];
        return  self.wealthCollectionView;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section==0||section==1){
        return 70;
    }
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if(section==0||section==1){
        return 80;
    }
    return 10;
}
#pragma collectionviewdatasource
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(WIDTH/5.5, 70);
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;//设置section 个数
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;//根据section设置每个section的item个数
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HHYPMineCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HHYPMineCollectionCell" forIndexPath:indexPath];
    return  cell;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return  UIEdgeInsetsMake(0, 0, 0, 0);
}




@end
