//
//  LOLDemandHallVC.h
//  LOL
//
//  Created by feibai on 16/1/13.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DemandCell.h"
@interface LOLDemandHallVC : LOLBaseViewController<UITableViewDelegate,UITableViewDataSource>
{
    CGFloat _beginOffsetY; //开始拖动的位置
    BOOL _hideOrShowTopViewProgress; //隐藏或显示顶部view的进度
    BOOL _hideTopView; //顶部view是否隐藏
}
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *tableViewDataSource;

@property (nonatomic, strong) UIView *TopView;

@property (nonatomic, strong) UIButton *btn;
@end
