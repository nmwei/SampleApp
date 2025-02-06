//
//  GTRecommendViewController.m
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/6.
//

#import "GTRecommendViewController.h"

@interface GTRecommendViewController ()<UIScrollViewDelegate>

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
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height * 3);
    
    scrollView.delegate = self;
    
    NSArray *colorArray = @[[UIColor redColor],[UIColor orangeColor],[UIColor blueColor],[UIColor yellowColor],[UIColor lightGrayColor]];
    
    for (int i = 0; i < 5; i++) {
        [scrollView addSubview:({
            CGSize size = scrollView.bounds.size;
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(size.width * i, 0, size.width, size.height)];
            view.backgroundColor = [colorArray objectAtIndex: i];
            view;
        })];
    }
    
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidScroll - x:%@, y:%@", @(scrollView.contentOffset.x), @(scrollView.contentOffset.y));
};

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"BeginDragging");
};

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"EndDragging");
};

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"BeginDecelerating");
};
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"EndDecelerating");
};

@end
