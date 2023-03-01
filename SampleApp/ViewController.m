//
//  ViewController.m
//  SampleApp
//
//  Created by 倪梦威 on 2022/11/15.
//
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor greenColor];
    view.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:view];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action: @selector(pushController)]; //点击事件
    [view addGestureRecognizer:tap]; //给view添加点击事件
}

-(void) pushController {
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor purpleColor];
    viewController.navigationItem.title = @"内容"; //设置标题
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右侧标题" menu: nil];  //设置右侧按钮
    [self.navigationController pushViewController:viewController animated:YES]; //路由栈添加
}

@end
