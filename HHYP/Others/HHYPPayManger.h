//
//  HHYPPayManger.h
//  HHYP
//
//  Created by JFWoo on 2018/9/26.
//  Copyright © 2018年 JFWoo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHYPPayManger : NSObject
+(instancetype)shareMange;
- (void)WeChatPay:(id)object;
- (void)AliPay:(NSString *)OrderString;
@end

NS_ASSUME_NONNULL_END
