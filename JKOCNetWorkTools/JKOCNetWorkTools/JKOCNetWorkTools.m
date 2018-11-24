//
//  JKOCNetWorkTools.m
//  JKOCNetWorkToolsDemo
//
//  Created by 王冲 on 2018/11/24.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "JKOCNetWorkTools.h"

// 正式的接口
// static NSString * const BASE_URL  =  @"https://";
// 测试的接口
static NSString * const BASE_URL  =  @"https://";
/** token的配置（也就是HTTPHeader）要根据自己后t后台的配合 */
static NSString * const HTTPHeaderFieldValue  =  @"X-CIO-Request-Userid";


@implementation JKOCNetWorkTools

+(AFHTTPSessionManager *)manger{
    
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"user.data"];
    
    LoginUserModel *loginUserModel = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    NSString *userID = [NSString stringWithFormat:@"%@",loginUserModel.userID];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    // waiting..
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    if (userID) {
        [manager.requestSerializer setValue:userID forHTTPHeaderField:HTTPHeaderFieldValue];
    }
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    /** 超时的时间设置 */
    manager.requestSerializer.timeoutInterval = 10.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    return manager;
}

#pragma mark 网络错误的处理
+(NSString *)dealWithError:(NSError * _Nonnull)error{
    
    NSDictionary *dict = error.userInfo;
    
    if (dict[@"com.alamofire.serialization.response.error.data"]) {
        
        NSDictionary *dict11 = [NSJSONSerialization JSONObjectWithData:dict[@"com.alamofire.serialization.response.error.data"] options:NSJSONReadingAllowFragments error:nil];
        
        NSString *str = [NSString stringWithFormat:@"%@",dict11[@"error_message"]];
        
        if (str) {
            
            //服务器返回的业务逻辑报文信息
            return str;
        }else{
            return @"网络错误";
        }
    }
    
    return @"网络错误";
}


/**
 登录接口
 
 @param phoneNumber 手机号码
 @param password 密码
 @param success 成功返回model
 @param fail 返回失败的字符串
 */
+(void)logintPhoneNumber:(NSString *)phoneNumber withPassword:(NSString *)password withsuccess:(JKSuccessLoginModel)success withfail:(JKFailed)fail{
    
    NSDictionary *dict = [[NSDictionary alloc]init];
    dict = @{@"phoneNumber":phoneNumber,@"password":password};
    
    NSString *strUrl = [BASE_URL stringByAppendingString:@"你的登录接口"];
    
    [[JKOCNetWorkTools manger]POST:strUrl parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        //获取已有完整路径
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
        NSMutableDictionary *usersDic = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
        
        LoginUserModel *model = [LoginUserModel mj_objectWithKeyValues:usersDic];
        success(model);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSString *errorString = [self dealWithError:error];
        fail(errorString);
    }];
}


@end
