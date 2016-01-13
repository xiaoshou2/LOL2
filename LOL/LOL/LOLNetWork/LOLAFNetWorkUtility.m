//
//  LOLAFNetWorkUtility.m
//  LOL
//
//  Created by feibai on 16/1/12.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLAFNetWorkUtility.h"
@implementation LOLAFNetWorkUtility

/**
 * 首页请求
 */
+ (void)homeViewRequestWithParms:(NSDictionary *)params
                         successBlock:(LOLHomeSuccessBlock)successBlock
                          failedBlock:(LOLAFFailedBlock)failedBlock {
    
    NSString *str =@"http://127.0.0.1/temp.json";
    [LOLAFHTTPClient getRequestWithMethod:str params:params successBlock:^(LOLAFHTTPClient *request, id responseObject) {
        
        NSDictionary *dataDict = [responseObject objectForKey:@"data"];
        NSMutableArray *bannerArr = dataDict[@"banner"];
        NSArray *bigodDataArr = [dataDict objectForKey:@"biglist"];
        NSMutableArray *dataArray = [NSMutableArray array];
        
        
        for (int i = 0;i<bigodDataArr.count;i++) {
            LOLBigGodModel *data = [[LOLBigGodModel alloc] initWithDic:bigodDataArr[i]];
            data.bannerArr = bannerArr;
            [dataArray addObject:data];
        }
        
        if ([dataDict[@"result"] integerValue] == 0) {
            if (successBlock) {
                successBlock(dataArray);

            }
        }
        
        
    } failedBlock:^(LOLAFHTTPClient *request, NSError *error) {
        if (failedBlock) {
            failedBlock(error);
        }
        
    }];
    
}


/**
 * 发布需求页面请求
 */
+ (void)demandRequestWithParms:(NSDictionary *)params
                    successBlock:(LOLDemandSuccessBlock)successBlock
                     failedBlock:(LOLAFFailedBlock)failedBlock {
    
    NSString *str =@"http://127.0.0.1/temp1.json";
    [LOLAFHTTPClient getRequestWithMethod:str params:params successBlock:^(LOLAFHTTPClient *request, id responseObject) {
        
          NSDictionary *dataDict = [responseObject objectForKey:@"data"];
//        NSMutableArray *bannerArr = dataDict[@"banner"];
          NSArray *demandArr = [dataDict objectForKey:@"demandData"];
          NSMutableArray *dataArray = [NSMutableArray array];
    
        for (int i = 0;i<demandArr.count;i++) {
            LOLDemandModel *data = [[LOLDemandModel alloc] initWithDic:demandArr[i]];
            [dataArray addObject:data];
        }
        
        if ([dataDict[@"result"] integerValue] == 0) {
            if (successBlock) {
                successBlock(dataArray);
            }
        }
        
        
    } failedBlock:^(LOLAFHTTPClient *request, NSError *error) {
        if (failedBlock) {
            failedBlock(error);
        }
        
    }];
    
}



@end
