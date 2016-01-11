//
//  LOLSpaceSecCell.m
//  LOL
//
//  Created by feibai on 16/1/11.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLSpaceSecCell.h"

@implementation LOLSpaceSecCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.hotLb = [[UILabel alloc] initWithFrame:CGRectMake(10,0,60,15)];
        self.hotLb.text = @"热门推荐";
        self.hotLb.font = SYSTEMFONT(14);
        self.hotLb.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.hotLb];
        
    }
    return self;
}

@end
