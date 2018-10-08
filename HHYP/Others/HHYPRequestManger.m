//
//  HHYPRequestManger.m
//  HHYP
//
//  Created by JFWoo on 2018/9/26.
//  Copyright © 2018年 JFWoo. All rights reserved.
//

#import "HHYPRequestManger.h"
#import <AFNetworking.h>
static HHYPRequestManger *_manger;
@implementation HHYPRequestManger
+(instancetype)shareMange{
    
   static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _manger = [[HHYPRequestManger allocWithZone:nil] init];
    });
    return _manger;
}
- (void)Get:(NSString *)urlStr success:(block)successBlock faile:(block)faileBlock{
    AFHTTPSessionManager  *mangers =[AFHTTPSessionManager manager];
    [mangers GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        faileBlock(error);
        
    }];
}
- (void)Post:(NSString *)urlStr parmters:(NSDictionary *)parmters success:(block)sucessBlock faile:(block)faileBlock{
     AFHTTPSessionManager  *mangers =[AFHTTPSessionManager manager];
    [mangers POST:urlStr parameters:parmters constructingBodyWithBlock:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        sucessBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        faileBlock(error);
    }];
}
@end
