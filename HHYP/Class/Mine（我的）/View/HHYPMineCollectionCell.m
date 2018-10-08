//
//  HHYPMineCollectionCell.m
//  HHYP
//
//  Created by JFWoo on 2018/9/28.
//  Copyright © 2018年 JFWoo. All rights reserved.
//

#import "HHYPMineCollectionCell.h"

@implementation HHYPMineCollectionCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.iconImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
        self.iconImage.image = [UIImage imageNamed:@"myOrder"];
        [self addSubview:self.iconImage];
        self.mineTitle =[[UILabel alloc]initWithFrame:CGRectMake(0, 32, 40, 30)];
        self.mineTitle.text=@"待付款";
        self.mineTitle.font =[UIFont systemFontOfSize:13];
        self.mineTitle.textColor = [UIColor lightGrayColor];
        self.mineTitle.textAlignment=NSTextAlignmentCenter;
        
        [self addSubview:self.mineTitle];
    }
    return  self;
}
@end
