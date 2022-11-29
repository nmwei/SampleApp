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
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:view];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor blueColor];
    view2.frame = CGRectMake(150, 150, 100, 100);
    [self.view addSubview:view2];
}


@end
