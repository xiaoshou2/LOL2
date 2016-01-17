//
//  LOLChangeMesVC.h
//  LOL
//
//  Created by feibai on 16/1/16.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLBaseViewController.h"

@interface LOLChangeMesVC : LOLBaseViewController<UITextFieldDelegate,UITextViewDelegate>
{
    UILabel *_placeholderLabel;
    NSInteger res;
    UILabel *numLb;

}
@property (nonatomic,strong)NSString *VCtype;
@property (nonatomic,strong)UITextField *nameTextfield;
@property (nonatomic,strong)UIButton *rightButton;
@property(nonatomic,strong)UITextView *textView;

@end
