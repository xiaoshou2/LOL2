//
//  LOLChangeMesVC.m
//  LOL
//
//  Created by feibai on 16/1/16.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLChangeMesVC.h"
#define CHANGE_NAME @"修改昵称"
#define CHANGE_SIGN @"修改签名"
#define CHange_PHONE @"修改电话"
#define CHANGE_PASSWORD @"修改密码"
#define TEXT_MAXLENGTH 25
@implementation LOLChangeMesVC
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.VCtype;
    self.view.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
    
    [self judgeType:self.VCtype];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClicked)];
    self.view.userInteractionEnabled = YES;
    [self.view addGestureRecognizer:tap];
}
-(void)judgeType:(NSString *)temp
{
    if ([temp isEqualToString:CHANGE_NAME]) {
        [self setupChangeNameView];
    }else if([temp isEqualToString:CHANGE_SIGN]){
        [self setupChangeSignView];
    }else if([temp isEqualToString:CHange_PHONE]){
        [self setupChangephoneView];
    }else if([temp isEqualToString:CHANGE_PASSWORD]){
        [self setupChangePassWordView];
    }
    
}
-(void)setupChangeNameView{
    UIView *bottomView = [[UIView alloc] init];
    bottomView.frame = CGRectMake(0,75,SCREEN_WIDTH,40);
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
     self.nameTextfield = [[UITextField alloc] initWithFrame:CGRectMake(5,0,SCREEN_WIDTH-10, 40)];
    self.nameTextfield.tag = 1001;
    self.nameTextfield.enabled = YES;
    self.nameTextfield.delegate = self;
    self.nameTextfield.borderStyle = UITextBorderStyleNone;
    self.nameTextfield.clearButtonMode = UITextFieldViewModeAlways;
    self.nameTextfield.text = @"铵山东hasid";
    [self.nameTextfield resignFirstResponder];
    [self.nameTextfield addTarget:self action:@selector(limit_usemame_tf:) forControlEvents:UIControlEventEditingChanged];
     self.nameTextfield.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:self.nameTextfield];
    
    UILabel *describeLb = [[UILabel alloc] init];
    describeLb.frame = CGRectMake(5,115,SCREEN_WIDTH,25);
    describeLb.backgroundColor = [UIColor clearColor];
    describeLb.textColor = [UIColor colorWithHex:@"#999999"];
    describeLb.font = SYSTEMFONT(11);
    describeLb.text = @"4-12个字符,可由中英文字母,数字,-,_,组成";
    [self.view addSubview:describeLb];
    
  
    self.rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton.frame = CGRectMake(SCREEN_WIDTH-60,self.titleView.frame.size.height-44, 60, 44);
    [self.rightButton setTitle:@"保存" forState:UIControlStateNormal];
    [self.rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.rightButton.titleLabel.font=[UIFont systemFontOfSize:16];
    if (![self.nameTextfield.text isEqualToString:@""]&&self.nameTextfield.text.length>0) {
        self.rightButton.hidden = NO;
    }else{
        self.rightButton.hidden = YES;
    }
    
    [self.rightButton addTarget:self action:@selector(saveClick) forControlEvents:UIControlEventTouchUpInside];
    [self.titleView addSubview:self.rightButton];
}

-(void)viewClicked
{
    if (self.nameTextfield) {
        [self.nameTextfield resignFirstResponder];

    }else if(self.textView){
        [self.textView resignFirstResponder];

    }
}

-(void)saveClick
{
    NSLog(@"保存");
}


-(void)setupChangeSignView{
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(5,75, self.view.frame.size.width-10, 100)];
    [self.view addSubview:self.textView];
    self.textView.delegate = self;
    
    //修复文本框是偏移（下移）
    self.automaticallyAdjustsScrollViewInsets = NO;
    //设置文字对齐方式属性
    self.textView.textAlignment = NSTextAlignmentLeft;
    //设置文字字体属性
    self.textView.font = [UIFont systemFontOfSize:13.0f];
    //设置编辑使能属性,是否允许编辑（=NO时，只用来显示，依然可以使用选择和拷贝功能）
    self.textView.editable = YES;
    //设置背景颜色属性
    self.textView.backgroundColor = [UIColor whiteColor];

    //模仿UTextField的placeholder属性
    _placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, CGRectGetWidth(self.textView.frame), 20)];
    _placeholderLabel.backgroundColor = [UIColor clearColor];
    _placeholderLabel.textColor = [UIColor grayColor];
    _placeholderLabel.text = @"请输入内容";
    _placeholderLabel.font = self.textView.font;
    [self.textView addSubview:_placeholderLabel];
    
    numLb = [[UILabel alloc] init];
    numLb.frame = CGRectMake(self.textView.width-40,self.textView.height-20,50,15);
    numLb.backgroundColor = [UIColor clearColor];
    numLb.textColor = [UIColor colorWithHex:@"#999999"];
    numLb.font = SYSTEMFONT(12);
    numLb.text = [NSString stringWithFormat:@"%ld/%d",(long)res,TEXT_MAXLENGTH];
    [self.textView addSubview:numLb];
    
    self.rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton.frame = CGRectMake(SCREEN_WIDTH-60,self.titleView.frame.size.height-44, 60, 44);
    [self.rightButton setTitle:@"保存" forState:UIControlStateNormal];
    [self.rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.rightButton.titleLabel.font=[UIFont systemFontOfSize:16];
    if (self.textView.text.length>0) {
        self.rightButton.hidden = NO;
    }else{
        self.rightButton.hidden = YES;
    }
    
    [self.rightButton addTarget:self action:@selector(saveClick) forControlEvents:UIControlEventTouchUpInside];
    [self.titleView addSubview:self.rightButton];
    
}

- (BOOL)textView:(UITextView *)atextView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [self.textView resignFirstResponder];
        return NO;
    }
    NSString *new = [self.textView.text stringByReplacingCharactersInRange:range withString:text];
    if ([new isEqualToString:@""]) {
        self.rightButton.hidden = YES;
    }else
    {
        self.rightButton.hidden = NO;
    }
    NSLog(@"当前 --- %@ ---",new);
    
     res = TEXT_MAXLENGTH-[new length];
    
    if (![text isEqualToString:@""]){
        
        _placeholderLabel.hidden = YES;
        
    }
    
    if ([text isEqualToString:@""] && range.location == 0 && range.length == 1){
        
        _placeholderLabel.hidden = NO;
        
    }
    if(res >= 0){
          numLb.text = [NSString stringWithFormat:@"%ld/%d",[new length],TEXT_MAXLENGTH];
        return YES;
    }
    else{
        NSRange rg = {0,[text length]+res};
        if (rg.length>0) {
            NSString *s = [text substringWithRange:rg];
            [self.textView setText:[self.textView.text stringByReplacingCharactersInRange:range withString:s]];
        }
        return NO;
    }
}

-(void)setupChangephoneView{
    
}
-(void)setupChangePassWordView{
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.nameTextfield) {
        [self.nameTextfield becomeFirstResponder];

    }else if(self.textView){
        [self.textView becomeFirstResponder];

    }
    
}


-(void)limit_usemame_tf:(UITextField *)sender
{
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
    
    
    if(sender.tag == 1001)
    {
       
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


@end
