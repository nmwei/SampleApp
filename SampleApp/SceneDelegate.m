//
//  SceneDelegate.m
//  SampleApp
//
//  Created by 倪梦威 on 2022/11/15.
//

#import "SceneDelegate.h"
#import "ViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    UIViewController *c1 = [[UIViewController alloc] init];
    c1.view.backgroundColor = [UIColor redColor];
    c1.title = @"新闻";
 
    UIViewController *c2 = [[UIViewController alloc] init];
    c2.view.backgroundColor = [UIColor yellowColor];
    c2.title = @"视频";
 
    UIViewController *c3 = [[UIViewController alloc] init];
    c3.view.backgroundColor = [UIColor blueColor];
    c3.title = @"推荐";
 
    UIViewController *c4 = [[UIViewController alloc] init];
    c4.view.backgroundColor = [UIColor greenColor];
    c4.title = @"我的";
 
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    // 将四个页面的 UIViewController 加入到 UITabBarController 之中
    [tabBarController setViewControllers: @[c1, c2, c3, c4]];
     
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
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor redColor]};
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor grayColor]};
        // 设置背景色和不透明
        appearance.backgroundColor = [UIColor whiteColor];
        // 设置阴影
        appearance.shadowColor = [UIColor blackColor];
        // 应用到UITabBar实例
        UITabBar *tabBar = tabBarController.tabBar;
        tabBar.standardAppearance = appearance;
        tabBar.scrollEdgeAppearance = appearance;
    }
     
    self.window.rootViewController = tabBarController; //将UITabBarController设置为Window的RootViewController
    [self.window makeKeyAndVisible]; // 显示Window
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
