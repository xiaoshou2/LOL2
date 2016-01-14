//
//  LOLRootManger.m
//  LOL
//
//  Created by feibai on 16/1/7.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLRootManger.h"

@implementation LOLRootManger
static  LOLRootManger *shareManager = nil;

#pragma mark - Init

+ (LOLRootManger *)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[LOLRootManger alloc] init];
    });
    return shareManager;
}

- (id)init {
    self = [super init];
    if (self) {
        _window = [self mainWindow];
    }
    return self;
}

#pragma mark - Method 引导页面

- (void)gotoIntroView {
//    if ([YWDisposableUtility enableWithEvent:YWDisposableEventIntro]) {
//        YWIntroViewController *introController = [[YWIntroViewController alloc] init];
//        self.window.rootViewController = introController;
//        
//        [YWDisposableUtility disableEvent:YWDisposableEventIntro];
//        
//    }else {
        [self gotoMainView];
   // }
}
- (void)gotoMainView {
    [self.appDelegate setupViewControllers];
}


- (RDVTabBarController*)setupViewControllers {
    LOLHomeViewController *homeVC = [[LOLHomeViewController alloc] init];
    LOLShowGirlsViewContorller *showGrlsVC = [[LOLShowGirlsViewContorller alloc] init];
    LOLAccountViewController *accoutVC = [[LOLAccountViewController alloc] init];
    RDVTabBarController *tabBarController = [[RDVTabBarController alloc] init];
    tabBarController.delegate = self;
    [tabBarController setViewControllers:@[homeVC,showGrlsVC,accoutVC]];
    [self customizeTabBarForController:tabBarController];
    return tabBarController;
}
- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController {
    
    
    UIImage *finishedImage =  KAPPIMAGE ;//[self buttonImageFromColor:KDEFAULT_COLOR];
    UIImage *unfinishedImage =  KAPPIMAGE;//[self buttonImageFromColor:KDEFAULT_COLOR];
    
    NSArray *tabBarItemSelectedImages = @[@"yw_home_selected",@"yw_category_selected",
                                          @"yw_cart_selected",@"yw_account_selected"];
    
    NSArray *tabBarItemImages = @[@"yw_home_normal", @"yw_category_normal", @"yw_cart_normal",@"yw_account_normal"];
    
    
    
    NSArray *tabBarItemTitles = @[@"首页",@"分类",@"购物车",@"我"];
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
    
    UINavigationController *lcNavigationController = [[UINavigationController alloc] initWithRootViewController:tabBarController];
    lcNavigationController.navigationBarHidden = YES;
  
    self.window.rootViewController = lcNavigationController;
}
#pragma mark - Getter

- (UIWindow *)mainWindow
{
    UIApplication *app = [UIApplication sharedApplication];
    
    if ([app.delegate respondsToSelector:@selector(window)]) {
        return [app.delegate window];
    } else {
        return [app keyWindow];
    }
}

- (AppDelegate *)appDelegate {
    UIApplication *app = [UIApplication sharedApplication];
    return (AppDelegate*)app.delegate;
}
@end
