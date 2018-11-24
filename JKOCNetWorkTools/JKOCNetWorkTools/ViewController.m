//
//  ViewController.m
//  JKOCNetWorkTools
//
//  Created by 王冲 on 2018/11/24.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "ViewController.h"

#import "TestViewController.h"
#import "LoginUserModel.h"
#import "CourseInfoModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(login)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"退出登录" style:UIBarButtonItemStylePlain target:self action:@selector(deleteData)];
}

#pragma mark 模拟登录(归档数据)
-(void)login{
    
    /*
     [JKOCNetWorkTools logintPhoneNumber:@"12345678" withPassword:@"12345" withsuccess:^(LoginUserModel * _Nonnull loginUserModel) {
     
     NSLog(@"登录成功");
     
     } withfail:^(NSString * _Nonnull failed) {
     
     NSLog(@"登录失败");
     }];
     */
    
    //获取已有完整路径
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    NSMutableDictionary *usersDic = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    LoginUserModel *model = [LoginUserModel mj_objectWithKeyValues:usersDic];
    
    // 取出 infoModel 里面的 courseId
    /*
     NSLog(@"infoModel===%@",model.courseInfo);
     NSLog(@"message===%@",model.message);
     NSLog(@"message===%@",model.state);
     NSLog(@"ID===%@",model.userID);
     NSLog(@"test===%@",model.test);
     
     for (CourseInfoModel *courseInfoModel in model.courseInfo) {
     
     NSLog(@"courseId == %@ courseIndex == %@",courseInfoModel.courseId,courseInfoModel.courseIndex);
     }
     */
    
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"user.data"];
    /* 存储数据*/
    BOOL archiveResult = [NSKeyedArchiver archiveRootObject:model toFile:filePath];
    if (archiveResult) {
        
        NSLog(@"存储成功---登录成功");
    }else{
        NSLog(@"存储失败---登录失败");
    }
    
}

#pragma mark 退出登录(删除归档数据)
-(void)deleteData{
    
    //删除归档文件
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"user.data"];
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    if ([defaultManager isDeletableFileAtPath:filePath] && [defaultManager fileExistsAtPath:filePath]) {
        
        BOOL deleteResult = [defaultManager removeItemAtPath:filePath error:nil];
        if (deleteResult) {
            
            NSLog(@"删除成功----退出成功");
        }else{
            NSLog(@"删除失败----退出失败");
        }
        
    }else{
        
        NSLog(@"文件不存在或者不可删除");
    }
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    TestViewController *test = [[TestViewController alloc]init];
    [self.navigationController pushViewController:test animated:YES];
}
@end
