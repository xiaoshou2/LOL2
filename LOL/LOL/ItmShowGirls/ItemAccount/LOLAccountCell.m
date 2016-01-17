//
//  LOLAccountCell.m
//  LOL
//
//  Created by feibai on 16/1/16.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLAccountCell.h"

@implementation LOLAccountCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accImge = [[UIImageView alloc] init];
        self.accImge.image = [UIImage imageNamed:@"main_customerservice_ico_arrowgrey"];
        self.accImge.frame = CGRectMake(SCREEN_WIDTH -18,self.frame.size.height/2-4,8,8);
        [self addSubview:self.accImge];
        
        self.lineView = [[UIView alloc] init];
        self.lineView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
        self.lineView.frame = CGRectMake(10,self.frame.size.height-1,ScreenWidth-20, 1);
        [self addSubview:self.lineView];
        
        self.titleLb = [[UILabel alloc] init];
        self.titleLb.frame  = CGRectMake(10,self.height/2,60,18);
        self.titleLb.font = SYSTEMFONT(12);
        self.titleLb.backgroundColor = [UIColor clearColor];
        [self addSubview:self.titleLb];
    
    }
    return self;
}


- (void) drawRect:(CGRect)rect {
    
    self.lineView.frame = CGRectMake(10,self.height-1,ScreenWidth-20, 1);
    self.accImge.frame = CGRectMake(SCREEN_WIDTH -18,self.height/2-4,8,8);
    self.titleLb.frame  = CGRectMake(10,self.height/2-9,60,18);

}
@end
