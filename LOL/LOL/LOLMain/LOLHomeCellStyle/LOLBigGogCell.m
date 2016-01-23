//
//  LOLBigGogCell.m
//  LOL
//
//  Created by feibai on 16/1/9.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLBigGogCell.h"

@implementation LOLBigGogCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{  
    // 总列
    int totalCol = 4;
    CGFloat marginY = 0;
    CGFloat startY = 0;
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {        
        CGFloat viewW = ScreenWidth/4;
        CGFloat viewH = 94;
        for (int i = 0; i<8; i++) {
        
            self.bottmoView = [[UIImageView alloc] init];
            [self.bottmoView setFrame:CGRectMake((i*ScreenWidth/4),0,ScreenWidth/4,80)];
            self.bottmoView.userInteractionEnabled = YES;
            self.bottmoView.tag = 2000+i;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemClicked:)];
            [self.bottmoView addGestureRecognizer:tap];
            
            self.headImageView = [[UIImageView alloc] init];
            self.headImageView.tag = 3000+i;
            self.userNameLb = [[UILabel alloc] init];
            self.userNameLb.backgroundColor = [UIColor clearColor];
            self.userNameLb.textAlignment = NSTextAlignmentCenter;
            self.userNameLb.font = SYSTEMFONT(12);
            self.userNameLb.tag = 4000+i;
            self.userMessageLb = [[UILabel alloc] init];
            self.userMessageLb.textAlignment = NSTextAlignmentCenter;
            self.userMessageLb.font = SYSTEMFONT(10);
            self.userMessageLb.textColor = [UIColor colorWithHex:@"#999999"];
            self.userMessageLb.backgroundColor = [UIColor clearColor];
            self.userMessageLb.tag = 5000+i;
            
   
            
            
            self.userMessageSecLb = [[UILabel alloc] init];
            self.userMessageSecLb.tag = 6000 +i;
            self.userMessageSecLb.backgroundColor = [UIColor clearColor];
            self.userMessageSecLb.font = SYSTEMFONT(10);
//            self.userMessageSecLb.layer.cornerRadius = 10;
//            UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgbtn.jpg"]];
//            [self.userMessageSecLb setBackgroundColor:color];
            self.userMessageSecLb.layer.cornerRadius = 5.0f;
            self.userMessageSecLb.textColor = [UIColor whiteColor];
            self.userMessageSecLb.textAlignment = NSTextAlignmentCenter;
            
            // 行数
            int row = i / totalCol;
            // 列数
            int cul = i % totalCol;
            
            CGFloat x = 0 + (viewW) * cul + marginY;
            CGFloat y = startY + (viewH +marginY) * row;
            
            CGFloat viewW = ScreenWidth/4;
        [self.bottmoView setFrame:CGRectMake(x, y, viewW,viewH+2)];
        [self.headImageView setFrame:CGRectMake(self.bottmoView.width/2-35/2,5,35,35)];
            self.headImageView.layer.masksToBounds =YES;
            self.headImageView.layer.cornerRadius =35/2;
        [self.userNameLb setFrame:CGRectMake(self.headImageView.frame.origin.x-5,self.headImageView.frame.origin.y+40,45,17)];
        [self.userMessageLb setFrame:CGRectMake(self.headImageView.frame.origin.x-5,self.headImageView.frame.origin.y+57,45,16)];
        
        self.bottomImg = [[UIImageView alloc] initWithFrame:CGRectMake(self.headImageView.frame.origin.x-6,self.headImageView.frame.origin.y+71,50,17)];
            self.bottomImg.image = [UIImage imageNamed:@"bgbtn.jpg"];
            [self.userMessageSecLb setFrame:CGRectMake(2,0,45,17)];
    
       if (i == 0) {
//                self.bottmoView.backgroundColor = [UIColor yellowColor];
//                self.headImageView.backgroundColor = [UIColor redColor];
//                self.userNameLb.backgroundColor = [UIColor blueColor];
//                self.userMessageLb.backgroundColor = [UIColor blackColor];
//                self.userMessageSecLb.backgroundColor = [UIColor purpleColor];
           
                
            }else if(i ==1)
            {
              //  self.bottmoView.backgroundColor = [UIColor redColor];
               // self.headImageView.backgroundColor = [UIColor yellowColor];
             //   self.userNameLb.backgroundColor = [UIColor purpleColor];
              //  self.userMessageLb.backgroundColor = [UIColor blackColor];
              //  self.userMessageSecLb.backgroundColor = [UIColor purpleColor];

            }else if(i ==2)
            {
//                self.bottmoView.backgroundColor = [UIColor blackColor];
//                self.headImageView.backgroundColor = [UIColor brownColor];
//             //   self.userNameLb.backgroundColor = [UIColor redColor];
//                self.userMessageLb.backgroundColor = [UIColor blackColor];
//                self.userMessageSecLb.backgroundColor = [UIColor whiteColor];

 
                
            }else if(i ==3)
            {
//                self.bottmoView.backgroundColor = [UIColor yellowColor];
//                self.headImageView.backgroundColor = [UIColor whiteColor];
//                //self.userNameLb.backgroundColor = [UIColor blueColor];
//                self.userMessageLb.backgroundColor = [UIColor blackColor];
//                self.userMessageSecLb.backgroundColor = [UIColor purpleColor];
//

                
            }else if(i ==4)
            {
//                self.bottmoView.backgroundColor = [UIColor brownColor];
//                self.headImageView.backgroundColor = [UIColor purpleColor];
//                self.userNameLb.backgroundColor = [UIColor redColor];
//                self.userMessageLb.backgroundColor = [UIColor blackColor];
//                self.userMessageSecLb.backgroundColor = [UIColor purpleColor];


                
            }else if(i ==5)
            {
//                self.bottmoView.backgroundColor = [UIColor grayColor];
//                self.headImageView.backgroundColor = [UIColor redColor];
//            //    self.userNameLb.backgroundColor = [UIColor yellowColor];
//                self.userMessageLb.backgroundColor = [UIColor blackColor];
//                self.userMessageSecLb.backgroundColor = [UIColor purpleColor];
//

                
            }else if(i ==6)
            {
//                self.bottmoView.backgroundColor = [UIColor purpleColor];
//                self.headImageView.backgroundColor = [UIColor yellowColor];
//                self.userNameLb.backgroundColor = [UIColor grayColor];
//                self.userMessageLb.backgroundColor = [UIColor blackColor];
//                self.userMessageSecLb.backgroundColor = [UIColor purpleColor];

  
                
            }else if(i ==7)
            {
//                self.bottmoView.backgroundColor = [UIColor greenColor];
//                self.headImageView.backgroundColor = [UIColor blueColor];
//                self.userNameLb.backgroundColor = [UIColor brownColor];
//                self.userMessageLb.backgroundColor = [UIColor blackColor];
//                self.userMessageSecLb.backgroundColor = [UIColor purpleColor];
//
            }
            
            [self addSubview:self.bottmoView];
            [self.bottmoView addSubview:self.headImageView];
            [self.bottmoView addSubview:self.userNameLb];
            [self.bottmoView addSubview:self.userMessageLb];
            [self.bottmoView addSubview:self.bottomImg];
            [self.bottomImg addSubview:self.userMessageSecLb];
         
     
        }
        
        self.spaceView = [[UIView alloc] initWithFrame:CGRectMake(0,188, ScreenWidth, 13)];
        self.spaceView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
        [self addSubview:self.spaceView];
        
    }
    return self;
}

