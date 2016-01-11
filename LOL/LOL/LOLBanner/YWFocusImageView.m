//
//  YWFocusImageView.m
//  YYW
//
//  Created by xingyong on 3/24/15.
//  Copyright (c) 2015 YYW. All rights reserved.
//

#import "YWFocusImageView.h"
//#import "YWHomeData.h"
//#import "YWFocusImageItem.h"
#import <objc/runtime.h>

static NSString *YW_FOCUS_ITEM_ASS_KEY = @"loopScrollview";

static CGFloat SWITCH_FOCUS_PICTURE_INTERVAL = 5.0; //switch interval time

@implementation YWFocusImageView

- (id)initWithFrame:(CGRect)frame delegate:(id<YWFocusImageViewDelegate>)delegate focusImageItems:(YWFocusImageItem *)firstItem, ...
{
    self = [super initWithFrame:frame];
    if (self) {
        NSMutableArray *imageItems = [NSMutableArray array];
        YWFocusImageItem *eachItem = nil;
        va_list argumentList;
        if (firstItem)
        {
            [imageItems addObject: firstItem];
            va_start(argumentList, firstItem);
            while((eachItem = va_arg(argumentList, YWFocusImageItem *)))
            {
                [imageItems addObject: eachItem];
            }
            va_end(argumentList);
        }
        
        objc_setAssociatedObject(self, (__bridge const void *)YW_FOCUS_ITEM_ASS_KEY, imageItems, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        _isAutoPlay = YES;
        [self setupViews];
        
        [self setDelegate:delegate];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame delegate:(id<YWFocusImageViewDelegate>)delegate imageItems:(NSArray *)items isAuto:(BOOL)isAuto
{
    self = [super initWithFrame:frame];
    if (self)
    {
        NSMutableArray *imageItems = [NSMutableArray arrayWithArray:items];
        objc_setAssociatedObject(self, (__bridge const void *)YW_FOCUS_ITEM_ASS_KEY, imageItems, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        _isAutoPlay = isAuto;
        [self setupViews:items];
        
        [self setDelegate:delegate];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame delegate:(id<YWFocusImageViewDelegate>)delegate imageItems:(NSArray *)items
{
    return [self initWithFrame:frame delegate:delegate imageItems:items isAuto:YES];
}

- (void)dealloc
{
    objc_setAssociatedObject(self, (__bridge const void *)YW_FOCUS_ITEM_ASS_KEY, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    _scrollView.delegate = nil;
    
}


#pragma mark - private methods
- (void)setupViews:(NSArray *)items
{
    self.backgroundColor = [UIColor whiteColor];
    NSArray *imageItems = objc_getAssociatedObject(self, (__bridge const void *)YW_FOCUS_ITEM_ASS_KEY);
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.scrollsToTop = NO;
    
 
//    _pageControl = [[SMPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height-20, self.frame.size.width, 14)];
    _pageControl = [[SMPageControl alloc] init];

    _pageControl.userInteractionEnabled = NO;
    [_pageControl setCurrentPageIndicatorImage:[UIImage imageNamed:@"home_dot_s"]];
    [_pageControl setPageIndicatorImage:[UIImage imageNamed:@"home_dot_n"]];
    

    
    [self addSubview:_scrollView];
    [self addSubview:_pageControl];
    

    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    
    
    
    _scrollView.delegate = self;
    
    // single tap gesture recognizer
    UITapGestureRecognizer *tapGestureRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureRecognizer:)];
    tapGestureRecognize.delegate = self;
    tapGestureRecognize.numberOfTapsRequired = 1;
    [_scrollView addGestureRecognizer:tapGestureRecognize];
    
    [self reloadData:imageItems];
    
    //objc_setAssociatedObject(self, (const void *)SG_FOCUS_ITEM_ASS_KEY, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)reloadData:(NSArray *)items{
    NSMutableArray *imageItems = [NSMutableArray arrayWithArray:items];
    objc_setAssociatedObject(self, (__bridge const void *)YW_FOCUS_ITEM_ASS_KEY, imageItems, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [_scrollView.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UIImageView class]]) {
            [obj removeFromSuperview];
        }
    }];
    CGFloat space = 0.;
    CGSize size = CGSizeMake(ScreenWidth, 0);
//    for (int i = 0; i < imageItems.count; i++) {
    for (int i = 0; i < 4; i++) {

    
     //   YWHomeData *homeData = [imageItems objectAtIndex:i];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * _scrollView.frame.size.width+space, space, _scrollView.frame.size.width-space*2, _scrollView.frame.size.height-2*space-size.height)];
        [imageView setContentMode:UIViewContentModeScaleAspectFill];
        //加载图片
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"yw_home_default_btn"]];
         
        
        [_scrollView addSubview:imageView];
        
    }
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * imageItems.count, _scrollView.frame.size.height);
    
    CGFloat pageControlW = (imageItems.count - 2) * 15;
    CGFloat pageControlH = 14;
    CGFloat pageControlX = self.frame.size.width - 20 - pageControlW;    // 20为最右边间距
    CGFloat pageControlY = self.frame.size.height - 20;
    _pageControl.frame = CGRectMake(pageControlX, pageControlY, pageControlW, pageControlH);
