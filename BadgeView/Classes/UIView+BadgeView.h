//
//  UIView+BadgeView.h
//  BadgeView
//
//  Created by bin@ on 2019/11/11.
//  Copyright © 2019 bin@. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, BadgeStyle)
{
    RedDotBadgeStyle = 0,
    NumberBadgeStyle,
    CustomImageBadgeStyle
};

@interface UIView (BadgeView)

@property (nonatomic, strong) UILabel *badge;
@property (nonatomic, strong) UIImageView *badgeBackgroundImageView;
@property (nonatomic, strong) UIFont *badgeFont;
@property (nonatomic, strong) UIColor *badgeBgColor;
@property (nonatomic, strong) UIColor *badgeTextColor;
@property (nonatomic, assign) CGRect badgeFrame;
@property (nonatomic, assign) CGPoint  badgeCenterOffset;
@property (nonatomic, assign) NSInteger badgeMaximumBadgeNumber;
@property (nonatomic, assign) CGFloat badgeRadius;


- (void)showBadgeWithStyle:(BadgeStyle)style value:(NSInteger)value;
- (void)showNumberBadgeWithValue:(NSInteger)value;
- (void)clearBadge;
- (void)resumeBadge;
@end

NS_ASSUME_NONNULL_END
