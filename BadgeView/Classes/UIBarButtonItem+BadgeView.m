//
//  UIBarButtonItem+BadgeView.m
//  test
//
//  Created by bin@ on 2019/11/13.
//  Copyright © 2019 bin@. All rights reserved.
//

#import "UIBarButtonItem+BadgeView.h"
#import <objc/runtime.h>
#import "UIView+BadgeView.h"

@implementation UIBarButtonItem (BadgeView)
- (void)showRedDotBadge
{
    [[self getActualBadgeSuperView] showRedDotBadge];
}
- (void)showBadgeWithStyle:(BadgeStyle)style value:(NSInteger)value
{
    [[self getActualBadgeSuperView] showBadgeWithStyle:style value:value];
}
- (void)clearBadge
{
    [[self getActualBadgeSuperView] clearBadge];
}
- (UIView *)getActualBadgeSuperView
{
    UIView *subView;
    if ([self valueForKeyPath:@"_view"]) {
        subView = [self valueForKeyPath:@"_view"];
    }
    return subView;
}
#pragma mark - getter & setter
- (UILabel *)badge
{
    return [self getActualBadgeSuperView].badge;
}

- (void)setBadge:(UILabel *)label
{
    [[self getActualBadgeSuperView] setBadge:label];
}

- (UIFont *)badgeFont
{
    return [self getActualBadgeSuperView].badgeFont;
}

- (void)setBadgeFont:(UIFont *)badgeFont
{
    [[self getActualBadgeSuperView] setBadgeFont:badgeFont];
}

- (UIColor *)badgeBgColor
{
    return [[self getActualBadgeSuperView] badgeBgColor];
}

- (void)setBadgeBgColor:(UIColor *)badgeBgColor
{
    [[self getActualBadgeSuperView] setBadgeBgColor:badgeBgColor];
}

- (UIColor *)badgeTextColor
{
    return [[self getActualBadgeSuperView] badgeTextColor];
}

- (void)setBadgeTextColor:(UIColor *)badgeTextColor
{
    [[self getActualBadgeSuperView] setBadgeTextColor:badgeTextColor];
}

- (CGRect)badgeFrame
{
    return [[self getActualBadgeSuperView] badgeFrame];
}

- (void)setBadgeFrame:(CGRect)badgeFrame
{
    [[self getActualBadgeSuperView] setBadgeFrame:badgeFrame];
}

- (CGPoint)badgeCenterOffset
{
    return [[self getActualBadgeSuperView] badgeCenterOffset];
}

- (void)setBadgeCenterOffset:(CGPoint)badgeCenterOffset
{
    [[self getActualBadgeSuperView] setBadgeCenterOffset:badgeCenterOffset];
}

- (NSInteger)badgeMaximumBadgeNumber
{
    return [[self getActualBadgeSuperView] badgeMaximumBadgeNumber];
}

- (void)setBadgeMaximumBadgeNumber:(NSInteger)badgeMaximumBadgeNumber
{
    [[self getActualBadgeSuperView] setBadgeMaximumBadgeNumber:badgeMaximumBadgeNumber];
}
- (UIImageView *)badgeBackgroundImageView
{
    return [[self getActualBadgeSuperView] badgeBackgroundImageView];
}
- (void)setBadgeBackgroundImageView:(UIImageView *)badgeBackgroundImageView
{
    [[self getActualBadgeSuperView] setBadgeBackgroundImageView:badgeBackgroundImageView];
}
- (CGFloat)badgeRadius
{
    return [[self getActualBadgeSuperView] badgeRadius];
}
- (void)setBadgeRadius:(CGFloat)badgeRadius
{
    [[self getActualBadgeSuperView] setBadgeRadius:badgeRadius];
}
@end
