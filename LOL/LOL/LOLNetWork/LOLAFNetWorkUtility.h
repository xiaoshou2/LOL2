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
#import "LOLshowModel.h"
typedef void(^LOLRegisterBlock)(NSDictionary *resultDict);
typedef void(^LOLLoginBlock)(NSDictionary *resultDict);

typedef void (^LOLAFSuccessBlock)(NSDictionary *resultDict);

typedef void (^LOLAFSuccessIdBlock)(id result);

typedef void (^LOLAFFailedBlock)(NSError *error);

typedef void(^LOLHomeSuccessBlock)(NSArray *resultArray);
typedef void(^LOLDemandSuccessBlock)(NSArray *resultArray);
typedef void(^LOLPhoneNumBlock)(NSArray *resultArray);

typedef void (^LOLResetPassWordBlock)(NSDictionary *resultDict);
typedef void (^LOLshowGirlBlock)(NSMutableArray *resultArr);

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



/**
 *  判断当前手机号是否被注册接口
 *
 *  @param params       参数
 *  @param LOLDemandSuccessBlock 成功回调
 *  @param failedBlock  失败回调
 */

+ (void)phoneNumRequestWithParms:(NSDictionary *)params
                  successBlock:(LOLDemandSuccessBlock)successBlock
                   failedBlock:(LOLAFFailedBlock)failedBlock;


/**
 *  注册接口调用
 *
 *  @param params       参数
 *  @param LOLRegisterBlock 成功回调
 *  @param failedBlock  失败回调
 */

+ (void)registerRequestWithParms:(NSDictionary *)params
                    successBlock:(LOLRegisterBlock)successBlock
                     failedBlock:(LOLAFFailedBlock)failedBlock;


/**
 *  登录接口调用
 *
 *  @param params       参数
 *  @param LOLLoginBlock 成功回调
 *  @param failedBlock  失败回调
 */

+ (void)loginRequestWithParms:(NSDictionary *)params
                    successBlock:(LOLLoginBlock)successBlock
                     failedBlock:(LOLAFFailedBlock)failedBlock;

/**
 *  重置密码接口调用
 *
 *  @param params       参数
 *  @param LOLResetPassWordBlock 成功回调
 *  @param failedBlock  失败回调
 */
+ (void)resetPassWordRequestWithParms:(NSDictionary *)params
                         successBlock:(LOLResetPassWordBlock)successBlock
                          failedBlock:(LOLAFFailedBlock)failedBlock;

/**
 *  妹子秀接口调用
 *
 *  @param params       参数
 *  @param LOLDemandSuccessBlock 成功回调
 *  @param failedBlock  失败回调
 */
+ (void)showGirlBlockRequestWithParms:(NSDictionary *)params
                         successBlock:(LOLshowGirlBlock)successBlock
                          failedBlock:(LOLAFFailedBlock)failedBlock;
@end

