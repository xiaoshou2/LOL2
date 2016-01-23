//
//  LOLGirlsCollectionViewCell.h
//  LOL
//
//  Created by mac on 16/1/19.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LOLshowModel.h"
@interface LOLGirlsCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong)UIImageView *headImage;
@property (nonatomic,strong)UILabel *severLb;
@property (nonatomic,strong)UILabel *nameLb;
@property (nonatomic,strong)UILabel *gradelabel;
@property (nonatomic,strong)UILabel *signLb;
@property (nonatomic,strong)LOLshowModel *dataModel;

-(void)setDataModel:(LOLshowModel *)model;
@end
