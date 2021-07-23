//
//  ViewControllerTwo.h
//  2.网易云音乐界面
//
//  Created by mac on 2021/7/18.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"
#import "PhotoWallViewController.h"
#import "FIrstAccountTableViewCell.h"
#import "SecondAccountTableViewCell.h"
#import "ThirdAccountTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerTwo : ViewController <UITableViewDelegate,
UITableViewDataSource> {
    UITableView* _tableView;
    NSArray* _arrayData;
}
@property (strong, nonatomic)UITableView* tableView;
@property (strong, nonatomic)UISwitch* switchView;
@property (strong, nonatomic)UITableViewCell* normalcell;
@property (strong, nonatomic)FIrstAccountTableViewCell* firstAccountCell;
@property (strong, nonatomic)SecondAccountTableViewCell* secondAccountCell;
@property (strong, nonatomic)ThirdAccountTableViewCell* thirdAccountCell;
@end

NS_ASSUME_NONNULL_END
