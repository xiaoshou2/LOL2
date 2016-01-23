//
//  LOLRegisterFirVC.m
//  LOL
//
//  Created by feibai on 16/1/20.
//  Copyright © 2016年 feibai. All rights reserved.
//
/*
 ============获取验证码的方法
 **
 *  @from                    v1.1.1
 *  @brief                   获取验证码(Get verification code)
 *
 *  @param method            获取验证码的方法(The method of getting verificationCode)
 *  @param phoneNumber       电话号码(The phone number)
 *  @param zone              区域号，不要加"+"号(Area code)
 *  @param customIdentifier  自定义短信模板标识 该标识需从官网http://www.mob.com上申请，审核通过后获得。(Custom model of SMS.  The identifier can get it  from http://www.mob.com  when the application had approved)
 *  @param result            请求结果回调(Results of the request)
 
 
 [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:@"159****1689"
 zone:@"86"
 customIdentifier:nil
 result:^(NSError *error)
 if (!error) {
 NSLog(@"获取验证码成功");
 } else {
 NSLog(@"错误信息：%@",error);
 }];
 
 
 =========   提交验证码的方法
 **
 * @from               v1.1.1
 * @brief              提交验证码(Commit the verification code)
 *
 * @param code         验证码(Verification code)
 * @param phoneNumber  电话号码(The phone number)
 * @param zone         区域号，不要加"+"号(Area code)
 * @param result       请求结果回调(Results of the request)
 
 [SMSSDK commitVerificationCode:self.verifyCodeField.text phoneNumber:_phone zone:_areaCode result:^(NSError *error) {
 
 if (!error) {
 
 NSLog(@"验证成功");
 
 }
 else
 {
 NSLog(@"错误信息：%@",error);
 
 }
 }];
 
 */


#import "LOLRegisterFirVC.h"
#import "LOLRegisterSecVC.h"
#import <SMS_SDK/SMSSDK.h>
@implementation LOLRegisterFirVC
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"注册1/3";
    timeComnt = 0;
    [self setupMainView];
    
    ////创建通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeTimeCount:) name:TIMECOUNT object:nil];
}

-(void)changeTimeCount:(NSNotification*)obj
{
    timeComnt = (int)[[obj.userInfo objectForKey:@"count"] integerValue];
    NSLog(@"-时间-  %d  ---",timeComnt);
}

-(void)setupMainView
{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,64, ScreenWidth, ScreenHeight - (64)) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
    [self.view addSubview:self.tableView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClicked)];
    self.view.userInteractionEnabled = YES;
    [self.view addGestureRecognizer:tap];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 45)];
        [cell addSubview:bottomView];
        bottomView.backgroundColor = [UIColor whiteColor];
        
        self.phoneLb = [[UILabel alloc] init];
        self.phoneLb.frame = CGRectMake(20,bottomView.height/2-10,60, 20);
        self.phoneLb.text = @"手机号码";
        self.phoneLb.backgroundColor = [UIColor clearColor];
        self.phoneLb.font = SYSTEMFONT(13);
        [bottomView addSubview:self.phoneLb];
        
  
        self.phoneTf = [[UITextField alloc] init];
        self.phoneTf.frame = CGRectMake(30+_phoneLb.width,0,180,bottomView.height);
         self.phoneTf.font = SYSTEMFONT(13);
        self.phoneTf.backgroundColor = [UIColor clearColor];
        self.phoneTf.keyboardType = UIKeyboardTypeNumberPad;
        self.phoneTf.clearButtonMode = UITextFieldViewModeAlways;
        [self.phoneTf addTarget:self action:@selector(limit_usemame_tf:) forControlEvents:UIControlEventEditingChanged];
        self.phoneTf.tag = 1001;
        self.phoneTf.placeholder = @"11位数字";

        //----键盘上添加按钮
        UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
        [topView setBarStyle:UIBarStyleBlackTranslucent];
        
        UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(2, 5, 50, 25);
        [btn addTarget:self action:@selector(dismissKeyBoard) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:[UIImage imageNamed:@"yw_load1"] forState:UIControlStateNormal];
        UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
        NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace,doneBtn,nil];
        [topView setItems:buttonsArray];
        [self.phoneTf setInputAccessoryView:topView];
        
        [bottomView addSubview:self.phoneTf];
        
        
        UIButton *registerBtn = [UIButton buttonWithFrame:CGRectMake(15, 90, SCREEN_WIDTH-30,40) title:@"下一步，验证手机号" backgroundImage:IMAGENAMED(@"myctrip_btn_login")];
        [registerBtn addTarget:self action:@selector(pushRegisterVC) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:registerBtn];
        
        
        
    }
    
    return cell;
}

