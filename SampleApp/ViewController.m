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
    [self.view addSubview:({
            UILabel *label = [[UILabel alloc] init];
            label.text = @"hello world";
            [label sizeToFit];
            label.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
            label;
    })];
}


@end
