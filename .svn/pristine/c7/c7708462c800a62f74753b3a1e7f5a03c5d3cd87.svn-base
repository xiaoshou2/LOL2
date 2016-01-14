//
//  LOLAFHTTPClient.h
//  LOL
//
//  Created by feibai on 16/1/12.
//  Copyright © 2016年 feibai. All rights reserved.
//




#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"
typedef enum : NSUInteger {
    LOLHttpMethodGet = 1,
    LOLHttpMethodPost  ,
    LOLHttpMethodDelete,
} YWHttpMethod;

@class LOLAFHTTPClient;

typedef void (^HTTPRequestSuccessBlock)(LOLAFHTTPClient *request, id responseObject);
typedef void (^HTTPRequestFailedBlock)(LOLAFHTTPClient *request, NSError *error);


@interface LOLAFHTTPClient : NSObject<NSCopying>

@property (nonatomic, strong) NSDictionary *userInfo;


+ (LOLAFHTTPClient *)postRequestWithMethod:(NSString *)method
                                   params:(NSDictionary *)params
                             successBlock:(HTTPRequestSuccessBlock)successReqBlock
                              failedBlock:(HTTPRequestFailedBlock)failedReqBlock;

+ (LOLAFHTTPClient *)getRequestWithMethod:(NSString *)method
                                  params:(NSDictionary *)params
                            successBlock:(HTTPRequestSuccessBlock)successReqBlock
                             failedBlock:(HTTPRequestFailedBlock)failedReqBlock;

+ (LOLAFHTTPClient *)requestWithMethod:(NSString *)method
                               params:(NSDictionary *)params
                           httpMethod:(YWHttpMethod)httpMethod
                         successBlock:(HTTPRequestSuccessBlock)successReqBlock
                          failedBlock:(HTTPRequestFailedBlock)failedReqBlock;

+(void)cancelAllOperations;

@end