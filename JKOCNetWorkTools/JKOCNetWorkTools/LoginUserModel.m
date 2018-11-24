//
//  LoginUserModel.m
//  JKOCNetWorkToolsDemo
//
//  Created by 王冲 on 2018/11/24.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "LoginUserModel.h"

@implementation LoginUserModel

#pragma mark 归档数据(存数据)
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        
        self.userID = [aDecoder decodeObjectForKey:@"userID"];
        self.message = [aDecoder decodeObjectForKey:@"message"];
        self.state = [aDecoder decodeObjectForKey:@"state"];
        self.test = [aDecoder decodeObjectForKey:@"test"];
        self.courseInfo = [aDecoder decodeObjectForKey:@"courseInfo"];
        
    }
    return self;
}

#pragma mark 解归档数据(取数据)
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.userID forKey:@"userID"];
    [aCoder encodeObject:self.message forKey:@"message"];
    [aCoder encodeObject:self.state forKey:@"state"];
    [aCoder encodeObject:self.test forKey:@"test"];
    [aCoder encodeObject:self.courseInfo forKey:@"courseInfo"];
}

#pragma mark 下面是 MJExtension 的 model
+ (NSDictionary *)objectClassInArray{
    return @{
             @"courseInfo" : @"CourseInfoModel"
             
             };
}

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"courseInfo" : @"info.courseInfo",@"userID":@"id"
             
             };
}

@end
