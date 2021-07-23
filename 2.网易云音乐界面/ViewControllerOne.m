//
//  ViewControllerOne.m
//  2.网易云音乐界面
//
//  Created by mac on 2021/7/18.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewControllerOne.h"
#import "FirstTableViewCell.h"
#import "DownloadViewController.h"
#import "PhotoWallViewController.h"
@interface ViewControllerOne ()

@end

@implementation ViewControllerOne
@synthesize firstScrollViewOne = firstScrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建UITableView
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 85) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _arrayData = @[@[@" "], @[@"我的音乐"], @[@"最近播放"]];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon29.png"] style:UIBarButtonItemStylePlain target:self action:@selector(downloadPressNext)];
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    
    UIImage *rightImage = [[UIImage imageNamed:@"icon28.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *btnRight=[[UIBarButtonItem alloc] initWithImage:rightImage style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = btnRight;
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationItem.title = @" ";
    
    
    [_tableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"first"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 2;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 230;
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return 60;
        } else {
            return 180;
        }
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            return 60;
        } else {
            return 100;
        }
    } else {
        if (indexPath.row == 0) {
            return 60;
        } else {
            return 100;
        }
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 2 && indexPath.row == 1) {
        FirstTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"first" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    if (indexPath.section == 0) {
        _cell.selectionStyle = UITableViewCellSelectionStyleNone;
        _cell.backgroundColor = [UIColor blackColor];
        _buttonMain = [UIButton buttonWithType:UIButtonTypeSystem];
        _buttonMain.frame = CGRectMake(5, 15, 80, 80);
        _buttonMain.backgroundColor = [UIColor clearColor];
        if (_imageMain == NULL) {
            _imageMain = [UIImage imageNamed:@"icon27.png"];
        }
        [_buttonMain setImage:[_imageMain imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [_buttonMain.layer setMasksToBounds:YES];
        [_buttonMain.layer setCornerRadius:40.0];
        [_cell addSubview:_buttonMain];
        [_buttonMain addTarget:self action:@selector(photoWallPress) forControlEvents:UIControlEventTouchUpInside];
        [_cell addSubview:_buttonMain];
        
        UIButton* btnName = [UIButton buttonWithType:UIButtonTypeSystem];
        btnName.frame = CGRectMake(90, 23, 150, 30);
        btnName.backgroundColor = [UIColor clearColor];
        [btnName setTitle:@"网抑云emo🤮" forState:UIControlStateNormal];
        btnName.titleLabel.font = [UIFont systemFontOfSize:22];
        [btnName setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_cell addSubview:btnName];
        
        UIButton* buttonVIP = [UIButton buttonWithType:UIButtonTypeSystem];
        buttonVIP.frame = CGRectMake(90, 65, 70, 20);
        buttonVIP.backgroundColor = [UIColor darkGrayColor];
        [buttonVIP setTitle:@"黑胶VIP" forState:UIControlStateNormal];
        buttonVIP.titleLabel.font = [UIFont systemFontOfSize:13];
        [buttonVIP setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        //按钮设置为圆角
        [buttonVIP.layer setMasksToBounds:YES];
        [buttonVIP.layer setCornerRadius:10.0];
        [_cell addSubview:buttonVIP];
        
        UIButton* buttonLevel = [UIButton buttonWithType:UIButtonTypeSystem];
        buttonLevel.frame = CGRectMake(170, 65, 40, 20);
        buttonLevel.backgroundColor = [UIColor grayColor];
        [buttonLevel setTitle:@"Lv.7" forState:UIControlStateNormal];
        buttonLevel.titleLabel.font = [UIFont systemFontOfSize:14];
        [buttonLevel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //按钮设置为圆角
        [buttonLevel.layer setMasksToBounds:YES];
        [buttonLevel.layer setCornerRadius:10.0];
        [_cell addSubview:buttonLevel];
        
        UIButton* buttonBeVIP = [UIButton buttonWithType:UIButtonTypeSystem];
        buttonBeVIP.frame = CGRectMake(300, 25, 100, 28);
        buttonBeVIP.backgroundColor = [UIColor clearColor];
        [buttonBeVIP setTitle:@"开通黑胶VIP >" forState:UIControlStateNormal];
        buttonBeVIP.titleLabel.font = [UIFont systemFontOfSize:13];
        [buttonBeVIP setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_cell addSubview:buttonBeVIP];
        
        //设置logoBtn
        float wid = [UIScreen mainScreen].bounds.size.width / 4;
        UIButton* btnOne = [UIButton buttonWithType:UIButtonTypeSystem];
        btnOne.frame = CGRectMake(0, 120, wid, wid);
        btnOne.backgroundColor = [UIColor clearColor];
        [btnOne setTitle:@"本地音乐" forState:UIControlStateNormal];
        [btnOne setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //btnOne.titleLabel.frame.origin.y = 50;
        [btnOne setImage:[UIImage imageNamed:@"icon30.png"] forState:UIControlStateNormal];
        [btnOne setTintColor:[UIColor whiteColor]];
        btnOne.imageEdgeInsets = UIEdgeInsetsMake(-btnOne.titleLabel.intrinsicContentSize.height - 5, 0, 0, -btnOne.titleLabel.intrinsicContentSize.width);
        btnOne.titleEdgeInsets = UIEdgeInsetsMake(btnOne.currentImage.size.height + 24, -btnOne.currentImage.size.width, 0, 0);
        //btnOne.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_cell addSubview:btnOne];
        
        UIButton* btnTwo = [UIButton buttonWithType:UIButtonTypeSystem];
        btnTwo.frame = CGRectMake(wid, 120, wid, wid);
        btnTwo.backgroundColor = [UIColor clearColor];
        [btnTwo setTitle:@"我的电台" forState:UIControlStateNormal];
        [btnTwo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btnTwo setImage:[UIImage imageNamed:@"icon31.png"] forState:UIControlStateNormal];
        [btnTwo setTintColor:[UIColor whiteColor]];
        btnTwo.imageEdgeInsets = UIEdgeInsetsMake(-btnTwo.titleLabel.intrinsicContentSize.height - 5, 0, 0, -btnTwo.titleLabel.intrinsicContentSize.width);
        btnTwo.titleEdgeInsets = UIEdgeInsetsMake(btnTwo.currentImage.size.height + 22, -btnTwo.currentImage.size.width, 0, 0);
        //btnOne.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_cell addSubview:btnTwo];
        
        UIButton* btnThree = [UIButton buttonWithType:UIButtonTypeSystem];
        btnThree.frame = CGRectMake(wid * 2, 120, wid, wid);
        btnThree.backgroundColor = [UIColor clearColor];
        [btnThree setTitle:@"我的收藏" forState:UIControlStateNormal];
        [btnThree setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btnThree setImage:[UIImage imageNamed:@"icon32.png"] forState:UIControlStateNormal];
        [btnThree setTintColor:[UIColor whiteColor]];
        btnThree.imageEdgeInsets = UIEdgeInsetsMake(-btnThree.titleLabel.intrinsicContentSize.height - 5, 0, 0, -btnThree.titleLabel.intrinsicContentSize.width);
        btnThree.titleEdgeInsets = UIEdgeInsetsMake(btnThree.currentImage.size.height + 25, -btnThree.currentImage.size.width, 0, 0);
        //btnOne.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_cell addSubview:btnThree];
        
        UIButton* btnFour = [UIButton buttonWithType:UIButtonTypeSystem];
        btnFour.frame = CGRectMake(wid * 3, 120, wid, wid);
        btnFour.backgroundColor = [UIColor clearColor];
        [btnFour setTitle:@"关注新歌" forState:UIControlStateNormal];
        [btnFour setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btnFour setImage:[UIImage imageNamed:@"icon33.png"] forState:UIControlStateNormal];
        [btnFour setTintColor:[UIColor whiteColor]];
        btnFour.imageEdgeInsets = UIEdgeInsetsMake(-btnFour.titleLabel.intrinsicContentSize.height - 5, 0, 0, -btnFour.titleLabel.intrinsicContentSize.width);
        btnFour.titleEdgeInsets = UIEdgeInsetsMake(btnFour.currentImage.size.height + 14, -btnFour.currentImage.size.width, 0, 0);
        [_cell addSubview:btnFour];
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            _cell.textLabel.text = _arrayData[indexPath.section][indexPath.row];
            _cell.textLabel.font = [UIFont systemFontOfSize:18];
            _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            _cell.detailTextLabel.text = @"✈";
        } else {
            _cell.selectionStyle = UITableViewCellSelectionStyleNone;
            float widTwo = [UIScreen mainScreen].bounds.size.width / 3;
            UIButton* pictureOne = [UIButton buttonWithType:UIButtonTypeCustom];
            pictureOne.frame = CGRectMake(5, 0, widTwo - 10, (widTwo - 10) / 3 * 4);
            UIImage *imagePictureOne = [[UIImage imageNamed:@"pic1.jpg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            [pictureOne setImage:imagePictureOne forState:UIControlStateNormal];
            [pictureOne.layer setMasksToBounds:YES];
            [pictureOne.layer setCornerRadius:14.0];
            [_cell addSubview:pictureOne];
            //心动模式
            UIButton* buttonHeart = [UIButton buttonWithType:UIButtonTypeSystem];
            buttonHeart.frame = CGRectMake(25, 140, 90, 24);
            buttonHeart.backgroundColor = [UIColor darkGrayColor];
            [buttonHeart setTitle:@"💗 心动模式" forState:UIControlStateNormal];
            buttonHeart.titleLabel.font = [UIFont systemFontOfSize:14];
            [buttonHeart setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            //按钮设置为圆角
            [buttonHeart.layer setMasksToBounds:YES];
            [buttonHeart.layer setCornerRadius:10.0];
            [_cell addSubview:buttonHeart];
            

            UIButton* pictureTwo = [UIButton buttonWithType:UIButtonTypeCustom];
            pictureTwo.frame = CGRectMake(widTwo + 5, 0, widTwo - 10, (widTwo - 10) / 3 * 4);
            UIImage *imagePictureTwo = [[UIImage imageNamed:@"pic2.jpg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            [pictureTwo setImage:imagePictureTwo forState:UIControlStateNormal];
            [pictureTwo.layer setMasksToBounds:YES];
            [pictureTwo.layer setCornerRadius:14.0];
            [_cell addSubview:pictureTwo];
            
            UIButton* pictureThree = [UIButton buttonWithType:UIButtonTypeCustom];
            pictureThree.frame = CGRectMake(widTwo * 2 + 5, 0, widTwo - 10, (widTwo - 10) / 3 * 4);
            //UIImage *imagePictureThree = [UIImage imageNamed:@"pic3.jpg"];
            UIImage *imagePictureThree = [[UIImage imageNamed:@"pic3.jpg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            [pictureThree setImage:imagePictureThree forState:UIControlStateNormal];
            [pictureThree.layer setMasksToBounds:YES];
            [pictureThree.layer setCornerRadius:14.0];
            [_cell addSubview:pictureThree];
        }
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            _cell.textLabel.text = _arrayData[indexPath.section][indexPath.row];
            _cell.textLabel.font = [UIFont systemFontOfSize:18];
            _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            _cell.detailTextLabel.text = @"更多";
        }
    }
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            _cell.selectionStyle = UITableViewCellSelectionStyleNone;
            NSArray* titleArr = @[@"创建歌单", @"收藏歌单"];
            for (int i = 0; i < 2; i++) {
                UIButton* titileButton = [UIButton buttonWithType:UIButtonTypeCustom];
                titileButton.frame = CGRectMake(10 + 90 * i, 10, 90, 40);
                titileButton.titleLabel.font = [UIFont systemFontOfSize:18];
                [titileButton setTitle:titleArr[i] forState:UIControlStateNormal];
                [titileButton setBackgroundColor:[UIColor clearColor]];
                [titileButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                [titileButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
                //设置tag值
                titileButton.tag = 100 + i;
                if (i == 0) {
                    titileButton.selected = YES;
                }
                else {
                    titileButton.selected = NO;
                }
                [titileButton addTarget:self action:@selector(choose:) forControlEvents:UIControlEventTouchUpInside];
                [_cell addSubview:titileButton];
            }
        }
        else {
            _cell.selectionStyle = UITableViewCellSelectionStyleNone;
            firstScrollView = [[UIScrollView alloc] init];
            firstScrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
            firstScrollView.pagingEnabled = YES;
            firstScrollView.bounces = NO;
            firstScrollView.showsHorizontalScrollIndicator = NO;
            firstScrollView.userInteractionEnabled = NO;
            firstScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 2, 200);
            firstScrollView.backgroundColor = [UIColor clearColor];
            [_cell addSubview:firstScrollView];
            NSArray* secondNameArray = @[@"致郁歌单", @"不是歌手" ,@"要考说唱大学", @"朱方元是歌神"];
            for (int i = 0; i < 2; i++) {
                NSString* FirstStrName = [NSString stringWithFormat:@"pic%d.jpg",i + 6];
                UIImage* firstScrollImage = [UIImage imageNamed:FirstStrName];
                UIButton* firstScrollButton = [UIButton buttonWithType:UIButtonTypeCustom];
                firstScrollButton.backgroundColor = [UIColor clearColor];
                [firstScrollButton setImage:firstScrollImage forState:UIControlStateNormal];
                [firstScrollButton setTitle:secondNameArray[i] forState:UIControlStateNormal];
                firstScrollButton.titleLabel.font = [UIFont systemFontOfSize:15];
                [firstScrollButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                firstScrollButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 104);
                firstScrollButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 49);
                firstScrollButton.frame = CGRectMake(5 + [UIScreen mainScreen].bounds.size.width * i, 10, [UIScreen mainScreen].bounds.size.width / 2, 72);
                [firstScrollView addSubview:firstScrollButton];
            
                NSString* secondStrName = [NSString stringWithFormat:@"pic%d.jpg",i + 8];
                UIImage* secondScrollImage = [UIImage imageNamed:secondStrName];
                UIButton* secondScrollButton = [UIButton buttonWithType:UIButtonTypeCustom];
                secondScrollButton.backgroundColor = [UIColor clearColor];
                [secondScrollButton setImage:secondScrollImage forState:UIControlStateNormal];
                [secondScrollButton setTitle:secondNameArray[i + 2] forState:UIControlStateNormal];
                secondScrollButton.titleLabel.font = [UIFont systemFontOfSize:15];
                [secondScrollButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                secondScrollButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 104);
                secondScrollButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
                secondScrollButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 + [UIScreen mainScreen].bounds.size.width * i, 10, [UIScreen mainScreen].bounds.size.width / 2, 72);
                
                [firstScrollView addSubview:secondScrollButton];
            }
        }
    }
    
    //cell.textLabel.text = _arrayData[indexPath.section][indexPath.row];
    return _cell;
}

//组间距

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

//脚视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor clearColor];
    return footerView;
}

- (void)choose:(UIButton*)sender {
    for (int i = 0; i < 2; i++) {
            UIButton *btn = (UIButton *)[[sender superview]viewWithTag:100 + i];
            [btn setSelected:NO];
        }
    if (sender.tag == 100) {
        [firstScrollView scrollRectToVisible:CGRectMake(0, 0,500, 500) animated:YES];
    } else if (sender.tag == 101) {
        [firstScrollView scrollRectToVisible:CGRectMake([UIScreen mainScreen].bounds.size.width, 0, 500, 500) animated:YES];
    }
    UIButton *button = (UIButton *)sender;
    [button setSelected:YES];
}

- (void)downloadPressNext {
    DownloadViewController* downloadViewController = [[DownloadViewController alloc] init];
    
    [self.navigationController pushViewController:downloadViewController animated:YES];
}

- (void)photoWallPress {
    PhotoWallViewController* photoWallViewController = [[PhotoWallViewController alloc] init];
    photoWallViewController.delegate = self;
    [self.navigationController pushViewController:photoWallViewController animated:YES];
}

- (void)changeHeadPhoto:(NSString *)str {
    UIImage* realImage = [UIImage imageNamed:str];
    _imageMain = realImage;
    [self.tableView reloadData];
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
