//
//  LoginVCNew.m
//  易林Video
//
//  Created by beijingduanluo on 15/12/19.
//  Copyright © 2015年 beijingduanluo. All rights reserved.
//

#import "LoginVCNew.h"
#import "LOLForgetPasswordFirVC.h"
#import "LOLRegisterFirVC.h"
@interface LoginVCNew ()
@property(nonatomic,strong)UIImageView *backImgV;
@property(nonatomic,strong)UIImageView *backView;
@property(nonatomic,strong)UITextField *phoneTextField;
@property(nonatomic,strong)UIImageView *phoneImgV;
@property(nonatomic,strong)UITextField *passwordText;
@property(nonatomic,strong)UIImageView *passwordImgV;
@property(nonatomic,strong)UIButton *loginBtn;
@property(nonatomic,strong)UIButton *forgetPassWordBtn;
@property(nonatomic,strong)UIButton *registBtn;
@property(nonatomic,strong)UIImageView *headImgV;
@property(nonatomic,strong)UIButton *returnTopBtn;

@end

@implementation LoginVCNew

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"登录";
    self.backButton.hidden = NO;
    
    _backImgV =[UIImageView addImgWithFrame:CGRectMake(0,64,ScreenWidth, ScreenHeight) AndImage:@"ditu"];
    [self.view addSubview:_backImgV];
    _backImgV.userInteractionEnabled = YES;
    
    
    _backView =[UIImageView addImgWithFrame:CGRectMake(0,64, ScreenWidth, ScreenHeight) AndImage:@"zuizhongbanquan"];
    [self.view addSubview:_backView];
    _backView.userInteractionEnabled = YES;
    
    _headImgV =[UIImageView addImgWithFrame:CGRectMake(125*Width, 60*Height, 70*Width, 70*Height) AndImage:@"touxiang"];
    [_backView addSubview:_headImgV];
    
    _phoneTextField =[self addtextFieldWithHeight:170 AndImgStr:nil AndStr:@"请输入手机号码"];
    _phoneTextField.keyboardType =UIKeyboardTypeNumberPad;
    [_backView addSubview:_phoneTextField];
    
    _passwordText =[self addtextFieldWithHeight:220 AndImgStr:nil AndStr:@"请输入密码"];
    _passwordText.secureTextEntry = YES;
    [_backView addSubview:_passwordText];
    
    _loginBtn =[UIButton addBtnImage:@"loginBtn" AndFrame:CGRectMake(30*Width, 270*Height, 260*Width, 36*Height) WithTarget:self action:@selector(loginAccountButton)];
    [_backView addSubview:_loginBtn];
    
    _forgetPassWordBtn =[UIButton addBtnImage:nil AndFrame:CGRectMake(215*Width, 315*Height, 90*Width, 20*Height) WithTarget:self action:@selector(forgetPasswordClick)];
    [_forgetPassWordBtn setTitle:@"忘记密码 ?" forState:UIControlStateNormal];
    _forgetPassWordBtn.titleLabel.font =[UIFont systemFontOfSize:12*Width weight:0.5];
    [_backView addSubview:_forgetPassWordBtn];
    
    _registBtn =[UIButton addBtnImage:@"register_loginBtn" AndFrame:CGRectMake(110*Width, 355*Height, 100*Width, 15*Height) WithTarget:self action:@selector(registAccountInterface)];
    [_backView addSubview:_registBtn];
    
}
-(void)returnLoginBtnsss
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)forgetPasswordClick{
    
    LOLForgetPasswordFirVC *forget=[[LOLForgetPasswordFirVC alloc]init];
    forget.loadType = YWBasePresentType;
    [self presentViewController:forget animated:YES completion:nil];
}
//注册页面跳转
-(void)registAccountInterface
{
   LOLRegisterFirVC *regist = [[LOLRegisterFirVC alloc] init];
    regist.loadType = YWBasePresentType;
   // RegisterVCNew *regist=[[RegisterVCNew alloc]init];
    [self presentViewController:regist animated:YES completion:nil];
    
}
//登录方法
-(void)loginAccountButton
{
    NSString *userName =[FormValidator checkMobile:_phoneTextField.text];
    NSString *passWord=[FormValidator checkPassword:_passwordText.text];
    if ([_phoneTextField.text isEqualToString:@""]||_phoneTextField.text == nil||[_passwordText.text isEqualToString:@""]||_passwordText.text == nil) {
        UIAlertView * alterView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"用户名或密码不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alterView show];
        return;
    }else{
        if (userName) {
            UIAlertView * alterView=[[UIAlertView alloc]initWithTitle:@"提示" message:userName delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alterView show];
            return;
        }
        if (passWord) {
            UIAlertView * alterView=[[UIAlertView alloc]initWithTitle:@"提示" message:passWord delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alterView show];
            return;
        }
    }
    [self loginAccountInter];
    
    
}


//登陆接口
-(void)loginAccountInter
{
    [self.view endEditing:YES];
    
    //登录接口调用
    //请求数据
    [self showHUD];
    [LOLAFNetWorkUtility loginRequestWithParms:@{} successBlock:^(id responseObject) {
        
     
            [self hideHUD];
          
            [SharedDelegate setupViewControllers];
            
        } failedBlock:^(NSError *error) {
            //        [self.commmentView.header endRefreshing  ];
            [self hideHUD];
            NSLog(@"---  LOL请求失败 ----");
            [self showErrorHUDWithMessage:@"当前网络没有链接"];
            
        } ];

//    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
//    NSDictionary *dic =[NSDictionary dictionaryWithObjectsAndKeys:_phoneTextField.text,@"number",_passwordText.text,@"password",nil];
//    [manager POST:loginAccount parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        if ([[dic  objectForKey:@"id"] isEqualToString:@"false"]) {
//            [FormValidator showAlertWithStr:@"用户名或者密码错误"];
//        }else{
//            //用户名密码输入正确后，登录后需要跳转的页面
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [FormValidator showAlertWithStr:failTipe];
//    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_phoneTextField endEditing:YES];
    [_passwordText endEditing:YES];
    
}

-(UITextField *)addtextFieldWithHeight:(CGFloat)heigh AndImgStr:(NSString *)imgStr AndStr:(NSString *)str
{
    UIImageView *imgBack =[UIImageView addImgWithFrame:CGRectMake(30*Width, heigh*Height, 260*Width, 36*Height) AndImage:@"login_Register_Bord"];
    [_backView addSubview:imgBack];
    
    UITextField *textF =[UITextField addTextFieldWithFrame:CGRectMake(30*Width, (heigh+0.5)*Height, 260*Width, 35*Height) AndStr:str AndFont:14 AndTextColor:whitesColor];
    [_backView addSubview:textF];
    
    
    return textF;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self.view endEditing:YES];
    [super viewWillDisappear:animated];
    
}
@end
