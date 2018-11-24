//
//  TestViewController.m
//  JKOCNetWorkToolsDemo
//
//  Created by 王冲 on 2018/11/24.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "TestViewController.h"
#import "LoginUserModel.h"
@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"解归档" style:UIBarButtonItemStylePlain target:self action:@selector(unarchive)];
}

#pragma mark 解归档
-(void)unarchive{
    
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"user.data"];
    LoginUserModel *loginUserModel = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    NSLog(@"用户的UserID==%@\n用户的courseInfo数组=%@",loginUserModel.userID,loginUserModel.courseInfo);
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
