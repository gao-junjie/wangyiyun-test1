//
//  FIrstAccountTableViewCell.m
//  2.网易云音乐界面
//
//  Created by mac on 2021/7/23.
//  Copyright © 2021 mac. All rights reserved.
//

#import "FIrstAccountTableViewCell.h"

@implementation FIrstAccountTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"firstBlock"]) {
        //self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _buttonOne = [UIButton buttonWithType:UIButtonTypeSystem];
        _buttonOne.backgroundColor = [UIColor clearColor];
        [_buttonOne setTitle:@"我的消息" forState:UIControlStateNormal];
        [_buttonOne setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_buttonOne setImage:[UIImage imageNamed:@"icon20.png"] forState:UIControlStateNormal];
        [_buttonOne setTintColor:[UIColor redColor]];
        _buttonOne.imageEdgeInsets = UIEdgeInsetsMake(-_buttonOne.titleLabel.intrinsicContentSize.height - 5, 0, 0, -_buttonOne.titleLabel.intrinsicContentSize.width);
        _buttonOne.titleEdgeInsets = UIEdgeInsetsMake(_buttonOne.currentImage.size.height + 10, -_buttonOne.currentImage.size.width, 0, 0);
        [self.contentView addSubview:_buttonOne];
        
        
        _buttonTwo = [UIButton buttonWithType:UIButtonTypeSystem];
        _buttonTwo.backgroundColor = [UIColor clearColor];
        [_buttonTwo setTitle:@"我的好友" forState:UIControlStateNormal];
        [_buttonTwo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_buttonTwo setImage:[UIImage imageNamed:@"icon21.png"] forState:UIControlStateNormal];
        [_buttonTwo setTintColor:[UIColor redColor]];
        _buttonTwo.imageEdgeInsets = UIEdgeInsetsMake(-_buttonTwo.titleLabel.intrinsicContentSize.height - 5, 0, 0, -_buttonTwo.titleLabel.intrinsicContentSize.width);
        _buttonTwo.titleEdgeInsets = UIEdgeInsetsMake(_buttonTwo.currentImage.size.height + 10, -_buttonTwo.currentImage.size.width, 0, 0);
        [self.contentView addSubview:_buttonTwo];
        
        
        _buttonThree = [UIButton buttonWithType:UIButtonTypeSystem];
        _buttonThree.backgroundColor = [UIColor clearColor];
        [_buttonThree setTitle:@"个人主页" forState:UIControlStateNormal];
        [_buttonThree setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_buttonThree setImage:[UIImage imageNamed:@"icon22.png"] forState:UIControlStateNormal];
        [_buttonThree setTintColor:[UIColor redColor]];
        _buttonThree.imageEdgeInsets = UIEdgeInsetsMake(-_buttonThree.titleLabel.intrinsicContentSize.height - 5, 0, 0, -_buttonThree.titleLabel.intrinsicContentSize.width);
        _buttonThree.titleEdgeInsets = UIEdgeInsetsMake(_buttonThree.currentImage.size.height + 10, -_buttonThree.currentImage.size.width, 0, 0);
        [self.contentView addSubview:_buttonThree];
        
        
        _buttonFour = [UIButton buttonWithType:UIButtonTypeSystem];
        _buttonFour.backgroundColor = [UIColor clearColor];
        [_buttonFour setTitle:@"个性装扮" forState:UIControlStateNormal];
        [_buttonFour setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_buttonFour setImage:[UIImage imageNamed:@"icon23.png"] forState:UIControlStateNormal];
        [_buttonFour setTintColor:[UIColor redColor]];
        _buttonFour.imageEdgeInsets = UIEdgeInsetsMake(-_buttonFour.titleLabel.intrinsicContentSize.height - 5, 0, 0, -_buttonFour.titleLabel.intrinsicContentSize.width);
        _buttonFour.titleEdgeInsets = UIEdgeInsetsMake(_buttonFour.currentImage.size.height + 17, -_buttonFour.currentImage.size.width, 0, 0);
        [self.contentView addSubview:_buttonFour];
        
        
        _buttonMain = [UIButton buttonWithType:UIButtonTypeSystem];
        _buttonMain.backgroundColor = [UIColor clearColor];
        [_buttonMain setTitle:@"     网抑云emo🤮" forState:UIControlStateNormal];
        _buttonMain.titleLabel.font = [UIFont systemFontOfSize:18];
        [_buttonMain setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        UIImage* imageMain = [UIImage imageNamed:@"icon24.png"];
        [_buttonMain setImage:[imageMain imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.contentView addSubview:_buttonMain];
        
        
        _buttonElse = [UIButton buttonWithType:UIButtonTypeSystem];
        _buttonElse.backgroundColor = [UIColor clearColor];
        [_buttonElse setTitle:@" 赚云贝 >" forState:UIControlStateNormal];
        _buttonElse.titleLabel.font = [UIFont systemFontOfSize:12];
        [_buttonElse setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        UIImage* imageElse = [UIImage imageNamed:@"icon25.png"];
        [_buttonElse setImage:[imageElse imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [_buttonElse.layer setMasksToBounds:YES];
        [_buttonElse.layer setCornerRadius:15.0];
        _buttonElse.layer.borderWidth = 0.5;
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef color = CGColorCreate(colorSpace, (CGFloat[]){0.1,0,0,0.3});
        [_buttonElse.layer setBorderColor:color];
        [self.contentView addSubview:_buttonElse];
    }
    return self;
}

- (void)layoutSubviews {
    float wid = [UIScreen mainScreen].bounds.size.width / 4;
    _buttonOne.frame = CGRectMake(0, 55, wid, wid);
    _buttonTwo.frame = CGRectMake(wid, 55, wid, wid);
    _buttonThree.frame = CGRectMake(wid * 2, 55, wid, wid);
    _buttonFour.frame = CGRectMake(wid * 3, 55, wid, wid);
    _buttonMain.frame = CGRectMake(0, 10, 220, 54);
    _buttonElse.frame = CGRectMake(310, 22, 90, 30);
    
}
@end
