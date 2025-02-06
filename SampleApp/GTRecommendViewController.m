//
//  GTRecommendViewController.m
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/6.
//

#import "GTRecommendViewController.h"

@interface GTRecommendViewController ()

@end

@implementation GTRecommendViewController

-(instancetype)init {
    self = [super init];
    if(self) {
        self.tabBarItem.title = @"推荐";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
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
