//
//  LOLShowGirlsViewContorller.h
//  LOL
//
//  Created by feibai on 16/1/7.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLBaseViewController.h"
#import "DWBubbleMenuButton.h"

@interface LOLShowGirlsViewContorller : LOLBaseViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    CGFloat _beginOffsetY; //开始拖动的位置
    BOOL _hideOrShowTopViewProgress; //隐藏或显示顶部view的进度
    BOOL _hideTopView; //顶部view是否隐藏
    
}
@property (nonatomic , strong) UICollectionView * mainCollectionView;
@property (nonatomic,strong) NSMutableArray *tableViewDataSource;
@property (nonatomic, strong)  DWBubbleMenuButton *upMenuView;

@end
