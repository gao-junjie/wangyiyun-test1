//
//  ViewControllerOne.h
//  2.网易云音乐界面
//
//  Created by mac on 2021/7/18.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h" 
#import "PhotoWallViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerOne : ViewController <UITableViewDelegate,
UITableViewDataSource, PhotoDelegate> {
    //定义数据视图对象
    UITableView* _tableView;
    //声明一个数据源
    NSArray* _arrayData;
}
- (void)changeHeadPhoto:(NSString*) str;
@property (strong, nonatomic)UITableViewCell* cell;
@property (strong, nonatomic)UIButton* buttonMain;
@property (strong, nonatomic)UIImage* imageMain;
@property (strong, nonatomic)UITableView* tableView;
@property (strong, nonatomic)UIScrollView* firstScrollViewOne;

@end

NS_ASSUME_NONNULL_END
