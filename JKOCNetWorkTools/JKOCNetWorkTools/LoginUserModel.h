//
//  LoginUserModel.h
//  JKOCNetWorkToolsDemo
//
//  Created by 王冲 on 2018/11/24.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CourseInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginUserModel : NSObject<NSCoding>

@property(nonatomic,strong) NSString *message;

@property(nonatomic,strong) NSArray *courseInfo;

@property(nonatomic,strong) NSString *state;

@property(nonatomic,strong) NSString *userID;


@property(nonatomic,strong) NSString *test;




@end

NS_ASSUME_NONNULL_END
