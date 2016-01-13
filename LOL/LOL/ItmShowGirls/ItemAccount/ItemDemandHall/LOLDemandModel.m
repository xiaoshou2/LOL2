//
//  LOLDemandModel.m
//  LOL
//
//  Created by feibai on 16/1/13.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLDemandModel.h"

@implementation LOLDemandModel
- (id)initWithDic:(NSDictionary*)reponseDic{
    if (self = [super init]){
        self.demandID = [reponseDic objectForKey:@"productid"];
        self.mhearAdress = [reponseDic objectForKey:@"productheadimage"];
        self.muserName = [reponseDic objectForKey:@"productName"];
        self.mreleaseTime = [reponseDic objectForKey:@"releasetime"];
        self.mcontent = [reponseDic objectForKey:@"content"];
        self.mprice = [reponseDic objectForKey:@"price"];
        self.mendtime = [reponseDic objectForKey:@"endtime"];
        
    }
    return self;
}
@end
