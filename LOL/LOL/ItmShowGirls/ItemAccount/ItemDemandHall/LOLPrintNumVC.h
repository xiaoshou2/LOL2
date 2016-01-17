//
//  LOLPrintNumVC.h
//  LOL
//
//  Created by feibai on 16/1/17.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLBaseViewController.h"

@interface LOLPrintNumVC : LOLBaseViewController<UITextFieldDelegate>
@property (nonatomic,strong)NSString *titleStr;
@property (nonatomic,strong)UITextField *phoneTf;
@property (nonatomic,strong)UITextField *QQTf;
@property (nonatomic,strong)UITextField *weixinTf;
@property (nonatomic,strong)UIButton *rightButton;
@end
