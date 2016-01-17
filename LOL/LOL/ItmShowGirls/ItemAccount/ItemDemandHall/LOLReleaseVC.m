//
//  LOLReleaseVC.m
//  LOL
//
//  Created by feibai on 16/1/16.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLReleaseVC.h"
#define TEXT_MAXLENGTH 120
@implementation LOLReleaseVC
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"发布信息";
    [self setupMainView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClicked)];
    self.view.userInteractionEnabled = YES;
    [self.view addGestureRecognizer:tap];
    
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
    
    
    UIButton *releaseBtn = [[UIButton alloc]init];
    releaseBtn.frame = CGRectMake(SCREEN_WIDTH/2-60,SCREEN_HEIGHT- 105 ,120, 35);
    releaseBtn.backgroundColor = [UIColor redColor];
    [self.tableView addSubview:releaseBtn];
    [releaseBtn addTarget:self action:@selector(releaseClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:releaseBtn];
}

-(void)releaseClicked{
    NSLog(@"点击发布");
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
    }
    if (indexPath.row == 0) {
       
        UIView *spaceView = [[UIView alloc] initWithFrame:CGRectMake(0,0, ScreenWidth, 10)];
        spaceView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
        [cell addSubview:spaceView];
        
    
    }else if(indexPath.row == 1){//头像
        UILabel *titleLb = [[UILabel alloc] init];
        titleLb.frame = CGRectMake(12,8,45,25);
        titleLb.text = @"标 题";
        titleLb.font = SYSTEMFONT(13);
        titleLb.backgroundColor = [UIColor clearColor];
        // self.mendTimeLb.backgroundColor = [UIColor grayColor];
        [cell addSubview:titleLb];
        cell.backgroundColor = [UIColor whiteColor];
        
        UIImageView *accrmage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"main_customerservice_ico_arrowgrey"]];
         accrmage.frame = CGRectMake(SCREEN_WIDTH -18,16,8,8);
        [cell addSubview:accrmage];
        
        UILabel *titleContentLb = [[UILabel alloc] init];
        titleContentLb.frame = CGRectMake(SCREEN_WIDTH/2-55,8,140,25);
        titleContentLb.text = @"请选择标题内容...";
        titleContentLb.textColor = [UIColor colorWithHex:@"#999999"];
        titleContentLb.font = SYSTEMFONT(13);
        titleContentLb.backgroundColor = [UIColor clearColor];
        // self.mendTimeLb.backgroundColor = [UIColor grayColor];
        [cell addSubview:titleContentLb];
        
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
        lineView.frame = CGRectMake(10,39,ScreenWidth-20, 1);
        [cell addSubview: lineView];
        
        
        }else if(indexPath.row == 2){ //请详细补充你要发布的信息
            self.textView = [[UITextView alloc]initWithFrame:CGRectMake(10,5, self.view.frame.size.width-20, 130)];
            [cell addSubview:self.textView];
            self.textView.delegate = self;
            self.automaticallyAdjustsScrollViewInsets = NO;
            //设置文字对齐方式属性
            self.textView.textAlignment = NSTextAlignmentLeft;
            //设置文字字体属性
            self.textView.font = [UIFont systemFontOfSize:13.0f];
            //设置编辑使能属性,是否允许编辑（=NO时，只用来显示，依然可以使用选择和拷贝功能）
            self.textView.editable = YES;
            //设置背景颜色属性
            self.textView.backgroundColor = [UIColor clearColor];
            
            //模仿UTextField的placeholder属性
            _placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, CGRectGetWidth(self.textView.frame), 20)];
            _placeholderLabel.backgroundColor = [UIColor clearColor];
            _placeholderLabel.textColor = [UIColor grayColor];
            _placeholderLabel.text = @"请详细补充您要发布的信息";
            _placeholderLabel.font = SYSTEMFONT(12);
            [self.textView addSubview:_placeholderLabel];
           
            numLb = [[UILabel alloc] init];
            numLb.frame = CGRectMake(self.textView.width-40,self.textView.height-20,50,15);
            numLb.backgroundColor = [UIColor clearColor];
            numLb.textColor = [UIColor colorWithHex:@"#999999"];
            numLb.font = SYSTEMFONT(12);
            numLb.text = [NSString stringWithFormat:@"%ld/%d",(long)res,TEXT_MAXLENGTH];
            [self.textView addSubview:numLb];
            
        }else if(indexPath.row == 3){
            
            UIView *spaceView = [[UIView alloc] initWithFrame:CGRectMake(0,0, ScreenWidth, 40)];
            spaceView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
            [cell addSubview:spaceView];
            
            UILabel *lianxiLb = [[UILabel alloc] init];
            lianxiLb.frame = CGRectMake(10,10,70,15);
            lianxiLb.backgroundColor = [UIColor clearColor];
            lianxiLb.textColor = [UIColor colorWithHex:@"#999999"];
            lianxiLb.font = SYSTEMFONT(12);
            lianxiLb.text = @"快来联系我";
            [cell addSubview:lianxiLb];
           
        }else if(indexPath.row == 4){
            
            UILabel *payLab = [[UILabel alloc] init];
            payLab.frame = CGRectMake(10,10,90,15);
            payLab.backgroundColor = [UIColor clearColor];
//            payLab.textColor = [UIColor colorWithHex:@"#999999"];
            payLab.font = SYSTEMFONT(12);
            payLab.text = @"想支付报酬多少";
            [cell addSubview:payLab];
            
            self.payMoneTf = [[UITextField alloc] initWithFrame:CGRectMake(100,8,45, 20)];
            self.payMoneTf.tag = 1001;
            self.payMoneTf.enabled = YES;
            self.payMoneTf.font = SYSTEMFONT(12);
            //self.payMoneTf.delegate = self;
            self.payMoneTf.borderStyle = UITextBorderStyleNone;
            self.payMoneTf.keyboardType = UIKeyboardTypeDecimalPad;
            [self.payMoneTf resignFirstResponder];
           [self.payMoneTf addTarget:self action:@selector(limit_usemame_tf:) forControlEvents:UIControlEventEditingChanged];
           self.payMoneTf.backgroundColor = [UIColor whiteColor];
            [cell addSubview:self.payMoneTf];
            
            UILabel *yuanLb = [[UILabel alloc] init];
            yuanLb.frame = CGRectMake(150,10,20,15);
            yuanLb.backgroundColor = [UIColor clearColor];
            //            payLab.textColor = [UIColor colorWithHex:@"#999999"];
            yuanLb.font = SYSTEMFONT(12);
            yuanLb.text = @"元";
            [cell addSubview:yuanLb];
            
            UIView *lineView = [[UIView alloc] init];
            lineView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
            lineView.frame = CGRectMake(10,39,ScreenWidth-20, 1);
            [cell addSubview: lineView];
            
        }else if(indexPath.row == 5){
           
            UILabel *payLab = [[UILabel alloc] init];
            payLab.frame = CGRectMake(10,10,90,15);
            payLab.backgroundColor = [UIColor clearColor];
            //            payLab.textColor = [UIColor colorWithHex:@"#999999"];
            payLab.font = SYSTEMFONT(12);
            payLab.text = @"想获取报酬多少";
            [cell addSubview:payLab];
            
            UILabel *yuanLb = [[UILabel alloc] init];
            yuanLb.frame = CGRectMake(150,10,20,15);
            yuanLb.backgroundColor = [UIColor clearColor];
            
            self.getMoneyTf = [[UITextField alloc] initWithFrame:CGRectMake(100,8,45, 20)];
            self.getMoneyTf.tag = 1001;
            self.getMoneyTf.enabled = YES;
            self.getMoneyTf.font = SYSTEMFONT(12);
            //self.payMoneTf.delegate = self;
            self.getMoneyTf.borderStyle = UITextBorderStyleNone;
            self.getMoneyTf.keyboardType = UIKeyboardTypeDecimalPad;
            [self.getMoneyTf resignFirstResponder];
            [self.getMoneyTf addTarget:self action:@selector(limit_usemame_tf:) forControlEvents:UIControlEventEditingChanged];
            self.getMoneyTf.backgroundColor = [UIColor whiteColor];
            [cell addSubview:self.getMoneyTf];
            
            //            payLab.textColor = [UIColor colorWithHex:@"#999999"];
            yuanLb.font = SYSTEMFONT(12);
            yuanLb.text = @"元";
            [cell addSubview:yuanLb];
            
            UIView *lineView = [[UIView alloc] init];
            lineView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
            lineView.frame = CGRectMake(10,39,ScreenWidth-20, 1);
            [cell addSubview: lineView];
            
        }else if(indexPath.row == 6){
            UILabel *payLab = [[UILabel alloc] init];
            payLab.frame = CGRectMake(10,10,90,15);
            payLab.backgroundColor = [UIColor clearColor];
            //            payLab.textColor = [UIColor colorWithHex:@"#999999"];
            payLab.font = SYSTEMFONT(12);
            payLab.text = @"联系电话";
            [cell addSubview:payLab];
            
            UIView *lineView = [[UIView alloc] init];
            lineView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
            lineView.frame = CGRectMake(10,39,ScreenWidth-20, 1);
            [cell addSubview: lineView];
            
            
        }else if(indexPath.row == 7){
            UILabel *lianxiLb = [[UILabel alloc] init];
            lianxiLb.frame = CGRectMake(10,10,90,15);
            lianxiLb.backgroundColor = [UIColor clearColor];
            //            payLab.textColor = [UIColor colorWithHex:@"#999999"];
            lianxiLb.font = SYSTEMFONT(12);
            lianxiLb.text = @"用QQ账号联系";
            [cell addSubview:lianxiLb];
            
            UIView *lineView = [[UIView alloc] init];
            lineView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
            lineView.frame = CGRectMake(10,39,ScreenWidth-20, 1);
            [cell addSubview: lineView];
            
        }else if(indexPath.row == 8){
            UILabel *lianxiLb = [[UILabel alloc] init];
            lianxiLb.frame = CGRectMake(10,10,90,15);
            lianxiLb.backgroundColor = [UIColor clearColor];
            //            payLab.textColor = [UIColor colorWithHex:@"#999999"];
            lianxiLb.font = SYSTEMFONT(12);
            lianxiLb.text = @"用微信账号联系";
            [cell addSubview:lianxiLb];
            UIView *lineView = [[UIView alloc] init];
            lineView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
            lineView.frame = CGRectMake(10,40,ScreenWidth-20, 1);
            [cell addSubview: lineView];
            
        }else if(indexPath.row == 9){
            UIView *spaceView = [[UIView alloc] initWithFrame:CGRectMake(0,0, ScreenWidth, 20)];
            spaceView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
            [cell addSubview:spaceView];
            
            UILabel *lianxiLb = [[UILabel alloc] init];
            lianxiLb.frame = CGRectMake(10,10,140,12);
            lianxiLb.backgroundColor = [UIColor clearColor];
            lianxiLb.textColor = [UIColor colorWithHex:@"#999999"];
            lianxiLb.font = SYSTEMFONT(11);
            lianxiLb.text = @"*请至少填写一种联系方式";
            [cell addSubview:lianxiLb];
        }
        
        
        //cell.titleLb.text = self.tableViewDataSource[indexPath.row];
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 10;
    }else if(indexPath.row==9){
        return 20;
    }else if(indexPath.row == 2){
        return 140;
    }else{
        return 40;
    }
   
    return 40;
    
}

