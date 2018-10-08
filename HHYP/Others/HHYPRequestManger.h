//
//  HHYPRequestManger.h
//  HHYP
//
//  Created by JFWoo on 2018/9/26.
//  Copyright © 2018年 JFWoo. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^block)(id object);
NS_ASSUME_NONNULL_BEGIN

@interface HHYPRequestManger : NSObject
+(instancetype)shareMange;
-(void)Get:(NSString *)urlStr success:(block)successBlock faile:(block)faileBlock;
-(void)Post:(NSString *)urlStr parmters:(NSDictionary *)parmters success:(block)sucessBlock faile:(block)faileBlock;
@end
NS_ASSUME_NONNULL_END
