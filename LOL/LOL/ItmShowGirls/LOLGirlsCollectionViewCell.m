//
//  LOLGirlsCollectionViewCell.m
//  LOL
//
//  Created by mac on 16/1/19.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLGirlsCollectionViewCell.h"

@implementation LOLGirlsCollectionViewCell
+(instancetype)cellWithTableView:(UICollectionView *)tableView a:(NSIndexPath*)indexPath{
    LOLGirlsCollectionViewCell *cell = [tableView dequeueReusableCellWithReuseIdentifier:@"GradientCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"GradientCell" owner:nil options:nil]lastObject];
        
        
    }
    return cell;
}
-(void)setGoods:(LOLshowModel *)model{
    
    
    
}
@end
