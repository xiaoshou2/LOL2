//
//  LOLPrintNumVC.m
//  LOL
//
//  Created by feibai on 16/1/17.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLPrintNumVC.h"

@implementation LOLPrintNumVC
-(void)viewDidLoad
{
    [super viewDidLoad];
    
      self.view.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
    
    self.title = self.titleStr;
    
    [self judgeType:self.titleStr];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClicked)];
    self.view.userInteractionEnabled = YES;
    [self.view addGestureRecognizer:tap];
}

-(void)judgeType:(NSString *)temp
{
    if ([temp isEqualToString:PRINT_PHHONE]) {
        [self setupPhoneView];
    }else if([temp isEqualToString:PRINT_QQ]){
        [self setupQQView];
    }else if([temp isEqualToString:PRINT_WEIXIN]){
        [self setupWeiXinView];
    }
    
}
-(void)setupPhoneView
{
    UIView *bottomView = [[UIView alloc] init];
    bottomView.frame = CGRectMake(0,75,SCREEN_WIDTH,40);
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    self.phoneTf = [[UITextField alloc] initWithFrame:CGRectMake(5,0,SCREEN_WIDTH-10, 40)];
    self.phoneTf.tag = 1001;
    self.phoneTf.enabled = YES;
    self.phoneTf.delegate = self;
    self.phoneTf.borderStyle = UITextBorderStyleNone;
    self.phoneTf.keyboardType = UIKeyboardTypeNumberPad;
    self.phoneTf.clearButtonMode = UITextFieldViewModeAlways;
    self.phoneTf.text = @"铵山东hasid";
    [self.phoneTf resignFirstResponder];
    [self.phoneTf addTarget:self action:@selector(limit_usemame_tf:) forControlEvents:UIControlEventEditingChanged];
    self.phoneTf.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:self.phoneTf];
    
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton.frame = CGRectMake(SCREEN_WIDTH-60,self.titleView.frame.size.height-44, 60, 44);
    [self.rightButton setTitle:@"确定" forState:UIControlStateNormal];
    [self.rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.rightButton.titleLabel.font=[UIFont systemFontOfSize:16];
    if (![self.phoneTf.text isEqualToString:@""]&&self.phoneTf.text.length>0) {
        self.rightButton.hidden = NO;
    }else{
        self.rightButton.hidden = YES;
    }
    [self.rightButton addTarget:self action:@selector(saveClick) forControlEvents:UIControlEventTouchUpInside];
    [self.titleView addSubview:self.rightButton];
    
}
-(void)setupQQView
{
    UIView *bottomView = [[UIView alloc] init];
    bottomView.frame = CGRectMake(0,75,SCREEN_WIDTH,40);
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    self.QQTf = [[UITextField alloc] initWithFrame:CGRectMake(5,0,SCREEN_WIDTH-10, 40)];
    self.QQTf.tag = 1002;
    self.QQTf.enabled = YES;
    self.QQTf.delegate = self;
    self.QQTf.borderStyle = UITextBorderStyleNone;
    self.QQTf.keyboardType = UIKeyboardTypeNumberPad;
    self.QQTf.clearButtonMode = UITextFieldViewModeAlways;
    self.QQTf.text = @"铵山东hasid";
    [self.QQTf resignFirstResponder];
    [self.QQTf addTarget:self action:@selector(limit_usemame_tf:) forControlEvents:UIControlEventEditingChanged];
    self.QQTf.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:self.QQTf];
    
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton.frame = CGRectMake(SCREEN_WIDTH-60,self.titleView.frame.size.height-44, 60, 44);
    [self.rightButton setTitle:@"确定" forState:UIControlStateNormal];
    [self.rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.rightButton.titleLabel.font=[UIFont systemFontOfSize:16];
    if (![self.QQTf.text isEqualToString:@""]&&self.QQTf.text.length>0) {
        self.rightButton.hidden = NO;
    }else{
        self.rightButton.hidden = YES;
    }
    [self.rightButton addTarget:self action:@selector(saveClick) forControlEvents:UIControlEventTouchUpInside];
    [self.titleView addSubview:self.rightButton];
    
}
-(void)setupWeiXinView
{
    UIView *bottomView = [[UIView alloc] init];
    bottomView.frame = CGRectMake(0,75,SCREEN_WIDTH,40);
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    self.weixinTf = [[UITextField alloc] initWithFrame:CGRectMake(5,0,SCREEN_WIDTH-10, 40)];
    self.weixinTf.tag = 1003;
    self.weixinTf.enabled = YES;
    self.weixinTf.delegate = self;
    self.weixinTf.borderStyle = UITextBorderStyleNone;
    self.weixinTf.keyboardType = UIKeyboardTypeDefault;
    self.weixinTf.clearButtonMode = UITextFieldViewModeAlways;
    self.weixinTf.text = @"铵山东hasid";
    [self.weixinTf resignFirstResponder];
    [self.weixinTf addTarget:self action:@selector(limit_usemame_tf:) forControlEvents:UIControlEventEditingChanged];
    self.weixinTf.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:self.weixinTf];
    
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton.frame = CGRectMake(SCREEN_WIDTH-60,self.titleView.frame.size.height-44, 60, 44);
    [self.rightButton setTitle:@"确定" forState:UIControlStateNormal];
    [self.rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.rightButton.titleLabel.font=[UIFont systemFontOfSize:16];
    if (![self.weixinTf.text isEqualToString:@""]&&self.weixinTf.text.length>0) {
        self.rightButton.hidden = NO;
    }else{
        self.rightButton.hidden = YES;
    }
    [self.rightButton addTarget:self action:@selector(saveClick) forControlEvents:UIControlEventTouchUpInside];
    [self.titleView addSubview:self.rightButton];
    
}
-(void)limit_usemame_tf:(UITextField *)sender
{
    if ([sender.text isEqualToString:@"\n"]) {
        [sender resignFirstResponder];
    }
        NSLog(@"走了");
        bool isChinese;//判断当前输入法是否是中文
        
        UITextInputMode *currentInputMode = sender.textInputMode;
        if ([[currentInputMode primaryLanguage] isEqualToString: @"en-US"])
        {
            isChinese = false;
            
            //18217711057
        }
        else
        {
            isChinese = true;
            
        }
    
    if(sender.tag == 1001||sender.tag == 1002){
            
            if (![sender.text isEqualToString:@""]&&sender.text.length>0) {
                self.rightButton.hidden = NO;
            }else{
                self.rightButton.hidden = YES;
            }
            // 8位
            NSString *str = [[sender text] stringByReplacingOccurrencesOfString:@"?" withString:@""];
            if (isChinese) { //中文输入法下
                UITextRange *selectedRange = [sender markedTextRange];
                //获取高亮部分
                UITextPosition *position = [sender positionFromPosition:selectedRange.start offset:0];
                // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
                if (!position) {
                    
                    if ( str.length>=14) {
                        NSString *strNew = [NSString stringWithString:str];
                        [sender setText:[strNew substringToIndex:13]];
                        
                    }
                }
            }else{
                if ([str length]>=14){
                    NSString *strNew = [NSString stringWithString:str];
                    [sender setText:[strNew substringToIndex:13]];
                    
                    
                }
            }
        }else if(sender.tag == 1003){
            
                if (![sender.text isEqualToString:@""]&&sender.text.length>0) {
                    self.rightButton.hidden = NO;
                }else{
                    self.rightButton.hidden = YES;
                }
                // 8位
                NSString *str =  [[sender text] stringByReplacingOccurrencesOfString:@"?" withString:@""];
                if (isChinese) { //中文输入法下
                    UITextRange *selectedRange = [sender markedTextRange];
                    //获取高亮部分
                    UITextPosition *position = [sender positionFromPosition:selectedRange.start offset:0];
                    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
                    if (!position) {
                        
                        if ( str.length>=19) {
                            NSString *strNew = [NSString stringWithString:str];
                            [sender setText:[strNew substringToIndex:18]];
                            
                        }
                    }
                }else{
                    if ([str length]>=19){
                        NSString *strNew = [NSString stringWithString:str];
                        [sender setText:[strNew substringToIndex:18]];
                        
                    }
                }
            }
    
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.phoneTf) {
        [self.phoneTf becomeFirstResponder];
    }
    if (self.QQTf) {
        [self.QQTf becomeFirstResponder];
    }
    if (self.weixinTf) {
        [self.weixinTf becomeFirstResponder];
    }
}

