//
//  LOLchooseTitleVC.m
//  LOL
//
//  Created by feibai on 16/1/17.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLchooseTitleVC.h"
#import "LOLChooseTitleCell.h"

@implementation LOLchooseTitleVC
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
    self.title = @"请选择标题";
    self.dataSuroceArr = [NSMutableArray arrayWithObjects:@"",@"打排位",@"找陪玩",@"刷金币",@"其他",nil];
    [self setupMainView];
    
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

-(void)chooseClicked{
    NSLog(@"点击发布");
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSuroceArr.count;
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
    }else{
        LOLChooseTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
        cell = [[LOLChooseTitleCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        cell.titleLb.text = self.dataSuroceArr[indexPath.row];
        UIView *lineView = [[UIView alloc] init];
        
        lineView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
        if(indexPath.row == 4){
            lineView.frame = CGRectMake(10,40,ScreenWidth-20, 1);
 
        }else{
           lineView.frame = CGRectMake(10,39,ScreenWidth-20, 1);

        }
        [cell addSubview:lineView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }
    
    
    //cell.titleLb.text = self.tableViewDataSource[indexPath.row];
    return nil;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 10;
    }else

    return 40;
    
}
//
//- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
//{
//    if(indexPath.row == currentIndex){
//      //  return UITableViewCellAccessoryCheckmark;
//        return nil;
//    }
//    else{
//        return UITableViewCellAccessoryNone;
//    }
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row!=0) {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        if(indexPath.row == currentIndex){
            return;
        }
        NSIndexPath *oldIndexPath = [NSIndexPath indexPathForRow:currentIndex
                                                       inSection:0];
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
        if (newCell.accessoryType == UITableViewCellAccessoryNone) {
            newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:oldIndexPath];
        if (oldCell.accessoryType == UITableViewCellAccessoryCheckmark) {
            oldCell.accessoryType = UITableViewCellAccessoryNone;
        }
        currentIndex = indexPath.row;
        
        NSLog(@"-- %ld --",(long)currentIndex);
        //发送通知
        [[NSNotificationCenter defaultCenter]postNotificationName:CHOOSETITLE object:self userInfo:@{@"title":self.dataSuroceArr[currentIndex]}];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

@end
