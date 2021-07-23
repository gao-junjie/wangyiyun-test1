//
//  SecondAccountTableViewCell.m
//  2.网易云音乐界面
//
//  Created by mac on 2021/7/23.
//  Copyright © 2021 mac. All rights reserved.
//

#import "SecondAccountTableViewCell.h"

@implementation SecondAccountTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:@"secondBlock"];
    if ([self.reuseIdentifier isEqualToString:@"secondBlock"]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.textLabel.font = [UIFont systemFontOfSize:15];
    }
    return self;
}


@end
