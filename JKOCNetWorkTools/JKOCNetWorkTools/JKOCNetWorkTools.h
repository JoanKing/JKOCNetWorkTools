//
//  JKOCNetWorkTools.h
//  JKOCNetWorkToolsDemo
//
//  Created by 王冲 on 2018/11/24.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "LoginUserModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^JKSuccessArray)(NSArray *array);
typedef void(^JKSuccessDictionary)(NSDictionary *dictionary);
typedef void(^JKFailed)(NSString *failed);

typedef void(^JKSuccessLoginModel)(LoginUserModel *loginUserModel);


@interface JKOCNetWorkTools : NSObject

#pragma mark 1.登录接口
+(void)logintPhoneNumber:(NSString *)phoneNumber withPassword:(NSString *)password withsuccess:(JKSuccessLoginModel)success withfail:(JKFailed)fail;


@end

NS_ASSUME_NONNULL_END
