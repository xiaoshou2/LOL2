/*
 *  UIViewController+MBProgressHUD.m
 *
 *  Created by Adam Duke on 10/20/11.
 *  Copyright 2011 appRenaissance, LLC. All rights reserved.
 *
 */

#import "MBProgressHUD.h"
#import "UIViewController+MBProgressHUD.h"
#import "YWSpritesLoadingView.h"
#import <objc/runtime.h>

/* This key is used to dynamically create an instance variable
 * within the MBProgressHUD category using objc_setAssociatedObject
 */
const char *progressHUDKey = "progressHUDKey";

/* This key is used to dynamically create an instance variable
 * within the MBProgressHUD category using objc_setAssociatedObject
 */
const char *finishedHandlerKey = "finishedHandlerKey";

@interface UIViewController (MBProgressHUD_Private)

@property (nonatomic, retain) MBProgressHUD *progressHUD;

@property (nonatomic, copy) HUDFinishedHandler finishedHandler;

@end

@implementation UIViewController (MBProgressHUD)

- (MBProgressHUD *)progressHUD
{
    MBProgressHUD *hud = objc_getAssociatedObject(self, progressHUDKey);
    if(!hud)
    {
  
        hud = [[MBProgressHUD alloc] initWithView:self.view];
        hud.dimBackground = NO;
        hud.removeFromSuperViewOnHide = YES;
        hud.opacity = 0.0;
        YWSpritesLoadingView *loadingView = [[YWSpritesLoadingView alloc] initWithFrame:CGRectMake(0, 0, 55., 55.)];
        hud.customView = loadingView;
        hud.mode = MBProgressHUDModeCustomView;
        self.progressHUD = hud;
        [self.view addSubview:hud];
  }
    return hud;
}

- (void)setProgressHUD:(MBProgressHUD *)progressHUD
{
    objc_setAssociatedObject(self, progressHUDKey, progressHUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HUDFinishedHandler)finishedHandler
{
    HUDFinishedHandler block = objc_getAssociatedObject(self, finishedHandlerKey);
    return block;
}

- (void)setFinishedHandler:(HUDFinishedHandler)completionBlock
{
    objc_setAssociatedObject(self, finishedHandlerKey, completionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)_showHUDWithMessage:(NSString *)message
{
    self.progressHUD.labelText = message;
    if(self.progressHUD.taskInProgress)
    {
        return;
    }
    self.progressHUD.taskInProgress = YES;
    [self.progressHUD show:YES];
}

-(void)showHUDwithTime{
    MBProgressHUD *hud = objc_getAssociatedObject(self, progressHUDKey);
    
        
        hud = [[MBProgressHUD alloc] initWithView:self.view];
        hud.dimBackground = NO;
        hud.removeFromSuperViewOnHide = YES;
        hud.opacity = 0.0;
        YWSpritesLoadingView *loadingView = [[YWSpritesLoadingView alloc] initWithFrame:CGRectMake(0, 0, 55., 55.)];
        hud.customView = loadingView;
        hud.mode = MBProgressHUDModeCustomView;
        self.progressHUD = hud;
        self.progressHUD.labelText = nil;
        [hud show:YES];
        [hud hide:YES afterDelay:1.5];
        [self.view addSubview:hud];
    
}

- (void)showHUD
{
    [self _showHUDWithMessage:nil];
}

- (void)showOnlyWords:(NSString *)words {
    
    self.progressHUD.mode = MBProgressHUDModeText;
    self.progressHUD.labelText = words;
    self.progressHUD.margin = 10.f;
    self.progressHUD.color = [UIColor colorWithWhite:0 alpha:0.8];
    self.progressHUD.removeFromSuperViewOnHide = YES;
    [self.progressHUD show:YES];
    [self performSelector:@selector(hideHUD) withObject:nil afterDelay:1.5];
}

- (void)showHUDWithMessage:(NSString *)message
{
    [self _showHUDWithMessage:message];
}

- (void)hideHUD
{
//    if(!self.progressHUD.taskInProgress)
//    {
//        return;
//    }
    self.progressHUD.taskInProgress = NO;
    
    [self.progressHUD hide:YES];
    self.progressHUD = nil;
}

- (void)hideHUDWithCompletionMessage:(NSString *)message
{
    self.progressHUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"success"]];
    self.progressHUD.mode = MBProgressHUDModeCustomView;
    self.progressHUD.labelText = message;
//    self.progressHUD.color = [UIColor blackColor];
        self.progressHUD.color = [UIColor colorWithWhite:0 alpha:0.8];
    self.progressHUD.margin = 10.f;
    self.progressHUD.size = CGSizeMake(65, 65);
    [self.progressHUD show:YES];
    [self performSelector:@selector(hideHUD) withObject:nil afterDelay:1.5];
}
/*
 *  仅显示文字
 *  xiexu add 20150108 用于黑底白字 悬浮框
 *
 */
