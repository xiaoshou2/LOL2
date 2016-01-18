//
//  LOLChooseTitleCell.m
//  LOL
//
//  Created by feibai on 16/1/18.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLChooseTitleCell.h"

@implementation LOLChooseTitleCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLb = [[UILabel alloc] init];
        self.titleLb.frame = CGRectMake(10,8, 120,20);
        self.titleLb.backgroundColor = [UIColor clearColor];
        [self addSubview:self.titleLb];
    }
    return self;
}
@end
