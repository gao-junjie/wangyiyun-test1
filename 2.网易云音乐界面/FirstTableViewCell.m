//
//  FirstTableViewCell.m
//  2.网易云音乐界面
//
//  Created by mac on 2021/7/21.
//  Copyright © 2021 mac. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"first"]) {
        _firstLabel = [[UILabel alloc] init];
        _firstLabel.text = @"300首";
        _firstLabel.font = [UIFont systemFontOfSize:13];
        _firstLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_firstLabel];
        
        _firstButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _firstButton.backgroundColor = [UIColor clearColor];
        [_firstButton setTitle:@"全部已播歌曲" forState:UIControlStateNormal];
        _firstButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_firstButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        UIImage* firstImage = [UIImage imageNamed:@"pic4.jpg"];
        [_firstButton setImage:[firstImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        _firstButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 40);
        _firstButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 24, 20);
        [self.contentView addSubview:_firstButton];
        
        
        _secondLabel = [[UILabel alloc] init];
        _secondLabel.text = @"继续播放";
        _secondLabel.font = [UIFont systemFontOfSize:13];
        _secondLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_secondLabel];
        
        _secondButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _secondButton.backgroundColor = [UIColor clearColor];
        [_secondButton setTitle:@"寂静岭" forState:UIControlStateNormal];
        _secondButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_secondButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        UIImage* secondImage = [UIImage imageNamed:@"pic5.jpg"];
        [_secondButton setImage:[secondImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        _secondButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 90);
        _secondButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 24, 70);
        [self.contentView addSubview:_secondButton];
    }
    return self;
}

-(void)layoutSubviews {
    _firstLabel.frame = CGRectMake(87, 52, 50, 22);
    _firstButton.frame = CGRectMake(5, 0, [UIScreen mainScreen].bounds.size.width / 2 - 5, 100);
    _secondLabel.frame = CGRectMake(79 + [UIScreen mainScreen].bounds.size.width / 2, 52, 100, 22);
    _secondButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2, 0, [UIScreen mainScreen].bounds.size.width / 2 - 5, 100);
}

@end