- (BOOL)textView:(UITextView *)atextView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
  
    if ([text isEqualToString:@"\n"]) {
        [self.textView resignFirstResponder];
        return NO;
    }
   
    NSString *new = [self.textView.text stringByReplacingCharactersInRange:range withString:text];
  
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
    
        //5位
        NSString *str = [[sender text] stringByReplacingOccurrencesOfString:@"?" withString:@""];
        if (isChinese) { //中文输入法下
            UITextRange *selectedRange = [sender markedTextRange];
            //获取高亮部分
            UITextPosition *position = [sender positionFromPosition:selectedRange.start offset:0];
            // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            if (!position) {
                
                if ( str.length>=7) {
                    NSString *strNew = [NSString stringWithString:str];
                    [sender setText:[strNew substringToIndex:6]];
                    
                }
            }
        }else{
            if ([str length]>=7){
                NSString *strNew = [NSString stringWithString:str];
                [sender setText:[strNew substringToIndex:6]];
                
                
            }
        }
    }
    
}


-(void)viewClicked{
    NSLog(@"点击了");
    if (self.payMoneTf) {
        [self.payMoneTf resignFirstResponder];
    }
    if (self.textView) {
        [self.textView resignFirstResponder];
    }
    if(self.getMoneyTf){
        [self.getMoneyTf resignFirstResponder];

    }
}
@end