-(void)viewClicked
{
    if (self.phoneTf) {
        [self.phoneTf resignFirstResponder];
        
    }else if(self.QQTf){
        [self.QQTf resignFirstResponder];
        
    }else if(self.weixinTf)
    {
        [self.weixinTf resignFirstResponder];
    }
}

-(void)saveClick{
    if([self.titleStr isEqualToString:PRINT_PHHONE]){
        if([self isValidateMobile:self.phoneTf.text]){
            //发送通知
            [[NSNotificationCenter defaultCenter]postNotificationName:RECEIVEDSTR object:self userInfo:@{@"type":PRINT_PHHONE,@"content":self.phoneTf.text}];
            [self.navigationController popViewControllerAnimated:YES];
            
        }else{
            UIAlertView * alterView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确的手机号" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alterView show];
        }
    }else if ([self.titleStr isEqualToString:PRINT_QQ]){
        if (self.QQTf.text.length<5) {
            
                UIAlertView * alterView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确的QQ号" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alterView show];
        }else{
             [[NSNotificationCenter defaultCenter]postNotificationName:RECEIVEDSTR object:self userInfo:@{@"type":PRINT_QQ,@"content":self.QQTf.text}];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }else if([self.titleStr isEqualToString:PRINT_WEIXIN]){
        if (self.weixinTf.text.length<4) {
            UIAlertView * alterView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确的微信号" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alterView show];
        }else{
             [[NSNotificationCenter defaultCenter]postNotificationName:RECEIVEDSTR object:self userInfo:@{@"type":PRINT_WEIXIN,@"content":self.weixinTf.text}];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

/*手机号码验证 MODIFIED BY HELENSONG*/
-(BOOL)isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobile];
}


@end
