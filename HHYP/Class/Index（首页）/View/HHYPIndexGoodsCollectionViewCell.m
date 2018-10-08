//
//  HHYPIndexGoodsCollectionViewCell.m
//  HHYP
//
//  Created by JFWoo on 2018/9/29.
//  Copyright © 2018年 JFWoo. All rights reserved.
//

#import "HHYPIndexGoodsCollectionViewCell.h"

@implementation HHYPIndexGoodsCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if(self){
        
        [self createView];
    }
    return  self;
}
- (void)createView{
    self.goodsImage = [[UIImageView alloc]initWithFrame:CGRectMake((self.width-80)/2, 0, 80, 80)];
    self.goodsImage.image = [UIImage imageNamed:@"orange"];
    [self addSubview:self.goodsImage];
    self.goodsName = [[UILabel alloc]initWithFrame:CGRectMake(0, 90, WIDTH, 30)];
    self.goodsName.text=@"这不是橙子🍊";
    [self addSubview:self.goodsName];
    UIView  *lineView = [[UIView alloc]initWithFrame:CGRectMake(5, 123, self.width-10, 1)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:lineView];
    self.goodsPrice = [[UILabel alloc]initWithFrame:CGRectMake(0, 125, self.width, 30)];
    self.goodsPrice.text=@"￥999.00";
    self.goodsPrice.textColor = [UIColor redColor];
    [self addSubview:self.goodsPrice];
    
}
@end
