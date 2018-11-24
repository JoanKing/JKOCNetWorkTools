//
//  CourseInfoModel.m
//  MJExtension使用
//
//  Created by 王冲 on 2018/10/26.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "CourseInfoModel.h"

@implementation CourseInfoModel

#pragma mark 归档数据(存数据)
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        
        self.courseId = [aDecoder decodeObjectForKey:@"courseId"];
        self.courseIndex = [aDecoder decodeObjectForKey:@"courseIndex"];
        
    }
    return self;
}

#pragma mark 解归档数据(取数据)
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.courseId forKey:@"courseId"];
    [aCoder encodeObject:self.courseIndex forKey:@"courseIndex"];
}
@end
