//
//  LOLUserMessageVC.h
//  LOL
//
//  Created by feibai on 16/1/15.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LOLChangeMesVC.h"
@interface LOLUserMessageVC : LOLBaseViewController<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    BOOL changImg;

}
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *tableViewDataSource;
@property (nonatomic,strong)UIButton *exitBtn;
@property (nonatomic,strong)UIImageView *headimage;
@property (nonatomic,retain)UIImagePickerController *mypicker;
@property (nonatomic, strong) UIActionSheet *sheet;
@end
