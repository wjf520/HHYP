//
//  HHYPClassfifyVc.m
//  HHYP
//
//  Created by JFWoo on 2018/9/28.
//  Copyright © 2018年 JFWoo. All rights reserved.
//

#import "HHYPClassfifyVc.h"
#import "HHYPClassfifyCell.h"
#import "HHYPClassfifyCollectionViewCell.h"

@interface HHYPClassfifyVc ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) UICollectionView  *collectionView;
@end

@implementation HHYPClassfifyVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self createView];
    // Do any additional setup after loading the view.
}
- (void)createView{
    self.tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, Height_NavBar, WIDTH*0.3, HEIGHT-Height_NavBar-Height_TabBar)];
    self.tableView.showsHorizontalScrollIndicator=NO;
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.tableView registerClass:[HHYPClassfifyCell class] forCellReuseIdentifier:@"HHYPClassfifyCell"];
    [self.view addSubview:self.tableView];
    
    UICollectionViewFlowLayout *flowlayout =[[UICollectionViewFlowLayout alloc]init];
    self.collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(WIDTH*0.3, Height_NavBar, WIDTH*0.7, HEIGHT-Height_NavBar-Height_TabBar) collectionViewLayout:flowlayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource =self;
    self.collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.collectionView registerClass:[HHYPClassfifyCollectionViewCell class] forCellWithReuseIdentifier:@"HHYPClassfifyCollectionViewCell"];
    [self.view addSubview:self.collectionView];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HHYPClassfifyCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"HHYPClassfifyCell" forIndexPath:indexPath];
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

#pragma CollectionViewDatasource
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((WIDTH*0.7)/3.5, 70);
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;//设置section 个数
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HHYPClassfifyCollectionViewCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HHYPClassfifyCollectionViewCell" forIndexPath:indexPath];
    return cell;
    
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return  UIEdgeInsetsMake(5, 5, 5, 5);
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
