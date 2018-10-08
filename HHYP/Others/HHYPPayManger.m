//
//  HHYPPayManger.m
//  HHYP
//
//  Created by JFWoo on 2018/9/26.
//  Copyright © 2018年 JFWoo. All rights reserved.
//

#import "HHYPPayManger.h"
#import <AlipaySDK/AlipaySDK.h>
static HHYPPayManger  *_instance;
@implementation HHYPPayManger
+ (instancetype)shareMange{
   
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
        
    }) ;
    return _instance;
}
- (void)AliPay:(NSString *)OrderString{
    [[AlipaySDK defaultService]payOrder:OrderString fromScheme:nil callback:^(NSDictionary *resultDic) {
        
    }];
}
- (void)WeChatPay:(id)object{
    
}
@end
