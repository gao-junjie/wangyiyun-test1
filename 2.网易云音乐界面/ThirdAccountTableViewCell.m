//
//  ThirdAccountTableViewCell.m
//  2.网易云音乐界面
//
//  Created by mac on 2021/7/23.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ThirdAccountTableViewCell.h"

@implementation ThirdAccountTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:@"thirdBlock"];
    if ([self.reuseIdentifier isEqualToString:@"thirdBlock"]) {
        self.textLabel.font = [UIFont systemFontOfSize:20];
        self.textLabel.textColor = [UIColor redColor];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

@end
