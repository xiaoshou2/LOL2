//
//  LOLAFHTTPClient.m
//  LOL
//
//  Created by feibai on 16/1/12.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLAFHTTPClient.h"

@implementation LOLAFHTTPClient
+ (LOLAFHTTPClient *)postRequestWithMethod:(NSString *)method
                                   params:(NSDictionary *)params
                             successBlock:(HTTPRequestSuccessBlock)successReqBlock
                              failedBlock:(HTTPRequestFailedBlock)failedReqBlock{
    
    return [self requestWithMethod:method params:params httpMethod:LOLHttpMethodPost successBlock:successReqBlock failedBlock:failedReqBlock];
}

+ (LOLAFHTTPClient *)getRequestWithMethod:(NSString *)method
                                  params:(NSDictionary *)params
                            successBlock:(HTTPRequestSuccessBlock)successReqBlock
                             failedBlock:(HTTPRequestFailedBlock)failedReqBlock{
    
    return [self requestWithMethod:method params:params httpMethod:LOLHttpMethodGet successBlock:successReqBlock failedBlock:failedReqBlock];
}



+ (LOLAFHTTPClient *)requestWithMethod:(NSString *)method
                               params:(NSDictionary *)params
                           httpMethod:(YWHttpMethod)httpMethod
                         successBlock:(HTTPRequestSuccessBlock)successReqBlock
                          failedBlock:(HTTPRequestFailedBlock)failedReqBlock{
    
    LOLAFHTTPClient *httpV2 =  [[LOLAFHTTPClient alloc] init];
    NSString * requestUrl = [NSString stringWithFormat:@"%@",method];
//    NSDictionary *requestParams = [YWActionUtility getRequestAllDict:params];
    NSDictionary *requestParams = [NSDictionary new];

        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval = 30.;
       // manager.responseSerializer = [AFHTTPResponseSerializer serializer];
     //  manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
        if (httpMethod == LOLHttpMethodGet) {
            
            [manager GET:requestUrl parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
                
                
                [httpV2 print_ios7_Response:responseObject withURL:task.currentRequest.URL withRequestParams:requestParams];
                if (successReqBlock) {
                    successReqBlock(httpV2, responseObject);
                }
                    
                
            } failure:^(NSURLSessionTask *operation, NSError *error) {
                NSLog(@"Error: %@", error);
                
                if (failedReqBlock) {
                    failedReqBlock(httpV2, error);
                }
                
                
            }];
//            
  
        }else if (httpMethod == LOLHttpMethodPost){
            
            
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            [manager POST:requestUrl parameters:requestParams progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                [httpV2 print_ios7_Response:responseObject withURL:task.currentRequest.URL withRequestParams:requestParams];
                if (successReqBlock) {
                    successReqBlock(httpV2, responseObject);
                }
                
            }
                  failure:^(NSURLSessionDataTask *task, NSError *error) {
                      if (failedReqBlock) {
                          failedReqBlock(httpV2, error);
                      }
                  }];
            
            
        }else if (httpMethod == LOLHttpMethodGet){
            
            [manager DELETE:requestUrl parameters:requestParams success:^(NSURLSessionDataTask *task, id responseObject) {
                [httpV2 print_ios7_Response:responseObject withURL:task.currentRequest.URL withRequestParams:requestParams];
                if (successReqBlock) {
                    successReqBlock(httpV2, responseObject);
                }
                
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                if (failedReqBlock) {
                    failedReqBlock(httpV2, error);
                }
            }];
            
            
        
        
    }
    
    return httpV2;
}



//- (void)printResponse:(AFHTTPRequestOperation *)requestOperation withRequestParams:(NSDictionary *)params
//{
//#ifdef DEBUG
//    id responseObj =requestOperation.responseObject;
//    
//    [self print_ios7_Response:responseObj withURL:requestOperation.request.URL withRequestParams:params];
//#endif
//}

- (void)print_ios7_Response:(id)responseObj withURL:(NSURL *)url withRequestParams:(NSDictionary *)params
{
    
#ifdef DEBUG
    if (responseObj && [responseObj isKindOfClass:[NSDictionary class]]) {
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:responseObj options:NSJSONWritingPrettyPrinted error:&error];
        if (error){

         
            
        }else{
            NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
//            DLogDebug(@"---xxxx-----response----xxxx----- :"
//                      "\n URL %@"
//                      "\n responseString:%@",url,string);
            }
        
    }else{
        
    }
    
#endif
}



+(void)cancelAllOperations{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.operationQueue cancelAllOperations];
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone
{
    LOLAFHTTPClient  *clientV2 = [[self class] init];
    [clientV2 setUserInfo:[[self userInfo] copyWithZone:zone]];
    return clientV2;
}

@end
