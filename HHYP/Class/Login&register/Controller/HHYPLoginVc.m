

//
//  HHYPLoginVc.m
//  HHYP
//
//  Created by JFWoo on 2018/9/29.
//  Copyright © 2018年 JFWoo. All rights reserved.
//

#import "HHYPLoginVc.h"
#import "HHYPRegisterVc.h"
@interface HHYPLoginVc ()
@property (strong,nonatomic) UITextField  *phoneField;
@property (strong,nonatomic) UITextField *password;
@end

@implementation HHYPLoginVc

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationController.navigationBar.hidden=YES;
    [self createView];
    // Do any additional setup after loading the view.
}
- (void)createView
{
    UIImageView  *bgview = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bgview.backgroundColor = [UIColor colorWithRed:237/255.0 green:142/255.0f blue:104/255.0f alpha:1.0f];
    [self.view addSubview:bgview];
    UIImageView  *logoImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, Height_NavBar, 60, 60)];
    logoImage.image =[UIImage imageNamed:[self GetAppIconName]];
    logoImage.centerX=self.view.centerX;
    [self.view addSubview:logoImage];
    self.phoneField =[[UITextField alloc]initWithFrame:CGRectMake(50, logoImage.y+logoImage.height+40, WIDTH-100,40)];
    self.phoneField.placeholder=@"手机/密码";
    self.phoneField.background = [UIImage imageNamed:@"field_bg"];
    self.phoneField.leftView=[self leftView:[UIImage imageNamed:@"用户"]];
    self.phoneField.leftViewMode =UITextFieldViewModeAlways;
    [self.view addSubview:self.phoneField];
    self.password = [[UITextField alloc]initWithFrame:CGRectMake(50, self.phoneField.y+self.phoneField.height+30, WIDTH-100, 40)];
    self.password.placeholder=@"密码";
    self.password.leftViewMode = UITextFieldViewModeAlways;
    self.password.leftView =[self leftView:[UIImage imageNamed:@"锁"]];
    self.password.background = [UIImage imageNamed:@"field_bg"];
    [self.view addSubview:self.password];
    UIButton  *loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(50, self.password.y+self.password.height+30, WIDTH-100, 44)];
    [loginBtn setTitle:@"登 陆" forState:UIControlStateNormal];
    loginBtn.backgroundColor = [UIColor colorWithRed:224/255.0f green:49/255.0f blue:53/255.0f alpha:1.0f];
    loginBtn.layer.cornerRadius =5;
    loginBtn.layer.masksToBounds =YES;
    [self.view addSubview:loginBtn];
    UIView *loginLeftview = [[UIView alloc]initWithFrame:CGRectMake(50, loginBtn.y+loginBtn.height+44, (WIDTH-210)/2, 1)];
    loginLeftview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:loginLeftview];
    UILabel *loginthirdparty =[[UILabel alloc]initWithFrame:CGRectMake(loginLeftview.x+loginLeftview.width+10, loginBtn.y+loginBtn.height+30, 90, 30)];
    loginthirdparty.text=@"第三方登陆";
    loginthirdparty.textColor =[UIColor whiteColor];
    [self.view addSubview:loginthirdparty];
    UIView *loginrightView = [[UIView alloc]initWithFrame:CGRectMake(loginthirdparty.x+loginthirdparty.width+10, loginBtn.y+loginBtn.height+44, (WIDTH-210)/2, 1)];
    loginrightView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:loginrightView];
    NSArray *imagesArray = @[@"qq登陆",@"微信登陆",@"新浪登陆"];
    UIView *loginByThirdParty = [[UIView alloc]initWithFrame:CGRectMake(80, loginthirdparty.y+loginthirdparty.height, WIDTH-180, 60)];
    for (int i=0; i<imagesArray.count; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake((i*((WIDTH-180)/3))+10, 0, (WIDTH-180)/3, 60)];
        [btn setImage:[UIImage imageNamed:imagesArray[i]] forState:UIControlStateNormal];
        [loginByThirdParty addSubview:btn];
    }
    [self.view addSubview:loginByThirdParty];
    NSArray *titleArray =@[@"忘记密码",@"用户帮助",@"注册账号"];
    for (int i=0; i<3; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake((i*((WIDTH-60)/3))+30, loginByThirdParty.y+loginByThirdParty.height+30, (WIDTH-60)/3, 30)];
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        btn.tag=3000+i;
        [btn addTarget:self action:@selector(userAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
}
-(NSString*)GetAppIconName{
    NSDictionary *infoPlist = [[NSBundle mainBundle] infoDictionary];
    
    NSString *icon = [[infoPlist valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject];
    return icon;
}
- (UIView *)leftView:(UIImage*)image
{
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];
    UIImageView  *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    imageView.image = image;
    [leftView addSubview:imageView];
    return leftView;
}

- (void)userAction:(UIButton *)btn{
    NSInteger  tag = btn.tag-3000;
    if(tag==2){
        HHYPRegisterVc *registerVc = [[HHYPRegisterVc alloc]init];
        [self.navigationController pushViewController:registerVc animated:YES];
    }
}



@end
