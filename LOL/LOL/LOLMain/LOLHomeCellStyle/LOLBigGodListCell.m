//
//  LOLBigGodListCell.m
//  LOL
//
//  Created by feibai on 16/1/11.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLBigGodListCell.h"

@implementation LOLBigGodListCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.topLineView = [[UIView alloc] initWithFrame:CGRectMake(10,0,ScreenWidth-20, 1)];
        self.topLineView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
        [self addSubview:self.topLineView];
        
        self.headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10,10,65,65)];
        self.headImageView.layer.masksToBounds =YES;
        self.headImageView.layer.cornerRadius =65/2;
        self.headImageView.backgroundColor = [UIColor clearColor];
        //self.headImageView.backgroundColor = [UIColor redColor];
        [self addSubview:self.headImageView];
        
        self.userNameLb = [[UILabel alloc] initWithFrame:CGRectMake(90,10,60,17)];
        //self.userNameLb.text = @"皮小秀";
        self.userNameLb.font = SYSTEMFONT(15);
        self.userNameLb.backgroundColor = [UIColor clearColor];
//        self.userNameLb.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.userNameLb];
        
        self.duanweiLb = [[UILabel alloc] initWithFrame:CGRectMake(90,32,100,17)];
       // self.duanweiLb.text = @"网通5 钻石3";
        self.duanweiLb.font = SYSTEMFONT(15);
        self.duanweiLb.textColor = [UIColor colorWithHex:@"#999999"];
        self.duanweiLb.backgroundColor = [UIColor clearColor];
//        self.duanweiLb.backgroundColor = [UIColor purpleColor];
        [self addSubview:self.duanweiLb];
        
        self.goodatLa = [[UILabel alloc] initWithFrame:CGRectMake(90,54,45,17)];
        self.goodatLa.text = @"擅长:";
        self.goodatLa.font = SYSTEMFONT(15);
        //self.goodatLa.backgroundColor = [UIColor blueColor];
        self.goodatLa.backgroundColor = [UIColor clearColor];
        [self addSubview:self.goodatLa];
        
        for (int i = 0; i < 3; i++) {
            self.locationLb = [[UIImageView alloc] initWithFrame:CGRectMake(140+(i*50),54,45,20)];
            if (i == 0) {
                self.locationLb.backgroundColor = [UIColor blueColor];
            }else if(i==1)
            {
                self.locationLb.backgroundColor = [UIColor yellowColor];

            }else
            {
                self.locationLb.backgroundColor = [UIColor blackColor];

            }
            [self addSubview:self.locationLb];
        }
        
        self.introductionLb = [[UILabel alloc] initWithFrame:CGRectMake(90,78,200,17)];
        self.introductionLb.textColor = [UIColor colorWithHex:@"#999999"];

       // self.introductionLb.text = @"喝醉烈的酒,日最野的狗";
        self.introductionLb.font = SYSTEMFONT(13);
        self.introductionLb.backgroundColor = [UIColor clearColor];
       // self.introductionLb.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.introductionLb];
        
    }
    return self;
}

- (void)setCellModel:(LOLBigGodModel *)model{
    _cellModel = model;

      [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.mBGheadImageAdress] placeholderImage:[UIImage imageNamed:@"yw_load7"]];
      self.userNameLb.text = _cellModel.mBGuserName;
      self.duanweiLb.text  = _cellModel.mUserDuanWei;
    //              cell.goodatLa      = model.mUserGoodat;
      self.introductionLb.text = _cellModel.mUserIntroduce;
     // cell.locationLb    = model.mUserGoodat;
}

@end
