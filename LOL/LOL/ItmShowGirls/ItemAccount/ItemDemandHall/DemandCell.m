//
//  DemandCell.m
//  LOL
//
//  Created by feibai on 16/1/13.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "DemandCell.h"
#import "LOLDemandModel.h"
@implementation DemandCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        self.muserHeadImageView = [[UIImageView alloc] init];
        self.muserHeadImageView.frame = CGRectMake(10,10,45, 45);
        //self.muserHeadImageView.backgroundColor = [UIColor redColor];
        self.muserHeadImageView.backgroundColor = [UIColor clearColor];
        self.muserHeadImageView.layer.masksToBounds =YES;
        self.muserHeadImageView.layer.cornerRadius =45/2;
        [self addSubview:self.muserHeadImageView];
        
        self.muserNameLb = [[UILabel alloc] init];
        self.muserNameLb.frame = CGRectMake(60,10,120,20);
        self.muserNameLb.backgroundColor = [UIColor clearColor];
     // self.muserNameLb.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.muserNameLb];
        
        self.mreleaseTimeLb = [[UILabel alloc] init];
        self.mreleaseTimeLb.frame = CGRectMake(60,35,120,20);
        self.mreleaseTimeLb.font = SYSTEMFONT(12);
        self.mreleaseTimeLb.textColor = [UIColor colorWithHex:@"#999999"];
//        self.mreleaseTimeLb.backgroundColor = [UIColor blueColor];
        self.mreleaseTimeLb.backgroundColor = [UIColor clearColor];
        [self addSubview:self.mreleaseTimeLb];
        
        self.mcontentLb = [[UILabel alloc] init];
        self.mcontentLb.font = SYSTEMFONT(14);
        self.mcontentLb.numberOfLines = 0;
        //self.mcontentLb.backgroundColor = [UIColor brownColor];
        self.mcontentLb.backgroundColor = [UIColor clearColor];

        [self addSubview:self.mcontentLb];
        
        self.mpriceLb = [[UILabel alloc] init];
        
        self.mpriceLb.font = SYSTEMFONT(13);
        //self.mpriceLb.backgroundColor = [UIColor purpleColor];
        self.mpriceLb.backgroundColor = [UIColor clearColor];
        [self addSubview:self.mpriceLb];
        
        
        self.mendTimeLb = [[UILabel alloc] init];
        self.mendTimeLb.backgroundColor = [UIColor clearColor];
       // self.mendTimeLb.backgroundColor = [UIColor grayColor];
        [self addSubview:self.mendTimeLb];
        self.mendTimeLb.font = SYSTEMFONT(13);

        
        self.mhelpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        self.mhelpBtn.backgroundColor = [UIColor blackColor];
        [self addSubview:self.mhelpBtn];
        
        self.spaceView = [[UIView alloc] init];
        self.spaceView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
        [self addSubview:self.spaceView];
        
        
    }
    return self;
}

-(void)resetFrame:(float)height
{
    self.mcontentLb.frame = CGRectMake(60,60,ScreenWidth-80,height+15);
 
    self.mpriceLb.frame = CGRectMake(60,70+self.mcontentLb.height,100,20);
    self.mendTimeLb.frame = CGRectMake(170,70+self.mcontentLb.height,60,20);
    self.mhelpBtn.frame = CGRectMake(60, 110+self.mcontentLb.height, 50, 40);
    self.spaceView.frame = CGRectMake(0,145+self.mcontentLb.height, ScreenWidth, 15);
}


@end
