//
//  LOLHomeMenuCell.m
//  LOL
//
//  Created by feibai on 16/1/9.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLHomeMenuCell.h"

@implementation LOLHomeMenuCell

- (void)awakeFromNib {
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        NSArray *titleArray = @[@"我要上分",@"大神认证",@"热门推荐",@"发布需求"];
        for (int i = 0; i<4; i++) {
            self.bottomView = [[UIView alloc] init];
            [self.bottomView setFrame:CGRectMake((i*ScreenWidth/4),0,ScreenWidth/4,80)];
            self.bottomView.tag = 1000+i;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClicked:)];
            [self.bottomView addGestureRecognizer:tap];
            
            
            self.menuImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bottomView.width/2-25,10,50,50)];
            self.menuTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.bottomView.width/2-25,61,50,20)];
            
            
            if (i == 0) {
                self.bottomView.backgroundColor = [UIColor blueColor];
                self.menuImageView.backgroundColor = [UIColor redColor];
                self.menuTitleLabel.backgroundColor = [UIColor yellowColor];
                
            }else if(i ==1)
            {
                self.bottomView.backgroundColor = [UIColor blackColor];
                self.menuImageView.backgroundColor = [UIColor redColor];
                 self.menuTitleLabel.backgroundColor = [UIColor orangeColor];
            }
            else if(i == 2)
            {
                self.bottomView.backgroundColor = [UIColor yellowColor];
                self.menuImageView.backgroundColor = [UIColor greenColor];
                 self.menuTitleLabel.backgroundColor = [UIColor darkGrayColor];
            }else
            {
                self.bottomView.backgroundColor = [UIColor greenColor];
                self.menuImageView.backgroundColor = [UIColor brownColor];
                self.menuTitleLabel.backgroundColor = [UIColor redColor];
            }
            [self addSubview:self.bottomView];
            [self.bottomView addSubview:self.menuImageView];
            [self.bottomView addSubview:self.menuTitleLabel];
            self.menuTitleLabel.text = titleArray[i];
            self.menuTitleLabel.font = SYSTEMFONT(11);
            self.menuTitleLabel.textAlignment = NSTextAlignmentCenter;
            
        }
    }
    return self;
}

-(void)imageClicked:(UITapGestureRecognizer*)sender
{
    UIView *temp = sender.view;
    if (self.menuClickedBk) {
        self.menuClickedBk(temp.tag);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
