//
//  BadgeProtocol.h
//  test
//
//  Created by bin@ on 2019/11/13.
//  Copyright © 2019 bin@. All rights reserved.
//

#ifndef BadgeProtocol_h
#define BadgeProtocol_h

static char badgeLabelKey;
static char badgeBgColorKey;
static char badgeFontKey;
static char badgeTextColorKey;
static char badgeFrameKey;
static char badgeCenterOffsetKey;
static char badgeMaximumBadgeNumberKey;
static char badgeRadiusKey;
static char badgeBackgroundImageViewKey;


typedef NS_ENUM(NSUInteger, BadgeStyle)
{
    RedDotBadgeStyle = 0,
    NumberBadgeStyle,
    CustomImageBadgeStyle
};

@protocol BadgeProtocol <NSObject>
@property (nonatomic, strong) UILabel *badge;
@property (nonatomic, strong) UIImageView *badgeBackgroundImageView;
@property (nonatomic, strong) UIFont *badgeFont;
@property (nonatomic, strong) UIColor *badgeBgColor;
@property (nonatomic, strong) UIColor *badgeTextColor;
@property (nonatomic, assign) CGRect badgeFrame;
@property (nonatomic, assign) CGPoint  badgeCenterOffset;
@property (nonatomic, assign) NSInteger badgeMaximumBadgeNumber;
@property (nonatomic, assign) CGFloat badgeRadius;

- (void)showRedDotBadge;
- (void)showBadgeWithStyle:(BadgeStyle)style value:(NSInteger)value;
- (void)clearBadge;
@end


#endif /* BadgeProtocol_h */
