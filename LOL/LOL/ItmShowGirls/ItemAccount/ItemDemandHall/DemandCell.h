//
//  DemandCell.h
//  LOL
//
//  Created by feibai on 16/1/13.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemandCell : UITableViewCell
@property (nonatomic,strong)NSString *demandID;
@property (nonatomic,strong)UIImageView *muserHeadImageView;
@property (nonatomic,strong)UILabel *muserNameLb;
@property (nonatomic,strong)UILabel *mreleaseTimeLb;
@property (nonatomic,strong)UILabel *mcontentLb;
@property (nonatomic,strong)UILabel *mpriceLb;
@property (nonatomic,strong)UILabel *mendTimeLb;
@property (nonatomic,strong)UIButton *mhelpBtn;
@property (nonatomic,strong)UIView *spaceView;
-(void)resetFrame:(float)height;
@end
