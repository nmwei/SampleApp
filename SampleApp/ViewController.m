//
//  ViewController.m
//  SampleApp
//
//  Created by 倪梦威 on 2022/11/15.
//

#import "ViewController.h"


@interface TestView : UIView
@end


@implementation TestView
-(instancetype) init{
    self = [super init]; //1. 初始化
    if(self) {
        
    }
    return self;
}
- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    [super willMoveToSuperview: newSuperview]; //2. 将要被添加到父视图
};

- (void)didMoveToSuperview{
    [super didMoveToSuperview]; //3. 已经添加到父视图
};

- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToWindow: newWindow]; //4. 将要添加到窗体
};

- (void)didMoveToWindow{
    [super didMoveToWindow]; //5. 已经添加到窗体
};

@end



@interface ViewController ()

@end

@implementation ViewController

-(instancetype) init{
    self = [super init];
    if(self) {
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
};
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
};
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
};
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
};

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    TestView *view = [[TestView alloc] init];
    view.backgroundColor = [UIColor greenColor];
    view.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:view];
    
    
    
}


@end
