//
//  AppDelegate.h
//  LOL
//
//  Created by feibai on 16/1/5.
//  Copyright © 2016年 feibai. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"
#import "LOLHomeViewController.h"
#import "LOLDemandHallVC.h"
#import "LOLShowGirlsViewContorller.h"
#import "LOLAccountViewController.h"
#import "LOLRootNavVC.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,RDVTabBarControllerDelegate,UINavigationControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) RDVTabBarController *tabBarController;
@property (strong, nonatomic) LOLRootNavVC *rootNavVC;
- (void)setupViewControllers;
- (UINavigationController *)getRootNav;
@end

