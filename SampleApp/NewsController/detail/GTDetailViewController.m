//
//  GTDetailViewController.m
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/7.
//

#import "GTDetailViewController.h"
#import <WebKit/WebKit.h>

@interface GTDetailViewController ()<WKNavigationDelegate>
@property (nonatomic, strong, readwrite) WKWebView *webView;
@property (nonatomic, strong, readwrite) UIProgressView *progressView;
@property(nonatomic, copy, readwrite) NSString *articleUrl;

@end

@implementation GTDetailViewController

- (void) dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (instancetype) initWithUrlString:(NSString *) urlString {
    self = [super init];
    if(self) {
        self.articleUrl = urlString;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:({
        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88)];
        self.webView.navigationDelegate = self;
        self.webView;
    })];
    
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc] initWithFrame: CGRectMake(0, 95, self.view.frame.size.width, 10)];
        self.progressView;
    })];

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.articleUrl]]];
    
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options: NSKeyValueObservingOptionNew context:nil];
    
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    self.progressView.progress = self.webView.estimatedProgress;
}



- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    decisionHandler(WKNavigationResponsePolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"webview加载完成");
}

@end
