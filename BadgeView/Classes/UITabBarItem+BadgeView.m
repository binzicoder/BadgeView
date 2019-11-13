//
//  UITabBarItem+BadgeView.m
//  test
//
//  Created by bin@ on 2019/11/13.
//  Copyright © 2019 bin@. All rights reserved.
//

#import "UITabBarItem+BadgeView.h"
#import <objc/runtime.h>
#import "UIView+BadgeView.h"

@implementation UITabBarItem (BadgeView)

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
    // 1.get UITabbarButtion
    UIView *bottomView = [self valueForKeyPath:@"_view"];
    
    // 2.get imageView, to make sure badge front at anytime.
    UIView *actualSuperView = nil;
    if (bottomView) {
        actualSuperView = [self find:bottomView firstSubviewWithClass:NSClassFromString(@"UITabBarSwappableImageView")];
    }
    
    // badge label will be added onto imageView
    return actualSuperView;
}

- (UIView *)find:(UIView *)view firstSubviewWithClass:(Class)cls
{
    __block UIView *targetView = nil;
    [view.subviews enumerateObjectsUsingBlock:^(UIView *subview, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([subview isKindOfClass:cls]) {
            targetView = subview;
            *stop = YES;
        }
    }];
    return targetView;
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
