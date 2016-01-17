//
//  LOLUserMessageVC.m
//  LOL
//
//  Created by feibai on 16/1/15.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLUserMessageVC.h"
#import "LOLAccountCell.h"
#define CHANGE_NAME @"修改昵称"
#define CHANGE_SIGN @"修改签名"
#define CHange_PHONE @"修改电话"
#define CHANGE_PASSWORD @"修改密码"
@implementation LOLUserMessageVC
-(void)viewDidLoad
{
    [super viewDidLoad];
     self.title = @"个人信息";
    [self setupMainView];
    self.tableViewDataSource = [NSMutableArray arrayWithObjects:@"",@"头像",@"昵称",@"性别",@"等级",@"个人签名",@"电话",@"修改密码", nil];
    changImg = NO;
}

-(void)setupMainView
{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,64, ScreenWidth, ScreenHeight - (64)) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
    [self.view addSubview:self.tableView];
    
    self.exitBtn = [[UIButton alloc]init];
    self.exitBtn.frame = CGRectMake(SCREEN_WIDTH/2-60,SCREEN_HEIGHT-185 ,120, 35);
    self.exitBtn.backgroundColor = [UIColor redColor];
    [self.tableView addSubview:self.exitBtn];
    [self.exitBtn addTarget:self action:@selector(exitLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:self.exitBtn];
}

-(void)exitLogin
{
    NSLog(@"退出登录");
}

#pragma mark - tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableViewDataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *CellWithIdentifier = @"Cell";
   
    if (indexPath.row == 0) {
        UITableViewCell *spaceCell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
        spaceCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (spaceCell == nil) {
            spaceCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
        }
        spaceCell.selectionStyle = UITableViewCellSelectionStyleNone;

        UIView *spaceView = [[UIView alloc] initWithFrame:CGRectMake(0,0, ScreenWidth, 20)];
        spaceView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
        [spaceCell addSubview:spaceView];
        
        return spaceCell;
    }
    else {
        LOLAccountCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
        
        if (cell == nil) {
            cell = [[LOLAccountCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        if(indexPath.row == 1){//头像
            self.headimage = [[UIImageView alloc] init];
            self.headimage.image = [UIImage imageNamed:@"h2x_i_02"];
            self.headimage.frame = CGRectMake(SCREEN_WIDTH-70,5,44,44);
            self.headimage.layer.masksToBounds =YES;
            self.headimage.layer.cornerRadius =44/2;
            [cell addSubview:self.headimage];
        }else if(indexPath.row == 2){
            UILabel *nameLbel = [[UILabel alloc] init];
            nameLbel.frame  = CGRectMake(SCREEN_WIDTH-123,10,100,18);
            nameLbel.font = SYSTEMFONT(13);
            nameLbel.textAlignment = NSTextAlignmentRight;
            nameLbel.text = @"无敌大战神";
            nameLbel.backgroundColor = [UIColor clearColor];
            [cell addSubview:nameLbel];
        }else if(indexPath.row == 3){
            UILabel *sexLabel = [[UILabel alloc] init];
            sexLabel.frame  = CGRectMake(SCREEN_WIDTH-65,10,40,18);
            sexLabel.font = SYSTEMFONT(13);
            sexLabel.textAlignment = NSTextAlignmentRight;
            sexLabel.text = @"男";
            sexLabel.backgroundColor = [UIColor clearColor];
            [cell addSubview:sexLabel];
        }else if(indexPath.row == 4){
            UILabel *typeLB = [[UILabel alloc] init];
            typeLB.frame  = CGRectMake(SCREEN_WIDTH-90,10,65,18);
            typeLB.font = SYSTEMFONT(13);
            typeLB.textAlignment = NSTextAlignmentRight;
            typeLB.text = @"金牌打手";
            typeLB.backgroundColor = [UIColor clearColor];
            [cell addSubview:typeLB];
        }else if(indexPath.row == 5){
            UILabel *sigleLb = [[UILabel alloc] init];
            sigleLb.frame  = CGRectMake(SCREEN_WIDTH-175,10,150,18);
            sigleLb.font = SYSTEMFONT(13);
            sigleLb.textAlignment = NSTextAlignmentRight;
            sigleLb.text = @"和最烈的酒，日最野的狗";
            sigleLb.backgroundColor = [UIColor clearColor];
            [cell addSubview:sigleLb];
        }else if(indexPath.row == 6){
            UILabel *sigleLb = [[UILabel alloc] init];
            sigleLb.frame  = CGRectMake(SCREEN_WIDTH-120,10,100,18);
            sigleLb.font = SYSTEMFONT(13);
            sigleLb.textAlignment = NSTextAlignmentRight;
            sigleLb.text = @"13067891234";
            sigleLb.backgroundColor = [UIColor clearColor];
            [cell addSubview:sigleLb];
        }
        
        
        cell.titleLb.text = self.tableViewDataSource[indexPath.row];

        return cell;
    }

    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@" ---  %ld ----",(long)indexPath.row);
    switch (indexPath.row) {
        case 1:
            [self head_img_clicked];
            break;
        case 2:
            [self pushChangeMseVC:CHANGE_NAME];
            break;
        case 3:
            [self changeSex];
            break;
        case 4:
            
            break;
        case 5:
            [self pushChangeMseVC:CHANGE_SIGN];
            break;
        case 6:
            [self pushChangeMseVC:CHange_PHONE];
            break;
        case 7:
            [self pushChangeMseVC:CHANGE_PASSWORD];
            break;
        default:
            break;
    }
}

-(void)changeSex
{
    
}
-(void)pushChangeMseVC:(NSString *)temp
{
    LOLChangeMesVC *changeMesVC = [[LOLChangeMesVC alloc] init];
    changeMesVC.VCtype = temp;
    [[SharedDelegate getRootNav]pushViewController:changeMesVC animated:YES];
}
//头像点击
-(void)head_img_clicked
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"选择头像"
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"拍照", @"从相册选择",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    
    [actionSheet showInView:self.view];
    
    
}

