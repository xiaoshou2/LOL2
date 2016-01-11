//
//  CellProperty.h
//  HomeViewDemo
//
//  Created by YaoWang on 15/7/23.
//  Copyright (c) 2015年 YiYaoWang. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "YWHomeProduct.h"
#import <UIKit/UIKit.h>
typedef NS_OPTIONS(NSUInteger, LOLHomeCellStyle) {
    LOLHomeCellStyleFloorOne = 0,//menu
    LOLHomeCellStyleSpaceOne ,//空隙
    LOLHomeCellStyleFloorTwo ,//大咖
    LOLHomeCellStyleSpaceSec ,//空隙
    LOLHomeCellStyleFloorThree,//大咖List
//    LOLHomeCellStyle11NewFloor,//1.11新楼层
//    LOLHomeCellStyleFloorTitle,//楼层标题
//    LOLHomeCellStyleMenu,//菜单
//    LOLHomeCellStyleClearance,//间隙
//    LOLHomeCellStyleProductTitle,//单品推荐的头部
//    LOLHomeCellStyleProductItem//单品推荐item
};
@interface LOLHomeCellProperty : NSObject

@property(nonatomic,assign) float cellHeight;

@property(nonatomic,assign) LOLHomeCellStyle cellType;

@property(nonatomic,strong) UIColor *cellColor;

@property(nonatomic,strong) NSArray *cellData;//菜单item 数据

@property(nonatomic,strong) NSArray *floorData;//楼层数据

@property(nonatomic,copy) NSString *floorTitle;//楼层标题

@property(nonatomic,strong) NSArray *themeProducts;//主题推荐的商品

@property(nonatomic,strong) NSString *recommenName;//单品推荐头部名称

@property(nonatomic,strong) NSString *recommenEnglishName;//单品推荐头部英文名称

//@property(nonatomic,strong) YWHomeProduct *fistProduct;

//@property(nonatomic,strong) YWHomeProduct *lastProduct;

@property(nonatomic,assign) BOOL isHiddenLine;//是否隐藏间隙cell的线
@end
