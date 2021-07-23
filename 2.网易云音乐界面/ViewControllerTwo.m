//
//  ViewControllerTwo.m
//  2.网易云音乐界面
//
//  Created by mac on 2021/7/18.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewControllerTwo.h"
#import "FIrstAccountTableViewCell.h"
@interface ViewControllerTwo ()

@end

@implementation ViewControllerTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建UITableView
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _arrayData = @[@[@" "],
                   @[@"创作者中心"],
                   @[@"音乐服务", @"演出", @"商城", @"口袋彩铃", @"在线听歌免流量"],
                   @[@"小工具", @"设置", @"夜间模式", @"定时关闭", @"音乐黑名单", @"鲸云音效", @"添加Siri捷径", @"音乐闹钟", @"青少年模式"],
                   @[@"其他", @"我的订单", @"优惠券", @"分享网易云音乐", @"关于"], @[@"退出登录"]];
    
    self.navigationItem.title = @" ";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon26.png"] style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor grayColor]];
    
    UIImage *rightImage = [[UIImage imageNamed:@"icon28.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *buttonRight=[[UIBarButtonItem alloc] initWithImage:rightImage style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = buttonRight;
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"normalBlock"];
    [_tableView registerClass:[FIrstAccountTableViewCell class] forCellReuseIdentifier:@"firstBlock"];
    [_tableView registerClass:[SecondAccountTableViewCell class] forCellReuseIdentifier:@"secondBlock"];
    [_tableView registerClass:[ThirdAccountTableViewCell class] forCellReuseIdentifier:@"thirdBlock"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 2) {
        return 5;
    } else if (section == 3) {
        return 9;
    } else if (section == 4) {
        return 5;
    } else {
        return 1;
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"normalBlock"];
    cell.textLabel.font = [UIFont systemFontOfSize:20];
    NSString* strName;
    UIImage* image;
    
    if (indexPath.section == 0) {
        _firstAccountCell = [_tableView dequeueReusableCellWithIdentifier:@"firstBlock" forIndexPath:indexPath];
        return _firstAccountCell;
    }
    if (indexPath.section  == 1 && indexPath.row == 0) {
        cell.textLabel.text = _arrayData[indexPath.section][indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [[cell imageView] setImage:[UIImage imageNamed:@"icon3.png"]];
    }
    if (indexPath.row == 0 && (indexPath.section  == 2 || indexPath.section  == 3 || indexPath.section  == 4)) {
            _secondAccountCell = [_tableView dequeueReusableCellWithIdentifier:@"secondBlock" forIndexPath:indexPath];
            _secondAccountCell.textLabel.text = _arrayData[indexPath.section][indexPath.row];
            return _secondAccountCell;
        }
    if (indexPath.row != 0 && indexPath.section  == 2) {
            cell.textLabel.text = _arrayData[indexPath.section][indexPath.row];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            strName = [NSString stringWithFormat:@"icon%ld.png",indexPath.row + 3];
            image = [UIImage imageNamed:strName];
            [[cell imageView] setImage:image];
    }
    if (indexPath.section  == 3 || indexPath.section  == 4) {
        if (indexPath.row != 0) {
            cell.textLabel.text = _arrayData[indexPath.section][indexPath.row];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            strName = [NSString stringWithFormat:@"icon%ld.png",8 * (indexPath.section - 3) + 7 + indexPath.row];
            image = [UIImage imageNamed:strName];
            [[cell imageView] setImage:image];
        }
        if (indexPath.row == 2 && indexPath.section  == 3) {
            //add a switch
            cell.accessoryView = nil;
            _switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
            [_switchView setOnTintColor:[UIColor redColor]];
            //_switchView.on = [[NSUserDefaults standardUserDefaults]boolForKey:@"switchType"];
            cell.accessoryView = _switchView;
        }
        if (indexPath.section  == 3 && (indexPath.row == 5 || indexPath.row == 8)) {
            cell.detailTextLabel.text = @"未开启";
        }
    }
    if (indexPath.section  == 5) {
        _thirdAccountCell = [_tableView dequeueReusableCellWithIdentifier:@"thirdBlock" forIndexPath:indexPath];
        _thirdAccountCell.textLabel.text = _arrayData[indexPath.section][indexPath.row];
        return _thirdAccountCell;
    }
    return cell;
}

//设置行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //获取分区
    if (indexPath.section == 0) {
        return 160;
    }
    else if ((indexPath.section == 2 || indexPath.section == 3) && indexPath.row == 0) {
        return 40;
    }
    else {
        return 60;
    }
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
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor clearColor];
    return footerView;
}

//保存switch开关在本地
- (void) swChange:(UISwitch*)Switch{

    BOOL isOn = [ [ NSUserDefaults standardUserDefaults ] boolForKey:@"switchType" ];
    isOn = !isOn;
    [[NSUserDefaults standardUserDefaults]setBool:isOn forKey:@"switchType"];
    _switchView.on = isOn;
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
