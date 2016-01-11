//
//  LOLHomeMenuCell.h
//  LOL
//
//  Created by feibai on 16/1/9.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MenuClickedBlock)(NSInteger sender);

@interface LOLHomeMenuCell : UITableViewCell
@property (nonatomic,copy)MenuClickedBlock menuClickedBk;
@property (nonatomic,strong)UIView *bottomView;
@property (nonatomic,strong)UIImageView *menuImageView;
@property (nonatomic,strong)UILabel *menuTitleLabel;
@end
