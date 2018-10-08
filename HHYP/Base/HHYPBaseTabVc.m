//
//  HHYPBaseTabVc.m
//  HHYP
//
//  Created by JFWoo on 2018/9/28.
//  Copyright © 2018年 JFWoo. All rights reserved.
//

#import "HHYPBaseTabVc.h"
#import "HHYPMineVc.h"
#import "HHYPBaseNavigationVc.h"
#import "HHYPClassfifyVc.h"
#import "HHYPIndexVc.h"
#import "HHYPLoginVc.h"
@interface HHYPBaseTabVc ()

@end

@implementation HHYPBaseTabVc

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpControllers];
    // Do any additional setup after loading the view.
}
- (void)setUpControllers{
    HHYPMineVc *mine  =[[HHYPMineVc alloc]init];
    HHYPBaseNavigationVc *Mine = [[HHYPBaseNavigationVc alloc]initWithRootViewController:mine];
    HHYPClassfifyVc  *classfify = [[HHYPClassfifyVc alloc]init];
    HHYPBaseNavigationVc  *Classfify =[[HHYPBaseNavigationVc alloc]initWithRootViewController:classfify];
    HHYPIndexVc *index = [[HHYPIndexVc alloc]init];
    HHYPBaseNavigationVc *Index = [[HHYPBaseNavigationVc alloc]initWithRootViewController:index];
    HHYPLoginVc  *login = [[HHYPLoginVc alloc]init];
    HHYPBaseNavigationVc  *Login = [[HHYPBaseNavigationVc alloc]initWithRootViewController:login];
    Mine.title=@"我的";
    Classfify.title=@"分类";
    Index.title=@"首页";
    Login.title=@"登录";
    self.viewControllers = @[Index,Classfify,Mine,Login];
    [[UIBarButtonItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor clearColor]}forState:UIControlStateNormal];
    
}
@end
