//
//  CellProperty.m
//  HomeViewDemo
//
//  Created by YaoWang on 15/7/23.
//  Copyright (c) 2015年 YiYaoWang. All rights reserved.
//

#import "LOLHomeCellProperty.h"

@implementation LOLHomeCellProperty

- (void) setCellType:(LOLHomeCellStyle)cellType{
    _cellType = cellType;
    [self giveCellHeight:_cellType];
}

- (void) giveCellHeight:(LOLHomeCellStyle) cellType{
    switch (cellType) {
        case LOLHomeCellStyleFloorOne:{
            self.cellHeight = 80;
        }
            break;
        case  LOLHomeCellStyleSpaceOne:{
            self.cellHeight = 40;
        }
            break;
        case LOLHomeCellStyleFloorTwo:{
            self.cellHeight = 200;
        }
            break;
        case LOLHomeCellStyleSpaceSec:{
            self.cellHeight = 15;
        }
            break;
        case LOLHomeCellStyleFloorThree:{
            self.cellHeight = 100;
        }
            break;
        default:
            break;
    }
}

@end
