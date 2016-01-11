//
//  YWFocusImageView.h
//  YYW
//
//  Created by xingyong on 3/24/15.
//  Copyright (c) 2015 YYW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMPageControl.h"

@class YWFocusImageView;
@class YWFocusImageItem;

#pragma mark - YWFocusImageViewDelegate
@protocol YWFocusImageViewDelegate <NSObject>
@optional

- (void)foucusImageFrame:(YWFocusImageView *)imageFrame didSelectItem:(NSInteger)index;

- (void)foucusImageFrame:(YWFocusImageView *)imageFrame currentItem:(NSInteger)index;

@end
@interface YWFocusImageView : UIView <UIGestureRecognizerDelegate, UIScrollViewDelegate>{
     BOOL _isAutoPlay;
    UIScrollView *_scrollView;

    
    SMPageControl *_pageControl;
}

- (id)initWithFrame:(CGRect)frame delegate:(id<YWFocusImageViewDelegate>)delegate imageItems:(NSArray *)items isAuto:(BOOL)isAuto;

- (id)initWithFrame:(CGRect)frame delegate:(id<YWFocusImageViewDelegate>)delegate focusImageItems:(YWFocusImageItem *)items, ... NS_REQUIRES_NIL_TERMINATION;
- (id)initWithFrame:(CGRect)frame delegate:(id<YWFocusImageViewDelegate>)delegate imageItems:(NSArray *)items;
- (void)scrollToIndex:(int)aIndex;

@property (nonatomic, assign) id<YWFocusImageViewDelegate> delegate;

- (void)reloadData:(NSArray *)items;
- (void)setupViews;
- (void)switchFocusImageItems;

@end