- (void)setModelArr:(NSMutableArray *)modelArr{
    _modelArr = modelArr;
    if (_modelArr.count > 0) {
        [self assignment];//赋值
    }
}

- (void) assignment{
    for (int i =0; i<[self.modelArr count]; i++) {
        LOLBigGodModel *data = _modelArr[i];
        UILabel *namelb = [self viewWithTag:4000+i];
        namelb.text = data.mBGuserName;
        
        UIImageView *headimg = [self viewWithTag:3000+i];
        [headimg sd_setImageWithURL:[NSURL URLWithString:data.mBGheadImageAdress] placeholderImage:[UIImage imageNamed:@"yw_load7"]];

        UILabel *mesOneLb = [self viewWithTag:5000+i];
        mesOneLb.text = data.mUserDuanWei;
        
        data.mUserShenglv = @"98%";
        UILabel *mesSecLb = [self viewWithTag:6000+i];
        mesSecLb.text = [NSString stringWithFormat:@"胜率:%@",data.mUserShenglv];
        
    }
}


-(void)itemClicked:(UITapGestureRecognizer*)sender
{
    UIView *temp = sender.view;
    LOLBigGodModel *selectModel = self.modelArr[temp.tag-2000];
    if (self.godClickedBk) {
        self.godClickedBk(selectModel.mUserID);
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
