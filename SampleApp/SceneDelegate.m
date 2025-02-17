//
//  SceneDelegate.m
//  SampleApp
//
//  Created by 倪梦威 on 2022/11/15.
//

#import "GTNewsViewController.h"
#import "GTRecommendViewController.h"
#import "GTVideoViewController.h"
#import "SceneDelegate.h"
#import "GTSplashView.h"
#import "GTStiticTest.h"
#import "GTFramework/GTFrameworkTest.h"
#include "execinfo.h"
#import "GTLocation.h"

@interface SceneDelegate ()<UITabBarControllerDelegate>

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    GTNewsViewController *newsViewController = [[GTNewsViewController alloc] init];

    newsViewController.view.backgroundColor = [UIColor yellowColor];
    newsViewController.tabBarItem.title = @"新闻";


    GTVideoViewController *videoController = [[GTVideoViewController alloc] init];

    GTRecommendViewController *recommendController = [[GTRecommendViewController alloc] init];

    UIViewController *mineViewController = [[UIViewController alloc] init];
    mineViewController.view.backgroundColor = [UIColor greenColor];
    mineViewController.tabBarItem.title = @"我的";

    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    // 将一个UINavigationController和三个 UIViewController 加入到 UITabBarController 之中
    [tabBarController setViewControllers:@[newsViewController, videoController, recommendController, mineViewController]];

    tabBarController.delegate = self;   // 表示当前对象执行tabBarController的delegate方法

    // 自定义UITabBar的外观和行为
    UITabBar *tabBar = tabBarController.tabBar;
    tabBar.tintColor = [UIColor redColor]; // 选中状态颜色
    tabBar.unselectedItemTintColor = [UIColor grayColor]; // 非选中状态颜色
    tabBar.barTintColor = [UIColor whiteColor]; // 背景色
    tabBar.translucent = NO; // 不透明
    tabBar.layer.shadowColor = [UIColor blackColor].CGColor; // 阴影色
    tabBar.layer.shadowOffset = CGSizeMake(0, -2); // 阴影偏移量
    tabBar.layer.shadowRadius = 4; // 阴影半径
    tabBar.layer.shadowOpacity = 0.3; // 阴影透明度

    if (@available(iOS 15.0, *)) {
        UITabBarAppearance *appearance = [[UITabBarAppearance alloc] init];
        // 设置选中和非选中状态颜色
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = @{
                NSForegroundColorAttributeName: [UIColor redColor]
        };
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = @{
                NSForegroundColorAttributeName: [UIColor grayColor]
        };
        // 设置背景色和不透明
        appearance.backgroundColor = [UIColor whiteColor];
        // 设置阴影
        appearance.shadowColor = [UIColor blackColor];
        // 应用到UITabBar实例
        UITabBar *tabBar = tabBarController.tabBar;
        tabBar.standardAppearance = appearance;
        tabBar.scrollEdgeAppearance = appearance;
    }

    UINavigationController *n1 = [[UINavigationController alloc] initWithRootViewController:tabBarController];
    // n1.view.backgroundColor = [UIColor redColor];
    n1.tabBarItem.title = @"新闻";

    if (@available(iOS 15.0, *)) {
        UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
        // appearance.backgroundColor = [UIColor blueColor]; //背景颜色

        appearance.titleTextAttributes = @{
                NSFontAttributeName: [UIFont systemFontOfSize:20], NSForegroundColorAttributeName: [UIColor whiteColor]
        };                                                                                                                                        //字体样式

        //按钮样式
        UIBarButtonItemAppearance *doneAppearance = [[UIBarButtonItemAppearance alloc] init];
        doneAppearance.normal.titleTextAttributes = @{
                NSFontAttributeName: [UIFont systemFontOfSize:16], NSForegroundColorAttributeName: [UIColor whiteColor]
        };
        appearance.doneButtonAppearance = doneAppearance;

        n1.navigationBar.standardAppearance = appearance;
        n1.navigationBar.scrollEdgeAppearance = appearance;
    }

    self.window.rootViewController = n1; //将UITabBarController设置为Window的RootViewController
    [self.window makeKeyAndVisible]; // 显示Window
    
    [self.window addSubview:({
        GTSplashView *splashView = [[GTSplashView alloc] initWithFrame:self.window.bounds];
        splashView;
    })];
    
    //static
    // [[GTStiticTest alloc] init];
    
    //framework
    // [[GTFrameworkTest alloc] init];
    [self _caughtException];
    // [@[].mutableCopy addObject:nil];
    
    [[GTLocation locationManager] checkLocationAuthorization];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"did selected");
}

// 连接到会话时
- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}

// 后台 → 前台
- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}

// 后台 → 前台
- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}

// 后台 → 前台
- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


// 前台 → 后台
- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}

- (void)scene:(UIScene *)scene openURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts {
    for (UIOpenURLContext *urlContext in URLContexts) {
        NSURL *url = urlContext.URL;
       // todo
    }
}

-(void) _caughtException{
    //NSException
    NSSetUncaughtExceptionHandler(HandleNSException);
    
    //signal
    signal(SIGABRT, SignalExceptionHandler);
    signal(SIGILL, SignalExceptionHandler);
    signal(SIGSEGV, SignalExceptionHandler);
    signal(SIGFPE, SignalExceptionHandler);
    signal(SIGBUS, SignalExceptionHandler);
    signal(SIGPIPE, SignalExceptionHandler);
}

void SignalExceptionHandler(int signal) {
    void *callstack[128];
    int frames = backtrace(callstack, 128);
    char **strs = backtrace_symbols(callstack, frames);
    NSMutableArray *backtrace = [NSMutableArray arrayWithCapacity:frames];
    for(int i = 0; i < frames; i++){
        [backtrace addObject: [NSString stringWithUTF8String:strs[i]]];
    }
    free(strs);
    // 存储crash信息
    
}

void HandleNSException(NSException *exception){
    __unused NSString *reason = [exception reason];
    __unused NSString *name = [exception name];
    // 存储crash信息
}
@end
