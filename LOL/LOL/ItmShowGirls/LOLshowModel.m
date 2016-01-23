//
//  LOLshowModel.m
//  LOL
//
//  Created by mac on 16/1/19.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLshowModel.h"

@implementation LOLshowModel
- (id)initWithDic:(NSDictionary*)reponseDic{
    if (self = [super init]){
        self.teamID = [reponseDic objectForKey:@"teamID"];
        self.gameSever = [reponseDic objectForKey:@"gameSever"];
        self.gameID = [reponseDic objectForKey:@"gameID"];
        self.imgStr = [reponseDic objectForKey:@"headImage"];
        self.gameDan = [reponseDic objectForKey:@"gameDan"];
        self.sign = [reponseDic objectForKey:@"sign"];
        self.zanNum = [reponseDic objectForKey:@"zanNum"];
        
    }
    return self;
}
@end