#pragma Mark alertView代理
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==0){
        [self fromCamera];
    }else if(buttonIndex==1){
        [self fromPhotos];
    }else if(buttonIndex==2){
        
    }
}

//从相册中选择
-(void) fromPhotos
{
    //初始化UIImagePickerController 指定代理
    UIImagePickerController * imagePicker = [[UIImagePickerController alloc] init];
    //选择类型相机，相册还是什么
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    imagePicker.delegate = self;
    //允许编辑
    imagePicker.allowsEditing = YES;
    
    imagePicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    //显示相册
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

//保存图片
- (void)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName
{
    NSData* imageData = UIImagePNGRepresentation(tempImage);
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDirectory = [paths objectAtIndex:0];
    // Now we get the full path to the file
    NSString* fullPathToFile = [documentsDirectory stringByAppendingPathComponent:imageName];
    // and then we write it out
    [imageData writeToFile:fullPathToFile atomically:NO];
    
}

// 打开相机
-(void) fromCamera {
    
    BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    if (!isCamera) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"设备不可用" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    self.mypicker = [[UIImagePickerController alloc] init];
    self.mypicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.mypicker.delegate = self;
    // 编辑模式
    self.mypicker.allowsEditing = YES;
    [self  presentViewController:self.mypicker animated:YES completion:^{
    }];
    
    
}

// 选中照片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    
    changImg = YES;
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    [self saveImage:image withName:@"hearImg.png"];
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"hearImg.png"];
    
    UIImage *savedImage44 = [[UIImage alloc] initWithContentsOfFile:fullPath];
    
    
    _headimage.image = savedImage44;
    
    
}

#pragma mark - 保存图片至沙盒
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    // 获取沙盒目录
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    
    // 将图片写入文件
    
    [imageData writeToFile:fullPath atomically:NO];
}


//压缩图片
+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}



// 取消相册
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    if (indexPath.row == 0) {
        return 20;
    }else if(indexPath.row == 1){
        return 60;
    }else
        return 40;

}
@end
