//
//  LOLSpaceCell.m
//  LOL
//
//  Created by feibai on 16/1/9.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLSpaceCell.h"

@implementation LOLSpaceCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth/2-25,3,52,37)];
        self.titleImageView.image = [UIImage imageNamed:@"mainmenubg.png"];
        [self addSubview:self.titleImageView];
        self.leftLineView = [[UIView alloc] initWithFrame:CGRectMake(10,self.height/2,ScreenWidth/2-40, 1)];
        self.leftLineView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
        //self.leftLineView.backgroundColor = [UIColor yellowColor];
        
        self.rightLineView = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth-10,self.height/2,-(ScreenWidth/2-40), 1)];
        //self.rightLineView.backgroundColor = [UIColor blackColor];
        self.rightLineView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
        [self addSubview:self.rightLineView];
        [self addSubview:self.leftLineView];
        
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
