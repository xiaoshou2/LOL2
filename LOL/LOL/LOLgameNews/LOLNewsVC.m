//
//  LOLNewsVC.m
//  LOL
//
//  Created by feibai on 16/1/23.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLNewsVC.h"

@implementation LOLNewsVC
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"赛事资讯";
   // NSString *str =  @"http://qt.qq.com/static/pages/news/phone/60/article_14160.shtml?APP_BROWSER_VERSION_CODE=1&ios_version=801&imgmode=auto";
   NSString *str =@"http://qt.qq.com/static/pages/news/phone/29/article_14129.shtml?APP_BROWSER_VERSION_CODE=1&ios_version=801&imgmode=auto";
    
    UIWebView * view = [[UIWebView alloc]initWithFrame:CGRectMake(0,64, ScreenWidth, ScreenHeight - 49)];
    [view loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
  //http://qt.qq.com/static/pages/news/phone/29/article_14129.shtml?APP_BROWSER_VERSION_CODE=1&ios_version=801&imgmode=auto
    //@"http://qt.qq.com/static/pages/news/phone/22/article_14322.shtml?APP_BROWSER_VERSION_CODE=1&ios_version=801&imgmode=auto
   

    [self.view addSubview:view];
    
}
@end
