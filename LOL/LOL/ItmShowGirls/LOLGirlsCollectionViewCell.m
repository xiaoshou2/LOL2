//
//  LOLGirlsCollectionViewCell.m
//  LOL
//
//  Created by mac on 16/1/19.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLGirlsCollectionViewCell.h"

@implementation LOLGirlsCollectionViewCell

- (instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupMainView];
    }
    return self;
}


-(void)setupMainView{
 
        self.headImage = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5,(ScreenWidth-20)/2-10,(ScreenWidth-20)/2+20)];
        self.headImage.backgroundColor= [UIColor whiteColor];
    
        //        imageview.layer.borderColor=[UIColor lightGrayColor].CGColor;
        //        imageview.layer.borderWidth=0.5;
        //        [imageview setImageWithURL:[NSURL URLWithString:model.default_image] placeholderImage:[UIImage imageNamed:@"占位图"]];
        [self.contentView addSubview:self.headImage];
        
         self.severLb = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.headImage.frame)+5, (ScreenWidth-20)/2,20)];
        self.severLb.numberOfLines = 2;
        self.severLb.font = [UIFont systemFontOfSize:12];
        self.severLb.textColor = RGBACOLOR(114, 114, 114, 1);
        self.severLb.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.severLb];
        
        self.nameLb = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.severLb.frame), (ScreenWidth-20)/4+20,20)];
        
        self.nameLb.font = [UIFont systemFontOfSize:15];
        self.nameLb.textColor = RGBACOLOR(228 ,155,80, 1);
        self.nameLb.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.nameLb];
        self.nameLb.backgroundColor= [UIColor whiteColor];
    
        self.gradelabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.nameLb.frame)+5, CGRectGetMaxY(self.severLb.frame), (ScreenWidth-20)/4-30,20)];
        
        self.gradelabel.font = [UIFont systemFontOfSize:10];
        self.gradelabel.textColor = [UIColor lightGrayColor];
        self.gradelabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.gradelabel];
        self.backgroundColor= [UIColor whiteColor];
        
        
        
       self.signLb = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.nameLb.frame) ,(ScreenWidth-40)/2, 20)];
        self.signLb.backgroundColor = [UIColor clearColor];
        self.signLb.textColor = [UIColor lightGrayColor];
        self.signLb.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:self.signLb];
        
 
}
-(void)setDataModel:(LOLshowModel *)model{
    NSLog(@" -touxiang -   %@  ---",model.imgStr);
    
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:model.imgStr] placeholderImage:[UIImage imageNamed:@"yw_load7"]];
    
    self.signLb.text = model.sign;
    
    self.gradelabel.text = model.gameDan;
    
    self.nameLb.text = [NSString stringWithFormat:@"ID:%@",model.gameID];

    self.severLb.text = model.gameSever;
    
    
}
@end
