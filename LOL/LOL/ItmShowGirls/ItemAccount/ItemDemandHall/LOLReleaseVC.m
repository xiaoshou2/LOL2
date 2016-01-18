//
//  LOLReleaseVC.m
//  LOL
//
//  Created by feibai on 16/1/16.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLReleaseVC.h"
#import "LOLchooseTitleVC.h"
#import "LOLPrintNumVC.h"
#define TEXT_MAXLENGTH 120
@implementation LOLReleaseVC
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"发布信息";
    [self setupMainView];
    
    ////创建通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(receivedStr:) name:RECEIVEDSTR object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(chooseTitle:) name:CHOOSETITLE object:nil];
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClicked)];
//    self.view.userInteractionEnabled = YES;
//    [self.view addGestureRecognizer:tap];
    
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
    return 13;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellWithIdentifier = [NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row];
    
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        UIView *spaceView = [[UIView alloc] initWithFrame:CGRectMake(0,0, ScreenWidth, 10)];
        spaceView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
        [cell addSubview:spaceView];
        return cell;

    
    }else if(indexPath.row == 1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

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
        
        self.titleContentLb = [[UILabel alloc] init];
        self.titleContentLb.frame = CGRectMake(SCREEN_WIDTH/2-55,8,140,25);
        self.titleContentLb.text = @"请选择标题内容...";
        self.titleContentLb.textColor = [UIColor colorWithHex:@"#999999"];
        self.titleContentLb.font = SYSTEMFONT(13);
        self.titleContentLb.backgroundColor = [UIColor clearColor];
        // self.mendTimeLb.backgroundColor = [UIColor grayColor];
        [cell addSubview:self.titleContentLb];
        
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
        lineView.frame = CGRectMake(10,39,ScreenWidth-20, 1);
        [cell addSubview: lineView];
        return cell;

        
        }else if(indexPath.row == 2){ //请详细补充你要发布的信息
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

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
            return cell;

        }else if(indexPath.row == 3){
            
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            UIView *spaceView2 = [[UIView alloc] initWithFrame:CGRectMake(0,0, ScreenWidth, 15)];
            spaceView2.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
            [cell addSubview:spaceView2];
            return cell;
        }else if(indexPath.row == 4){
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        
            
            UILabel *lianxiLb = [[UILabel alloc] init];
            lianxiLb.frame = CGRectMake(10,10,90,15);
            lianxiLb.backgroundColor = [UIColor clearColor];
           // lianxiLb.textColor = [UIColor colorWithHex:@"#999999"];
            lianxiLb.font = SYSTEMFONT(12);
            lianxiLb.text = @"完成时间:";
            [cell addSubview:lianxiLb];
            
            
            UILabel *dayLb = [[UILabel alloc] init];
            dayLb.frame = CGRectMake(150,10,50,15);
            dayLb.backgroundColor = [UIColor clearColor];
            //            payLab.textColor = [UIColor colorWithHex:@"#999999"];
            dayLb.font = SYSTEMFONT(12);
            dayLb.text = @"天之内";
            [cell addSubview:dayLb];
            
            self.dayTf = [[UITextField alloc] initWithFrame:CGRectMake(100,8,45, 20)];
            self.dayTf.tag = 4001;
            self.dayTf.enabled = YES;
            self.dayTf.font = SYSTEMFONT(12);
            //self.payMoneTf.delegate = self;
            self.dayTf.borderStyle = UITextBorderStyleNone;
            self.dayTf.keyboardType = UIKeyboardTypeDecimalPad;
            [self.dayTf resignFirstResponder];
            [self.dayTf addTarget:self action:@selector(limit_usemame_tf:) forControlEvents:UIControlEventEditingChanged];
            self.getMoneyTf.backgroundColor = [UIColor whiteColor];
            [cell addSubview:self.dayTf];
            
            //            payLab.textColor = [UIColor colorWithHex:@"#999999"];
            
            UIView *lineView = [[UIView alloc] init];
            lineView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
            lineView.frame = CGRectMake(10,40,ScreenWidth-20, 1);
            [cell addSubview: lineView];
            
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
            [self.dayTf setInputAccessoryView:topView];
            
            UILabel *tealLb = [[UILabel alloc] init];
            tealLb.frame = CGRectMake(SCREEN_WIDTH -50,10,50,15);
            tealLb.backgroundColor = [UIColor clearColor];
            tealLb.textColor = [UIColor colorWithHex:@"#999999"];
            tealLb.font = SYSTEMFONT(11);
            tealLb.text = @"(可选填)";
            [cell addSubview:tealLb];

            
            return cell;
            
        }else if(indexPath.row == 5){
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
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
            return cell;

        }else if(indexPath.row == 6){
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
 
            UILabel *payLab = [[UILabel alloc] init];
            payLab.frame = CGRectMake(10,10,90,15);
            payLab.backgroundColor = [UIColor clearColor];
//            payLab.textColor = [UIColor colorWithHex:@"#999999"];
            payLab.font = SYSTEMFONT(12);
            payLab.text = @"想支付报酬多少";
            [cell addSubview:payLab];
            
            UILabel *tealLb = [[UILabel alloc] init];
            tealLb.frame = CGRectMake(SCREEN_WIDTH -50,10,50,15);
            tealLb.backgroundColor = [UIColor clearColor];
            tealLb.textColor = [UIColor colorWithHex:@"#999999"];
            tealLb.font = SYSTEMFONT(11);
            tealLb.text = @"(可选填)";
            [cell addSubview:tealLb];
            
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
            [self.payMoneTf setInputAccessoryView:topView];
            
            [cell addSubview:yuanLb];
            
            UIView *lineView = [[UIView alloc] init];
            lineView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
            lineView.frame = CGRectMake(10,39,ScreenWidth-20, 1);
            [cell addSubview: lineView];
            return cell;
 
        }else if(indexPath.row == 7){
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

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
            
            UILabel *tealLb = [[UILabel alloc] init];
            tealLb.frame = CGRectMake(SCREEN_WIDTH -50,10,50,15);
            tealLb.backgroundColor = [UIColor clearColor];
            tealLb.textColor = [UIColor colorWithHex:@"#999999"];
            tealLb.font = SYSTEMFONT(11);
            tealLb.text = @"(可选填)";
            [cell addSubview:tealLb];
            
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
            [self.getMoneyTf setInputAccessoryView:topView];
            
            return cell;

        }else if(indexPath.row == 8){
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            UILabel *payLab = [[UILabel alloc] init];
            payLab.frame = CGRectMake(10,10,90,15);
            payLab.backgroundColor = [UIColor clearColor];
            //            payLab.textColor = [UIColor colorWithHex:@"#999999"];
            payLab.font = SYSTEMFONT(12);
            payLab.text = @"联系电话";
            [cell addSubview:payLab];
            
            self.phoneLb = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-142,8,120, 20)];
            self.phoneLb.tag = 1004;
            self.phoneLb.enabled = YES;
            self.phoneLb.textAlignment = NSTextAlignmentRight;
            self.phoneLb.font = SYSTEMFONT(12);
            //self.payMoneTf.delegate = self;
            self.phoneLb.backgroundColor = [UIColor clearColor];
            [cell addSubview:self.phoneLb];
            
            UIImageView *accImge = [[UIImageView alloc] init];
            accImge.image = [UIImage imageNamed:@"main_customerservice_ico_arrowgrey"];
            accImge.frame = CGRectMake(SCREEN_WIDTH -18,16,8,8);
            [cell addSubview:accImge];
            
            UIView *lineView = [[UIView alloc] init];
            lineView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
            lineView.frame = CGRectMake(10,39,ScreenWidth-20, 1);
            [cell addSubview: lineView];
            return cell;

            
        }else if(indexPath.row == 9){
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            UILabel *lianxiLb = [[UILabel alloc] init];
            lianxiLb.frame = CGRectMake(10,10,90,15);
            lianxiLb.backgroundColor = [UIColor clearColor];
            //            payLab.textColor = [UIColor colorWithHex:@"#999999"];
            lianxiLb.font = SYSTEMFONT(10);
            lianxiLb.text = @"用QQ账号联系";
            [cell addSubview:lianxiLb];
            
            self.qqLb = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-142,8,120, 20)];
            self.qqLb.tag = 1008;
            self.qqLb.enabled = YES;
            self.qqLb.textAlignment = NSTextAlignmentRight;

            self.qqLb.font = SYSTEMFONT(12);
            //self.payMoneTf.delegate = self;
            self.qqLb.backgroundColor = [UIColor clearColor];
            [cell addSubview:self.qqLb];
            
            UIImageView *accImge = [[UIImageView alloc] init];
            accImge.image = [UIImage imageNamed:@"main_customerservice_ico_arrowgrey"];
            accImge.frame = CGRectMake(SCREEN_WIDTH -18,16,8,8);
            [cell addSubview:accImge];
            
            UIView *lineView = [[UIView alloc] init];
            lineView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
            lineView.frame = CGRectMake(10,39,ScreenWidth-20, 1);
            [cell addSubview: lineView];
            return cell;

        }else if(indexPath.row == 10){
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            UILabel *lianxiLb = [[UILabel alloc] init];
            lianxiLb.frame = CGRectMake(10,10,90,15);
            lianxiLb.backgroundColor = [UIColor clearColor];
            //            payLab.textColor = [UIColor colorWithHex:@"#999999"];
            lianxiLb.font = SYSTEMFONT(12);
            lianxiLb.text = @"用微信账号联系";
            [cell addSubview:lianxiLb];
            
            self.weixinLb = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-142,8,120, 20)];
            self.weixinLb.tag = 1005;
            self.weixinLb.enabled = YES;
            self.weixinLb.textAlignment = NSTextAlignmentRight;
            self.weixinLb.font = SYSTEMFONT(12);
            self.weixinLb.backgroundColor = [UIColor clearColor];
            [cell addSubview:self.weixinLb];
            
            UIImageView *accImge = [[UIImageView alloc] init];
            accImge.image = [UIImage imageNamed:@"main_customerservice_ico_arrowgrey"];
            accImge.frame = CGRectMake(SCREEN_WIDTH -18,16,8,8);
            [cell addSubview:accImge];
            
            UIView *lineView = [[UIView alloc] init];
            lineView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
            lineView.frame = CGRectMake(10,40,ScreenWidth-20, 1);
            [cell addSubview: lineView];
            return cell;

            
        }else if(indexPath.row == 11){
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            UIView *spaceView = [[UIView alloc] initWithFrame:CGRectMake(0,0, ScreenWidth, 25)];
            spaceView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
            [cell addSubview:spaceView];
            
            UILabel *lianxiLb = [[UILabel alloc] init];
            lianxiLb.frame = CGRectMake(10,5,140,12);
            lianxiLb.backgroundColor = [UIColor clearColor];
            lianxiLb.textColor = [UIColor colorWithHex:@"#999999"];
            lianxiLb.font = SYSTEMFONT(11);
            lianxiLb.text = @"*请至少填写一种联系方式";
            [cell addSubview:lianxiLb];
            return cell;
        }
        else if(indexPath.row == 12){
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor clearColor];
            UIButton *releaseBtn = [[UIButton alloc]init];
            releaseBtn.frame = CGRectMake(SCREEN_WIDTH/2-60,2,120, 35);
            releaseBtn.backgroundColor = [UIColor redColor];
            [self.tableView addSubview:releaseBtn];
            [releaseBtn addTarget:self action:@selector(releaseClicked) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:releaseBtn];
             return cell;
        }
        
        //cell.titleLb.text = self.tableViewDataSource[indexPath.row];
    return nil;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 10;
    }else if(indexPath.row == 3){
        return 15;
    }else if(indexPath.row==11){
        return 25;
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
    
    
    if(sender.tag == 1001){
    
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
    }else{
        
            //5位
            NSString *str = [[sender text] stringByReplacingOccurrencesOfString:@"?" withString:@""];
            if (isChinese) { //中文输入法下
                UITextRange *selectedRange = [sender markedTextRange];
                //获取高亮部分
                UITextPosition *position = [sender positionFromPosition:selectedRange.start offset:0];
                // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
                if (!position) {
                    
                    if ( str.length>=15) {
                        NSString *strNew = [NSString stringWithString:str];
                        [sender setText:[strNew substringToIndex:14]];
                        
                    }
                }
            }else{
                if ([str length]>=15){
                    NSString *strNew = [NSString stringWithString:str];
                    [sender setText:[strNew substringToIndex:14]];
                    
                    
                }
            }
        }
    
    if(sender.tag == 4001){
        
        //5位
        NSString *str = [[sender text] stringByReplacingOccurrencesOfString:@"?" withString:@""];
        if (isChinese) { //中文输入法下
            UITextRange *selectedRange = [sender markedTextRange];
            //获取高亮部分
            UITextPosition *position = [sender positionFromPosition:selectedRange.start offset:0];
            // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            if (!position) {
                
                if ( str.length>=4) {
                    NSString *strNew = [NSString stringWithString:str];
                    [sender setText:[strNew substringToIndex:3]];
                    
                }
            }
        }else{
            if ([str length]>=4){
                NSString *strNew = [NSString stringWithString:str];
                [sender setText:[strNew substringToIndex:3]];
                
                
            }
        }
    }else{
        
        //5位
        NSString *str = [[sender text] stringByReplacingOccurrencesOfString:@"?" withString:@""];
        if (isChinese) { //中文输入法下
            UITextRange *selectedRange = [sender markedTextRange];
            //获取高亮部分
            UITextPosition *position = [sender positionFromPosition:selectedRange.start offset:0];
            // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            if (!position) {
                
                if ( str.length>=4) {
                    NSString *strNew = [NSString stringWithString:str];
                    [sender setText:[strNew substringToIndex:3]];
                    
                }
            }
        }else{
            if ([str length]>=4){
                NSString *strNew = [NSString stringWithString:str];
                [sender setText:[strNew substringToIndex:3]];
                
                
            }
        }
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        LOLchooseTitleVC *chooseTitle = [[LOLchooseTitleVC alloc] init];
        [[SharedDelegate getRootNav]pushViewController:chooseTitle animated:YES];
        
    }else if(indexPath.row == 8||indexPath.row == 9||indexPath.row==10){
        LOLPrintNumVC *printNum = [[LOLPrintNumVC alloc] init];
        if (indexPath.row == 8) {
            printNum.titleStr = @"输入手机号";
        }else if(indexPath.row == 9){
            printNum.titleStr = @"输入QQ号";
        }else if(indexPath.row == 10){
            printNum.titleStr = @"输入微信号";
        }
          [[SharedDelegate getRootNav]pushViewController:printNum animated:YES];
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

-(void)receivedStr:(NSNotification*)obj{
    
    if ([[obj.userInfo objectForKey:@"type"] isEqualToString:PRINT_PHHONE]) {
        self.phoneLb.text = [obj.userInfo objectForKey:@"content"];
    }else if([[obj.userInfo objectForKey:@"type"] isEqualToString:PRINT_QQ]){
        self.qqLb.text = [obj.userInfo objectForKey:@"content"];

    }else if([[obj.userInfo objectForKey:@"type"] isEqualToString:PRINT_WEIXIN]){
        self.weixinLb.text = [obj.userInfo objectForKey:@"content"];

    }
}

-(void)chooseTitle:(NSNotification*)obj{
    
    self.titleContentLb.text = [obj.userInfo objectForKey:@"title"];
}
-(void)dealloc
{
    //移除
    [[NSNotificationCenter defaultCenter]removeObserver:self name:RECEIVEDSTR object:nil];
    //移除
    [[NSNotificationCenter defaultCenter]removeObserver:self name:CHOOSETITLE object:nil];
}
-(void)dismissKeyBoard
{
    if (self.payMoneTf) {
        [self.payMoneTf resignFirstResponder];
    }
    if (self.getMoneyTf) {
        [self.getMoneyTf resignFirstResponder];

    }
    if (self.dayTf) {
        [self.dayTf resignFirstResponder];
        
    }
}
@end
