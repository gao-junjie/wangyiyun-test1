//
//  PhotoWallViewController.h
//  2.网易云音乐界面
//
//  Created by mac on 2021/7/22.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"
NS_ASSUME_NONNULL_BEGIN
@protocol PhotoDelegate <NSObject>

- (void)changeHeadPhoto:(NSString*) str;

@end

@interface PhotoWallViewController : ViewController
@property (strong, nonatomic) UIButton* headPhotoButton;
@property (strong, nonatomic) NSMutableArray* imageNameArray;
@property (strong, nonatomic) UIImage* headPhotoImage;
@property (assign, nonatomic) int photoNumber;
@property (assign, nonatomic) id<PhotoDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
