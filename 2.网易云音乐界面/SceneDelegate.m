#import "SceneDelegate.h"
#import "ViewControllerOne.h"
#import "ViewControllerTwo.h"
#import "ViewControllerThree.h"
#import "ViewControllerFour.h"
#import "ViewControllerFive.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene*)scene];
    [self.window makeKeyAndVisible];
    
    ViewControllerOne* home = [[ViewControllerOne alloc] init];
    ViewControllerTwo* account = [[ViewControllerTwo alloc] init];
    ViewControllerThree* find = [[ViewControllerThree alloc] init];
    ViewControllerFour* video = [[ViewControllerFour alloc] init];
    ViewControllerFive* village = [[ViewControllerFive alloc] init];

    //添加图标
    home.tabBarItem.image = [UIImage imageNamed:@"icon1.png"];
    account.tabBarItem.image = [UIImage imageNamed:@"icon2.png"];
    find.tabBarItem.image = [UIImage imageNamed:@"icon0.png"];
    video.tabBarItem.image = [UIImage imageNamed:@"icon-1.png"];
    village.tabBarItem.image = [UIImage imageNamed:@"icon-2.png"];

    home.title = @"我 的";
    account.title = @"账 号";
    find.title = @"发 现";
    video.title = @"视频";
    village.title = @"云村";

    UINavigationController* homeController = [[UINavigationController alloc] initWithRootViewController:home];
    UINavigationController* accountController = [[UINavigationController alloc] initWithRootViewController:account];
    UINavigationController* findController = [[UINavigationController alloc] initWithRootViewController:find];
    UINavigationController* videoController = [[UINavigationController alloc] initWithRootViewController:video];
    UINavigationController* villageController = [[UINavigationController alloc] initWithRootViewController:village];

    NSArray* arr = [NSArray arrayWithObjects:findController, videoController, homeController, villageController, accountController, nil];

    //创建分栏控制器
    UITabBarController* tabBar = [[UITabBarController alloc] init];
    tabBar.tabBar.tintColor = [UIColor redColor];
    //分栏控制器颜色不透明
    tabBar.tabBar.translucent = YES;
    tabBar.viewControllers = arr;
    self.window.rootViewController = tabBar;
}
    
//    //设置启动页
//    _viewControllerStart = [[UIViewController alloc] init];
//    UIImageView* imageStart = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"musicStart.jpg"]];
//    CGRect cr=[[UIScreen mainScreen] bounds];
//    imageStart.frame = CGRectMake(0, 0, cr.size.width, cr.size.height);
//    [_viewControllerStart.view addSubview:imageStart];
//    [self.window addSubview:_viewControllerStart.view];
//    //设置计时器
//    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(startImageTime) userInfo:nil repeats:NO];
//}

//- (void)startImageTime {
//    ViewControllerOne* home = [[ViewControllerOne alloc] init];
//    ViewControllerTwo* account = [[ViewControllerTwo alloc] init];
//
//    //添加图标
//    home.tabBarItem.image = [UIImage imageNamed:@"icon1.png"];
//    account.tabBarItem.image = [UIImage imageNamed:@"icon2.png"];
//
//    home.title = @"我 的";
//    account.title = @"账 户";
//
//    UINavigationController* homeController = [[UINavigationController alloc] initWithRootViewController:home];
//    UINavigationController* accountController = [[UINavigationController alloc] initWithRootViewController:account];
//    NSArray* arr = [NSArray arrayWithObjects:homeController, accountController, nil];
//
//    //创建分栏控制器
//    UITabBarController* tabBar = [[UITabBarController alloc] init];
//    tabBar.tabBar.tintColor = [UIColor redColor];
//    //分栏控制器颜色不透明
//    tabBar.tabBar.translucent = YES;
//    tabBar.viewControllers = arr;
//    self.window.rootViewController = tabBar;
//}

- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
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
