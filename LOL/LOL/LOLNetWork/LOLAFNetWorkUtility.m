//
//  LOLAFNetWorkUtility.m
//  LOL
//
//  Created by feibai on 16/1/12.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLAFNetWorkUtility.h"
@implementation LOLAFNetWorkUtility

#pragma mark --- 首页接口  ----

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


#pragma mark --- 发布需求页面接口  ----

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



#pragma mark --- 判断手机号是否被使用接口 ----

+ (void)phoneNumRequestWithParms:(NSDictionary *)params
                    successBlock:(LOLPhoneNumBlock)successBlock
                     failedBlock:(LOLAFFailedBlock)failedBlock {
    
    NSString *str = @"http://127.0.0.1/temp3.json";
    [LOLAFHTTPClient getRequestWithMethod:str params:params successBlock:^(LOLAFHTTPClient *request, id responseObject) {
        
        NSDictionary *dataDict = [responseObject objectForKey:@"code"];
     
        NSMutableArray *dataArray = [NSMutableArray array];
        [dataArray addObject:dataDict];
        
        if (successBlock) {
            successBlock(dataArray);
            
        }
//        if ([dataDict[@"result"] integerValue] == 0) {
//            if (successBlock) {
//                successBlock(dataArray);
//                
//            }
//        }
  
    } failedBlock:^(LOLAFHTTPClient *request, NSError *error) {
        if (failedBlock) {
            failedBlock(error);
        }
        
    }];
    
}

#pragma mark --- 注册接口 ----

+ (void)registerRequestWithParms:(NSDictionary *)params
                    successBlock:(LOLRegisterBlock)successBlock
                     failedBlock:(LOLAFFailedBlock)failedBlock
{
    
    NSString *str = @"http://127.0.0.1/temp3.json";
    [LOLAFHTTPClient getRequestWithMethod:str params:params successBlock:^(LOLAFHTTPClient *request, id responseObject) {
        
        NSDictionary *dataDict = [responseObject objectForKey:@"code"];
        
        
        if (successBlock) {
            successBlock(dataDict);
            
        }
        //        if ([dataDict[@"result"] integerValue] == 0) {
        //            if (successBlock) {
        //                successBlock(dataArray);
        //
        //            }
        //        }
        
    } failedBlock:^(LOLAFHTTPClient *request, NSError *error) {
        if (failedBlock) {
            failedBlock(error);
        }
        
    }];

}

#pragma mark --- 登录接口 ----

+ (void)loginRequestWithParms:(NSDictionary *)params
                 successBlock:(LOLLoginBlock)successBlock
                  failedBlock:(LOLAFFailedBlock)failedBlock
{
    
    NSString *str = @"http://127.0.0.1/temp3.json";
    [LOLAFHTTPClient getRequestWithMethod:str params:params successBlock:^(LOLAFHTTPClient *request, id responseObject) {
        
        NSDictionary *dataDict = [responseObject objectForKey:@"code"];
        
        
        if (successBlock) {
            successBlock(dataDict);
            
        }
        //        if ([dataDict[@"result"] integerValue] == 0) {
        //            if (successBlock) {
        //                successBlock(dataArray);
        //
        //            }
        //        }
        
    } failedBlock:^(LOLAFHTTPClient *request, NSError *error) {
        if (failedBlock) {
            failedBlock(error);
        }
        
    }];
}


#pragma mark --- 登录接口 ----

+ (void)resetPassWordRequestWithParms:(NSDictionary *)params
                 successBlock:(LOLResetPassWordBlock)successBlock
                  failedBlock:(LOLAFFailedBlock)failedBlock
{
    
    NSString *str = @"http://127.0.0.1/temp3.json";
    [LOLAFHTTPClient getRequestWithMethod:str params:params successBlock:^(LOLAFHTTPClient *request, id responseObject) {
        
        NSDictionary *dataDict = [responseObject objectForKey:@"code"];
        
        
        if (successBlock) {
            successBlock(dataDict);
            
        }
        //        if ([dataDict[@"result"] integerValue] == 0) {
        //            if (successBlock) {
        //                successBlock(dataArray);
        //
        //            }
        //        }
        
    } failedBlock:^(LOLAFHTTPClient *request, NSError *error) {
        if (failedBlock) {
            failedBlock(error);
        }
        
    }];
}

@end
