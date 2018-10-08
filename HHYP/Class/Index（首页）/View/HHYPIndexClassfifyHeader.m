//
//  HHYPIndexClassfifyHeader.m
//  HHYP
//
//  Created by JFWoo on 2018/9/29.
//  Copyright © 2018年 JFWoo. All rights reserved.
//

#import "HHYPIndexClassfifyHeader.h"

@implementation HHYPIndexClassfifyHeader
- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        self.classfifyName = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, WIDTH-10, 30)];
        self.classfifyName.text=@"水果";
        [self addSubview:self.classfifyName];
    }
    return  self;
        
}
@end
