//
//  LOLAFNetWorkUtility.h
//  LOL
//
//  Created by feibai on 16/1/12.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LOLBigGodModel.h"
#import "LOLDemandModel.h"
typedef void (^LOLAFSuccessBlock)(NSDictionary *resultDict);

typedef void (^LOLAFSuccessIdBlock)(id result);

typedef void (^LOLAFFailedBlock)(NSError *error);

typedef void(^LOLHomeSuccessBlock)(NSArray *resultArray);
typedef void(^LOLDemandSuccessBlock)(NSArray *resultArray);


@interface LOLAFNetWorkUtility : NSObject
/**
 *  首页请求
 *
 *  @param params       参数
 *  @param LOLHomeSuccessBlock 成功回调
 *  @param failedBlock  失败回调
 */

+ (void)homeViewRequestWithParms:(NSDictionary *)params
                         successBlock:(LOLHomeSuccessBlock)successBlock
                          failedBlock:(LOLAFFailedBlock)failedBlock;


/**
 *  需求大厅页请求
 *
 *  @param params       参数
 *  @param LOLDemandSuccessBlock 成功回调
 *  @param failedBlock  失败回调
 */

+ (void)demandRequestWithParms:(NSDictionary *)params
                    successBlock:(LOLDemandSuccessBlock)successBlock
                     failedBlock:(LOLAFFailedBlock)failedBlock;
@end