-(void)pushRegisterVC
{
    
    
    if (self.phoneTf.text.length==0) {
       
        UIAlertView * alterView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入手机号" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alterView show];
    }else if([self isValidateMobile:self.phoneTf.text]==NO){
        
        UIAlertView * alterView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确手机号" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alterView show];
    }else{
     
        if (timeComnt<=1) {
            [self showHUD];
            //      /请求后台判断当前手机号是否已经注册过
            //请求数据
            [LOLAFNetWorkUtility  phoneNumRequestWithParms:@{} successBlock:^(id responseObject) {
                
                //NSLog(@"--- LOL首页请求成功 --%@--",responseObject);
                if([responseObject[0]isEqualToString:@"0"]){
                    
#pragma MARK -- ShareSDK 发送验证码
                    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneTf.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
                        
                        if (!error) {
                            [self hideHUD];
                            NSLog(@"获取验证码成功");
                            //
                            LOLRegisterSecVC *regist = [[LOLRegisterSecVC alloc] init];
                            regist.loadType = YWBasePresentType;
                            regist.phoneNum = self.phoneTf.text;
                            [self presentViewController:regist animated:YES completion:nil];
                            
                        }
                        else
                        {
                            [self hideHUD];
                            NSLog(@"错误信息：%@",error);
                            
                        }
                    }];
                    
                }else{
                    [self hideHUD];
                    //已经注册过弹出提示
                    UIAlertView * alterView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"该手机号已经注册过" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
                    [alterView show];
                    
                }
                
            } failedBlock:^(NSError *error) {
                //        [self.commmentView.header endRefreshing  ];
                [self hideHUD];
                NSLog(@"---  LOL请求失败 ----");
                [self showErrorHUDWithMessage:@"当前网络没有链接"];
                
            } ];

            
        }else{
            
            UIAlertView * alterView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"每隔60S才能获取一次验证码！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alterView show];

            
        }
    
     }

}

-(void)limit_usemame_tf:(UITextField *)sender
{
    if ([sender.text isEqualToString:@"\n"]) {
        [sender resignFirstResponder];
    }
    bool isChinese;//判断当前输入法是否是中文
    
    UITextInputMode *currentInputMode = sender.textInputMode;
    if ([[currentInputMode primaryLanguage] isEqualToString: @"en-US"])
    {
        isChinese = false;
        
    }
    else
    {
        isChinese = true;
        
    }
    
    if(sender.tag == 1001){
        
       
        // 8位
        NSString *str = [[sender text] stringByReplacingOccurrencesOfString:@"?" withString:@""];
        if (isChinese) { //中文输入法下
            UITextRange *selectedRange = [sender markedTextRange];
            //获取高亮部分
            UITextPosition *position = [sender positionFromPosition:selectedRange.start offset:0];
            // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            if (!position) {
                
                if ( str.length>=12) {
                    NSString *strNew = [NSString stringWithString:str];
                    [sender setText:[strNew substringToIndex:11]];
                    
                }
            }
        }else{
            if ([str length]>=12){
                NSString *strNew = [NSString stringWithString:str];
                [sender setText:[strNew substringToIndex:11]];
                
                
            }
        }
    }
}

-(void)dismissKeyBoard
{
    if (self.phoneTf) {
        [self.phoneTf resignFirstResponder];
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

//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    if (self.phoneTf) {
//        [self.phoneTf becomeFirstResponder];
//    }
//}

-(void)viewClicked
{
    if (self.phoneTf) {
        [self.phoneTf resignFirstResponder];   
    }
}

-(void)dealloc
{
    //移除
    [[NSNotificationCenter defaultCenter]removeObserver:self name:TIMECOUNT object:nil];
}
@end
