//
//  GTDetailViewController.m
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/7.
//

#import "GTDetailViewController.h"
#import <WebKit/WebKit.h>

@interface GTDetailViewController ()
@property (nonatomic, strong, readwrite) WKWebView *webView;

@end

@implementation GTDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:({
        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88)];
        self.webView;
    })];

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://time.geekbang.org/"]]];
    
}

@end
