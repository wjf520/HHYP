
//
//  HHYPRegisterVc.m
//  HHYP
//
//  Created by JFWoo on 2018/9/30.
//  Copyright © 2018年 JFWoo. All rights reserved.
//

#import "HHYPRegisterVc.h"

@interface HHYPRegisterVc ()
@property  (strong,nonatomic)UITextField  *phoneField;
@property  (strong,nonatomic)UITextField  *checkNumField;
@property  (strong,nonatomic)UITextField  *passWordField;
@property  (strong,nonatomic)UITextField  *confirmField;
@property  (strong,nonatomic)UIButton  *sendCheckNum;
@end

@implementation HHYPRegisterVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"注册";
    self.view.backgroundColor = [UIColor colorWithRed:237/255.0 green:142/255.0f blue:104/255.0f alpha:1.0f];
    [self CreateView];
    [self changeNavagation];
    // Do any additional setup after loading the view.
}

- (void)CreateView{
    self.phoneField = [[UITextField alloc]initWithFrame:CGRectMake(50, Height_NavBar+80, WIDTH-100, 40)];
    self.phoneField.placeholder=@"输入手机号";
    self.phoneField.leftView= [self leftView:[UIImage imageNamed:@"手机图标"]];
    self.phoneField.leftViewMode = UITextFieldViewModeAlways;
    self.phoneField.background = [UIImage imageNamed:@"field_bg"];
    [self.view addSubview:self.phoneField];
    self.checkNumField = [[UITextField alloc]initWithFrame:CGRectMake(50, self.phoneField.y+self.phoneField.height+30, WIDTH-100, 40)];
    self.checkNumField.placeholder=@"输入验证码";
    self.checkNumField.background = [UIImage imageNamed:@"field_bg"];
    self.checkNumField.leftView= [self leftView:[UIImage imageNamed:@"验证图标"]];
    self.checkNumField.leftViewMode = UITextFieldViewModeAlways;
    self.sendCheckNum = [[UIButton alloc]initWithFrame:CGRectMake(0, 5, 120, 30)];
    [self.sendCheckNum setTitle:@"获取验证码" forState:UIControlStateNormal];
    self.sendCheckNum.titleLabel.font=[UIFont systemFontOfSize:13];
    [self.sendCheckNum addTarget:self action:@selector(sendMsg) forControlEvents:UIControlEventTouchUpInside];
    self.checkNumField.rightView =self.sendCheckNum;
    self.checkNumField.rightViewMode= UITextFieldViewModeAlways;
    [self.view addSubview:self.checkNumField];
    self.passWordField = [[UITextField alloc]initWithFrame:CGRectMake(50, self.checkNumField.y+self.checkNumField.height+30, WIDTH-100, 40)];
    self.passWordField.placeholder=@"登陆密码";
    self.passWordField.background = [UIImage imageNamed:@"field_bg"];
    self.passWordField.leftView= [self leftView:[UIImage imageNamed:@"锁"]];
    self.passWordField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:self.passWordField];
    self.confirmField = [[UITextField alloc]initWithFrame:CGRectMake(50, self.passWordField.y+self.passWordField.height+30, WIDTH-100, 40)];
    self.confirmField.placeholder=@"确认密码";
    self.confirmField.leftView= [self leftView:[UIImage imageNamed:@"锁"]];
    self.confirmField.leftViewMode = UITextFieldViewModeAlways;
    self.confirmField.background = [UIImage imageNamed:@"field_bg"];
    [self.view addSubview:self.confirmField];
    UIButton  *registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(50, self.confirmField.y+self.confirmField.height+30, WIDTH-100, 44)];
    [registerBtn setTitle:@"立即注册" forState:UIControlStateNormal];
    registerBtn.backgroundColor =[UIColor colorWithRed:224/255.0f  green:49/255.0f blue:53/255.0f alpha:1.0f];
    [self.view addSubview:registerBtn];
    UIButton *agreeProtocolBtn=[[UIButton alloc]initWithFrame:CGRectMake(40, registerBtn.y+registerBtn.height+15, 40, 40)];
    [agreeProtocolBtn setImage:[UIImage imageNamed:@"同意按钮2"] forState:UIControlStateNormal];
    [self.view addSubview:agreeProtocolBtn];
    UILabel  *lab =[[UILabel alloc]initWithFrame:CGRectMake(agreeProtocolBtn.x+agreeProtocolBtn.width-10, registerBtn.y+registerBtn.height+20, 130, 30)];
    lab.text=@"我已阅读并同意";
    lab.textColor=[UIColor whiteColor];
    [self.view addSubview:lab];
    UIButton  *protocolBtn = [[UIButton alloc]initWithFrame:CGRectMake(lab.x+lab.width-10, registerBtn.y+registerBtn.height+20, 160, 30)];
    [protocolBtn setTitle:@"《伙火有品用户注册协议》" forState:UIControlStateNormal];
    [protocolBtn setTitleColor:[UIColor colorWithRed:224/255.0f  green:49/255.0f blue:53/255.0f alpha:1.0f] forState:UIControlStateNormal];
    protocolBtn.titleLabel.font =[UIFont systemFontOfSize:13];
    [self.view addSubview:protocolBtn];
}
- (void)changeNavagation{
    self.navigationController.navigationBar.barTintColor =[UIColor colorWithRed:224/255.0f  green:49/255.0f blue:53/255.0f alpha:1.0f];
}
- (UIView *)leftView:(UIImage*)image
{
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];
    UIImageView  *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    imageView.image = image;
    [leftView addSubview:imageView];
    return leftView;
}
- (void)sendMsg{
    __block int timeout=60; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(timeout<=0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.sendCheckNum setTitle:@"获取验证码" forState:UIControlStateNormal];
                self.sendCheckNum.userInteractionEnabled = YES;
            });
            
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.sendCheckNum setTitle:[NSString stringWithFormat:@"%d秒后可重新发送",timeout] forState:UIControlStateNormal];
                self.sendCheckNum.userInteractionEnabled = NO;
                
            });
            
            timeout--;
            
        }
        
    });
    
    dispatch_resume(_timer);
    
}
@end