//    _pageControl.backgroundColor = [UIColor redColor];
    
    _pageControl.numberOfPages = imageItems.count>1?imageItems.count -2:imageItems.count;
    _pageControl.currentPage = 0;
    [_scrollView setContentOffset:CGPointMake(0, 0) animated:NO] ;
    _isAutoPlay = NO;
    if ([imageItems count]>1)
    {
        _isAutoPlay = YES;
        [_scrollView setContentOffset:CGPointMake(ScreenWidth, 0) animated:NO] ;
        if (_isAutoPlay)
        {
            [self performSelector:@selector(switchFocusImageItems) withObject:nil afterDelay:SWITCH_FOCUS_PICTURE_INTERVAL];
        }
    }

    
}

- (void)switchFocusImageItems
{
    if (_isAutoPlay){
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(switchFocusImageItems) object:nil];
        
        CGFloat targetX = _scrollView.contentOffset.x + _scrollView.frame.size.width;
        NSArray *imageItems = objc_getAssociatedObject(self, (__bridge const void *)YW_FOCUS_ITEM_ASS_KEY);
        targetX = (int)(targetX/ScreenWidth) * ScreenWidth;
        [self moveToTargetPosition:targetX];
        
        if ([imageItems count]>1 )
        {
            [self performSelector:@selector(switchFocusImageItems) withObject:nil afterDelay:SWITCH_FOCUS_PICTURE_INTERVAL];
        }

    }
    
}


- (void)singleTapGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{
    NSLog(@"%s", __FUNCTION__);
    NSArray *imageItems = objc_getAssociatedObject(self, (__bridge const void *)YW_FOCUS_ITEM_ASS_KEY);
    int page = (int)(_scrollView.contentOffset.x / _scrollView.frame.size.width);
    if (page > -1 && page < imageItems.count) {
 
        if ([self.delegate respondsToSelector:@selector(foucusImageFrame:didSelectItem:)]) {
            [self.delegate foucusImageFrame:self didSelectItem:page];
        }
    }
}


- (void)moveToTargetPosition:(CGFloat)targetX
{
    BOOL animated = YES;
    //    NSLog(@"moveToTargetPosition : %f" , targetX);
    [_scrollView setContentOffset:CGPointMake(targetX, 0) animated:animated];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float targetX = scrollView.contentOffset.x;
    NSArray *imageItems = objc_getAssociatedObject(self,  (__bridge const void *)YW_FOCUS_ITEM_ASS_KEY);
    if ([imageItems count]>=3)
    {
        if (targetX >= ScreenWidth * ([imageItems count] -1)) {
            targetX = ScreenWidth;
            [_scrollView setContentOffset:CGPointMake(targetX, 0) animated:NO];
        }
        else if(targetX <= 0)
        {
            targetX = ScreenWidth *([imageItems count]-2);
            [_scrollView setContentOffset:CGPointMake(targetX, 0) animated:NO];
        }
    }
    int page = (_scrollView.contentOffset.x+ScreenWidth/2.0) / ScreenWidth;
    //    NSLog(@"%f %d",_scrollView.contentOffset.x,page);
    if ([imageItems count] > 1)
    {
        page --;
        if (page >= _pageControl.numberOfPages)
        {
            page = 0;
        }else if(page <0)
        {
            page = _pageControl.numberOfPages -1;
        }
    }
    if (page!= _pageControl.currentPage)
    {
        if ([self.delegate respondsToSelector:@selector(foucusImageFrame:currentItem:)])
        {
            [self.delegate foucusImageFrame:self currentItem:page];
        }
    }
    _pageControl.currentPage = page;
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
    {
        CGFloat targetX = _scrollView.contentOffset.x + _scrollView.frame.size.width;
        targetX = (int)(targetX/ScreenWidth) * ScreenWidth;
        [self moveToTargetPosition:targetX];
    }
}


- (void)scrollToIndex:(int)aIndex
{
    NSArray *imageItems = objc_getAssociatedObject(self, (__bridge const void *)YW_FOCUS_ITEM_ASS_KEY);
    if ([imageItems count]>1)
    {
        if (aIndex >= ([imageItems count]-2))
        {
            aIndex = [imageItems count]-3;
        }
        [self moveToTargetPosition:ScreenWidth*(aIndex+1)];
    }else
    {
        [self moveToTargetPosition:0];
    }
    [self scrollViewDidScroll:_scrollView];
    
}




@end
