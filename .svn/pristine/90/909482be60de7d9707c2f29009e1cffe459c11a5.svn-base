//
//  YWSpritesLoadingView.m
//  YYW
//
//  Created by xingyong on 12/11/14.
//  Copyright (c) 2014 YYW. All rights reserved.
//

#import "YWSpritesLoadingView.h"

@implementation YWSpritesLoadingView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        _loadingImageView=[[UIImageView alloc] initWithFrame:self.bounds];
 
        _loadingImageView.layer.zPosition = MAXFLOAT;
        NSMutableArray *imageArray = [NSMutableArray arrayWithCapacity:8];
        [imageArray addObject:[UIImage imageNamed:@"yw_load1.png"]];
        [imageArray addObject:[UIImage imageNamed:@"yw_load2.png"]];
        [imageArray addObject:[UIImage imageNamed:@"yw_load3.png"]];
        [imageArray addObject:[UIImage imageNamed:@"yw_load4.png"]];
        [imageArray addObject:[UIImage imageNamed:@"yw_load5.png"]];
        [imageArray addObject:[UIImage imageNamed:@"yw_load6.png"]];
        [imageArray addObject:[UIImage imageNamed:@"yw_load7.png"]];
        [imageArray addObject:[UIImage imageNamed:@"yw_load8.png"]];
        _loadingImageView.animationImages = imageArray;
        _loadingImageView.animationDuration = 0.7;
        [_loadingImageView startAnimating];

        [self addSubview:_loadingImageView];
        
        
    }
    return self;
}

- (void)dealloc{
    [_loadingImageView stopAnimating];
    [_loadingImageView removeFromSuperview];
    _loadingImageView = nil;

}

 
@end
