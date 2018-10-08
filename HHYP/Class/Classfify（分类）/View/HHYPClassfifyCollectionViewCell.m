//
//  HHYPClassfifyCollectionViewCell.m
//  HHYP
//
//  Created by JFWoo on 2018/9/28.
//  Copyright © 2018年 JFWoo. All rights reserved.
//

#import "HHYPClassfifyCollectionViewCell.h"

@implementation HHYPClassfifyCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        [self createView];
    }
    return self;
}
- (void)createView {
    self.brandImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.width, 30)];
    self.brandImage.image =[UIImage imageNamed:@"myOrder"];
    [self addSubview:self.brandImage];
    self.brandName = [[UILabel alloc]initWithFrame:CGRectMake(0, 33, self.width, 30)];
    self.brandName.text=@"品牌名称";
    self.brandName.textAlignment =NSTextAlignmentCenter;
    [self addSubview:self.brandName];
}
@end
