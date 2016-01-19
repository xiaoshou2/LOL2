//
//  LOLshowModel.h
//  LOL
//
//  Created by mac on 16/1/19.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LOLshowModel : NSObject
@property (nonatomic,strong)NSString *demandID;
@property (nonatomic,strong)NSString *mhearAdress;
@property (nonatomic,strong)NSString *muserName;
@property (nonatomic,strong)NSString *mreleaseTime;
@property (nonatomic,strong)NSString *mcontent;
@property (nonatomic,strong)NSString *mprice;
@property (nonatomic,strong)NSString *mendtime;
- (id)initWithDic:(NSDictionary*)reponseDic;
@end
