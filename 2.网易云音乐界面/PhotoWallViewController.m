//
//  PhotoWallViewController.m
//  2.网易云音乐界面
//
//  Created by mac on 2021/7/22.
//  Copyright © 2021 mac. All rights reserved.
//

#import "PhotoWallViewController.h"
#import "ViewControllerOne.h"
@interface PhotoWallViewController ()

@end

@implementation PhotoWallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"照片墙";
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIBarButtonItem* rightButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonItemPress)];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
    _imageNameArray = [[NSMutableArray alloc]init];;
    for (int i = 0; i < 9; i++) {
        NSString* strName = [NSString stringWithFormat:@"headPhoto%d.jpg",i + 1];
        _headPhotoImage = [UIImage imageNamed:strName];
        _headPhotoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString* strNameOne = [NSString stringWithFormat:@"succeedHeadPhoto%d.jpg",i + 1];
        UIImage* headPhotoImageOne = [UIImage imageNamed:strNameOne];
        [_headPhotoButton setImage:_headPhotoImage forState:UIControlStateNormal];
        [_headPhotoButton setImage:headPhotoImageOne forState:UIControlStateSelected];
        _headPhotoButton.frame = CGRectMake(4 + [[UIScreen mainScreen] bounds].size.width / 4 * (i % 4), 10 + [[UIScreen mainScreen] bounds].size.width / 4 * (i / 4), [[UIScreen mainScreen] bounds].size.width / 4 - 8, [[UIScreen mainScreen] bounds].size.width / 4 - 8);
        _headPhotoButton.tag = 10001 + i;
        [_headPhotoButton addTarget:self action:@selector(pressHeadPhoto:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_headPhotoButton];
    }
}


- (void)pressHeadPhoto:(UIButton*)sender {
    if ([sender isSelected] == NO) {
        int selectNumber = (int)(sender.tag - 10000);
        _photoNumber++;
        NSString* selectString = [NSString stringWithFormat:@"headPhoto%d.jpg",selectNumber];
        [_imageNameArray addObject:selectString];
        [sender setSelected:YES];
    } else {
        int selectNumber = (int)(sender.tag - 10000);
        _photoNumber--;
        NSString* selectString = [NSString stringWithFormat:@"headPhoto%d.jpg",selectNumber];
        [_imageNameArray removeObject:selectString];
        [sender setSelected:NO];
    }
}

- (void)rightButtonItemPress {
    if (_photoNumber == 0) {
        UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"警告" message:@"请选择至少 1 张图片" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        }];
        [boomAlert addAction:boomAction];
        [self presentViewController:boomAlert animated:YES completion:nil];
    } else {
        NSString* message = [NSString stringWithFormat:@"修改头像成功 成功上传 %d 张图片!",_photoNumber];
        UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self.navigationController popViewControllerAnimated:YES];
        }];
        [boomAlert addAction:boomAction];
        [self presentViewController:boomAlert animated:YES completion:nil];
        
        NSString* str = _imageNameArray[0];
        [_delegate changeHeadPhoto:str];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
