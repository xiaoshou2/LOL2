//
//  LOLBaseViewController.h
//  LOL
//
//  Created by feibai on 16/1/6.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum  {
    YWBasePushType    , //直接压栈
    YWBasePresentType
    
}YWBaseLoadType;
@interface LOLBaseViewController : UIViewController
@property (nonatomic,strong) UILabel  *titleLabel;
@property (nonatomic,strong) UIButton *backButton;
@property (nonatomic,strong) UIView   *titleView;
/** 视图控制器加载类型 */
@property (nonatomic,assign) YWBaseLoadType loadType;
- (void)onButtonActionBack:(id)sender;

@end
