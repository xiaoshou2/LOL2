//
//  LOLBigGodModel.h
//  LOL
//
//  Created by feibai on 16/1/12.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LOLBigGodModel : NSObject
@property (nonatomic,strong)NSString *mUserID;
@property (nonatomic,strong)NSString *mBGheadImageAdress;
@property (nonatomic,strong)NSString *mBGuserName;
@property (nonatomic,strong)NSString *mUserSex;
@property (nonatomic,strong)NSString *mUserDuanWei;
@property (nonatomic,strong)NSString *mUserGoodat;
@property (nonatomic,strong)NSString *mUserIntroduce;
@property (nonatomic,strong)NSString *mUserShenglv;
@property (nonatomic,strong)NSMutableArray *bannerArr;
-(id)initWithDic:(NSDictionary *)responseDic;

@end
