//
//  LOLUserMessageVC.m
//  LOL
//
//  Created by feibai on 16/1/15.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLUserMessageVC.h"
#import "LOLAccountCell.h"
@implementation LOLUserMessageVC
-(void)viewDidLoad
{
    [super viewDidLoad];
     self.title = @"个人信息";
    [self setupMainView];
    self.tableViewDataSource = [NSMutableArray arrayWithObjects:@"",@"头像",@"昵称",@"性别",@"等级",@"个人签名",@"电话",@"修改密码", nil];
    
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
    
    self.exitBtn = [[UIButton alloc]init];
    self.exitBtn.frame = CGRectMake(SCREEN_WIDTH/2-60,SCREEN_HEIGHT-185 ,120, 35);
    self.exitBtn.backgroundColor = [UIColor redColor];
    [self.tableView addSubview:self.exitBtn];
    [self.exitBtn addTarget:self action:@selector(exitLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:self.exitBtn];
}

-(void)exitLogin
{
    NSLog(@"退出登录");
}

#pragma mark - tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableViewDataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *CellWithIdentifier = @"Cell";
   
    if (indexPath.row == 0) {
        UITableViewCell *spaceCell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
        spaceCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (spaceCell == nil) {
            spaceCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
        }
        UIView *spaceView = [[UIView alloc] initWithFrame:CGRectMake(0,0, ScreenWidth, 20)];
        spaceView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
        [spaceCell addSubview:spaceView];
        
        return spaceCell;
    }
    else {
        LOLAccountCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (cell == nil) {
            cell = [[LOLAccountCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
        }
        if(indexPath.row == 1){//头像
            
            UIImageView *headImageView = [[UIImageView alloc] init];
            headImageView.image = [UIImage imageNamed:@"h2x_i_02"];
            headImageView.frame = CGRectMake(SCREEN_WIDTH-70,5,44,44);
            headImageView.layer.masksToBounds =YES;
            headImageView.layer.cornerRadius =44/2;
            [cell addSubview:headImageView];
        }else if(indexPath.row == 2){
            UILabel *nameLbel = [[UILabel alloc] init];
            nameLbel.frame  = CGRectMake(SCREEN_WIDTH-123,10,100,18);
            nameLbel.font = SYSTEMFONT(13);
            nameLbel.textAlignment = NSTextAlignmentRight;
            nameLbel.text = @"无敌大战神";
            nameLbel.backgroundColor = [UIColor clearColor];
            [cell addSubview:nameLbel];
        }else if(indexPath.row == 3){
            UILabel *sexLabel = [[UILabel alloc] init];
            sexLabel.frame  = CGRectMake(SCREEN_WIDTH-65,10,40,18);
            sexLabel.font = SYSTEMFONT(13);
            sexLabel.textAlignment = NSTextAlignmentRight;
            sexLabel.text = @"男";
            sexLabel.backgroundColor = [UIColor clearColor];
            [cell addSubview:sexLabel];
        }else if(indexPath.row == 4){
            UILabel *typeLB = [[UILabel alloc] init];
            typeLB.frame  = CGRectMake(SCREEN_WIDTH-90,10,65,18);
            typeLB.font = SYSTEMFONT(13);
            typeLB.textAlignment = NSTextAlignmentRight;
            typeLB.text = @"金牌打手";
            typeLB.backgroundColor = [UIColor clearColor];
            [cell addSubview:typeLB];
        }else if(indexPath.row == 5){
            UILabel *sigleLb = [[UILabel alloc] init];
            sigleLb.frame  = CGRectMake(SCREEN_WIDTH-175,10,150,18);
            sigleLb.font = SYSTEMFONT(13);
            sigleLb.textAlignment = NSTextAlignmentRight;
            sigleLb.text = @"和最烈的酒，日最野的狗";
            sigleLb.backgroundColor = [UIColor clearColor];
            [cell addSubview:sigleLb];
        }else if(indexPath.row == 6){
            UILabel *sigleLb = [[UILabel alloc] init];
            sigleLb.frame  = CGRectMake(SCREEN_WIDTH-120,10,100,18);
            sigleLb.font = SYSTEMFONT(13);
            sigleLb.textAlignment = NSTextAlignmentRight;
            sigleLb.text = @"13067891234";
            sigleLb.backgroundColor = [UIColor clearColor];
            [cell addSubview:sigleLb];
        }
        
        
        cell.titleLb.text = self.tableViewDataSource[indexPath.row];

        return cell;
    }

    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@" ---  %ld ----",(long)indexPath.row);
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    if (indexPath.row == 0) {
        return 20;
    }else if(indexPath.row == 1){
        return 60;
    }else
        return 40;

}
@end