- (void)hideHUDWithOnlyMessage:(NSString *)message{
    
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [tipLabel setNumberOfLines:2];
    [tipLabel setTextColor:[UIColor whiteColor]];
    [tipLabel setFont:[UIFont systemFontOfSize:13]];
    [tipLabel setTextAlignment:NSTextAlignmentCenter];
    tipLabel.backgroundColor = [UIColor clearColor];
    
    [tipLabel setText:message];
    self.progressHUD.customView = tipLabel;
    self.progressHUD.mode = MBProgressHUDModeCustomView;
 
    self.progressHUD.margin = 5.f;
    self.progressHUD.color = [UIColor colorWithWhite:0 alpha:0.8];
    self.progressHUD.removeFromSuperViewOnHide = YES;
    self.progressHUD.size = CGSizeMake(200, 200);
    [self.progressHUD show:YES];
    [self performSelector:@selector(hideHUD) withObject:nil afterDelay:1.5];
}

- (void)hideHUDWithCompletionFailMessage:(NSString *)message
{
    self.progressHUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"error"]];
    self.progressHUD.mode = MBProgressHUDModeCustomView;
    self.progressHUD.labelText = message;
    self.progressHUD.color = [UIColor colorWithWhite:0 alpha:0.8];
 
    self.progressHUD.margin = 10.f;
    self.progressHUD.size = CGSizeMake(65, 65);
    [self.progressHUD show:YES];
    [self performSelector:@selector(hideHUD) withObject:nil afterDelay:1.5];
}
- (void)hideHUDWithFailMessage:(NSString *)message finishedHandler:(HUDFinishedHandler)finishedHandler
{
    self.progressHUD.delegate = self;
    self.finishedHandler = finishedHandler;
    [self hideHUDWithCompletionFailMessage:message];
}


- (void)hideHUDWithCompletionMessage:(NSString *)message finishedHandler:(HUDFinishedHandler)finishedHandler
{
    self.progressHUD.delegate = self;
    self.finishedHandler = finishedHandler;
    [self hideHUDWithCompletionMessage:message];
}

- (void)hudWasHidden:(MBProgressHUD *)hud
{
    if(self.finishedHandler)
    {
        self.finishedHandler();
        self.finishedHandler = nil;
    }
    self.progressHUD.delegate = nil;
}

- (void)showErrorHUDWithMessage:(NSString *)message {
  
////
    MBProgressHUD * HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"HUD_ERROR"]];
    // Set custom view mode
    HUD.mode = MBProgressHUDModeCustomView;
    
    [self.navigationController.view addSubview:HUD];
    HUD.labelFont = [UIFont systemFontOfSize:15];
    HUD.color = [UIColor colorWithWhite:0 alpha:0.8];
    HUD.minSize = CGSizeMake(SCREEN_WIDTH*0.65, 110);
    HUD.delegate = self;
    HUD.labelText = message;
    [HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];

    
}

- (void)myTask {
    // Do something usefull in here instead of sleeping ...
    sleep(1);
}

@end
