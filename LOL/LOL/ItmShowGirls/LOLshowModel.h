//
//  LOLshowModel.h
//  LOL
//
//  Created by mac on 16/1/19.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LOLshowModel : NSObject
@property (nonatomic,strong)NSString *teamID;
@property (nonatomic,strong)NSString *gameSever;
@property (nonatomic,strong)NSString *gameID;
@property (nonatomic,strong)NSString *imgStr;
@property (nonatomic,strong)NSString *gameDan;
@property (nonatomic,strong)NSString *sign;
@property (nonatomic,strong)NSString *zanNum;
- (id)initWithDic:(NSDictionary*)reponseDic;
@end
