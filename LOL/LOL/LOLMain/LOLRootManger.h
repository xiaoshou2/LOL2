//
//  LOLRootManger.h
//  LOL
//
//  Created by feibai on 16/1/7.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"
#import "LOLHomeViewController.h"
#import "LOLShowGirlsViewContorller.h"
#import "LOLAccountViewController.h"
@interface LOLRootManger : NSObject<RDVTabBarControllerDelegate>
@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) AppDelegate *appDelegate;
+ (LOLRootManger *)shareManager;

- (void)gotoIntroView;

- (void)gotoMainView;
@end
