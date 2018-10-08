//
//  HHYPIndexHeader.m
//  HHYP
//
//  Created by JFWoo on 2018/9/29.
//  Copyright © 2018年 JFWoo. All rights reserved.
//

#import "HHYPIndexHeader.h"

@implementation HHYPIndexHeader
- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if(self){
        self.bannerView = [[ZYBannerView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 150)];
        [self addSubview:self.bannerView];
    }
    return self;
}
@end
