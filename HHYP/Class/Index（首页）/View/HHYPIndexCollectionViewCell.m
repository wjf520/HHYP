
//
//  HHYPIndexCollectionViewCell.m
//  HHYP
//
//  Created by JFWoo on 2018/9/29.
//  Copyright © 2018年 JFWoo. All rights reserved.
//

#import "HHYPIndexCollectionViewCell.h"

@implementation HHYPIndexCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self createView];
    }
    return  self;
}
- (void)createView{
    self.iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    self.iconImage.image = [UIImage imageNamed:@"classfify"];
    [self addSubview:self.iconImage];
    self.title = [[UILabel alloc]initWithFrame:CGRectMake(0, 62, 60, 30)];
    self.title.textAlignment = NSTextAlignmentCenter;
    self.title.text=@"分类";
    [self addSubview:self.title];
}
@end
