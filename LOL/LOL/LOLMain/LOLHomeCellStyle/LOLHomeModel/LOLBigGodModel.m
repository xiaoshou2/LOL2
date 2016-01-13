//
//  LOLBigGodModel.m
//  LOL
//
//  Created by feibai on 16/1/12.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLBigGodModel.h"

@implementation LOLBigGodModel
//- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
//    
//    NSLog(@"没有找到该属性:%@",key);
//    
//    
//}
//
//- (instancetype)initWithJSON:(NSDictionary *)json{
//    self = [super init];
//    
//    if (self) {
////        _type = json[@"type"];
////        
////        _key = json[@"key"];
////        
////        _parm = json[@"parm"];
//    }
//    
//    return self;
//}
- (id)initWithDic:(NSDictionary*)reponseDic{
    if (self = [super init]){
        
        self.mBGuserName = [reponseDic objectForKey:@"productName"];
        self.mUserID = [reponseDic objectForKey:@"productid"];
        self.mUserSex = [reponseDic objectForKey:@"productsex"];
        self.mUserDuanWei = [reponseDic objectForKey:@"productduanwei"];
        self.mUserGoodat = [reponseDic objectForKey:@"productgoodat"];
        self.mUserIntroduce = [reponseDic objectForKey:@"productIntroduce"];
        self.mBGheadImageAdress = [reponseDic objectForKey:@"productheadimage"];
       // self.bannerArr = [NSMutableArray new];
        NSLog(@"mBGuserName --- %@",self.mBGuserName);

//        self.msubOrderId    = strOrEmpty([reponseDic safeObjectForKey:@"subOrderId"]);
//        self.mremindType    = [strOrEmpty([reponseDic safeObjectForKey:@"remindType"]) integerValue];
//        self.mproductName   = strOrEmpty([reponseDic safeObjectForKey:@"productName"]);
//        self.mproductId     = strOrEmpty([reponseDic safeObjectForKey:@"productId"]);
//        self.messageId      = [strOrEmpty([reponseDic safeObjectForKey:@"messageId"]) integerValue];
//        self.mcondition = [reponseDic safeObjectForKey:@"condition"];
//        self.mtitle = [reponseDic safeObjectForKey:@"title"];
//        self.mproductDetails = [reponseDic safeObjectForKey:@"productDetails"];
//        self.mproductSearch = [reponseDic safeObjectForKey:@"productSearch"];
//        self.mproductList = [reponseDic safeObjectForKey:@"productList"];
//        // self.mtaskId        = [reponseDic safeObjectForKey:@"taskId"];//zy修改
    }
    return self;
}
@end
