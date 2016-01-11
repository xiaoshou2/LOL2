//
//  AppDelegate.m
//  LOL
//
//  Created by feibai on 16/1/5.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "AppDelegate.h"
#import "LOLRootManger.h"
#import "MMDrawerController.h"
#import "CCCCViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[LOLRootManger shareManager] gotoIntroView];//初始化tabBar
//    [self setupViewControllers];
    return YES;
}


#pragma mark 自定义tabBar
- (void)setupViewControllers
{
   LOLHomeViewController *homeVC = [[LOLHomeViewController alloc] init];
   LOLShowGirlsViewContorller *showGrlsVC = [[LOLShowGirlsViewContorller alloc] init];
   LOLAccountViewController *accountVC = [[LOLAccountViewController alloc] init];
   _tabBarController = [[RDVTabBarController alloc] init];
   _tabBarController.delegate = self;
  [_tabBarController setViewControllers:@[homeVC, showGrlsVC, accountVC]];
  [self customizeTabBarForController:_tabBarController];
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController {
    UIImage *finishedImage =  KAPPIMAGE ;//[self buttonImageFromColor:KDEFAULT_COLOR];
    UIImage *unfinishedImage =  KAPPIMAGE;//[self buttonImageFromColor:KDEFAULT_COLOR];
  
    NSArray *tabBarItemSelectedImages = @[@"yw_home_selected_new",
                                          @"yw_years_new", @"yw_cart_selected_new",
                                          @"yw_account_selected_new"];
    
    NSArray *tabBarItemImages = @[@"yw_home_normal_new",
                                  @"yw_years_new", @"yw_cart_normal_new",
                                  @"yw_account_normal_new"];
    
    NSArray *tabBarItemTitles = @[@"", @"showGirl", @"个人中心"];
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        item.title = tabBarItemTitles[index];
       
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        
        NSString *itemSelectedName = [tabBarItemSelectedImages objectAtIndex:index];
        NSString *itemName         = [tabBarItemImages objectAtIndex:index];
        
        UIImage *selectedimage     = [UIImage imageNamed:itemSelectedName];
        UIImage *unselectedimage   = [UIImage imageNamed:itemName];
        
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        
        index++;
    }
    
    _rootNavVC = [[LOLRootNavVC alloc] initWithRootViewController:_tabBarController];
    //viewController.fd_interactivePopDisabled = YES;
    [_rootNavVC setNavigationBarHidden:YES];
//   _lcNavigationController.fd_fullscreenPopGestureRecognizer.enabled = NO;
    self.window.rootViewController = _rootNavVC;
}
- (UINavigationController *)getRootNav{
     return self.rootNavVC;
}

#pragma mark - RDVTabBarControllerDelegate
- (void)tabBarController:(RDVTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    //壹药网统计
  //  LOLBaseViewController *viewCtrl = (LOLBaseViewController *)viewController;
    switch (tabBarController.selectedIndex) {
        case 0://首页
//            [YWBehaviorStatisticsManager recordUserHandleBehaviorWithActionName:(NSString *)YW_Action_Click eventId:(NSString *)YW_EventID_tabbar_home viewController:viewCtrl curPageDict:@{} extendedDict:nil];
            break;
        case 1://分类
//            [YWBehaviorStatisticsManager recordUserHandleBehaviorWithActionName:(NSString *)YW_Action_Click eventId:(NSString *)YW_EventID_tabbar_category viewController:viewCtrl curPageDict:@{} extendedDict:nil];
            break;
        case 2://web
//            [YWBehaviorStatisticsManager recordUserHandleBehaviorWithActionName:(NSString *)YW_Action_Click eventId:(NSString *)YW_EventID_tabbar_category viewController:viewCtrl curPageDict:@{} extendedDict:nil];
            break;
            
        case 3://购物车
//            [YWBehaviorStatisticsManager recordUserHandleBehaviorWithActionName:(NSString *)YW_Action_Click eventId:(NSString *)YW_EventID_tabbar_shopcart viewController:viewCtrl curPageDict:@{} extendedDict:nil];
            break;
        case 4://个人中心我
        {
//            YWAccountViewController * account = (YWAccountViewController *)viewCtrl;
//            account.gotoindex = -1;
//            [YWBehaviorStatisticsManager recordUserHandleBehaviorWithActionName:(NSString *)YW_Action_Click eventId:(NSString *)YW_EventID_tabbar_mine viewController:viewCtrl curPageDict:@{} extendedDict:nil];
            break;
        }
        default:
            break;
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
