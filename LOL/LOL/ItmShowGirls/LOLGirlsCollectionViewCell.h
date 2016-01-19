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
+(instancetype)cellWithTableView:(UICollectionView *)tableView a:(NSIndexPath*)indexPath;
-(void)setGoods:(LOLshowModel *)model;
@end
