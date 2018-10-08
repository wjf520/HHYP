//
//  HHYPClassfifyCell.m
//  HHYP
//
//  Created by JFWoo on 2018/9/28.
//  Copyright © 2018年 JFWoo. All rights reserved.
//

#import "HHYPClassfifyCell.h"

@implementation HHYPClassfifyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self createView];
    }
    return self;
}
- (void)createView{
    self.classfifyImage = [[UIImageView alloc]initWithFrame:CGRectMake((WIDTH*0.3-40)/2, 0, 40, 30)];
    self.classfifyImage.image = [UIImage imageNamed:@"wodezuji"];
    [self addSubview:self.classfifyImage];
    self.classfifyName = [[UILabel alloc]initWithFrame:CGRectMake((WIDTH*0.3-40)/2, 33, 40, 50)];
    self.classfifyName.numberOfLines=0;
    self.classfifyName.textColor = [UIColor lightGrayColor];
    self.classfifyName.text=@"商品分类";
    
    self.classfifyName.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.classfifyName];
}

@end
