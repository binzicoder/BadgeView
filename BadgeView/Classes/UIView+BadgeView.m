//
//  UIView+BadgeView.m
//  BadgeView
//
//  Created by bin@ on 2019/11/11.
//  Copyright © 2019 bin@. All rights reserved.
//

#import "UIView+BadgeView.h"
#import <objc/runtime.h>


#define kBadgeDefaultFont      ([UIFont boldSystemFontOfSize:9])
#define kBadgeDefaultMaximumBadgeNumber                     99
static const CGFloat kBadgeDefaultRedDotRadius = 4.f;

@implementation UIView (BadgeView)

- (void)showBadgeWithStyle:(BadgeStyle)style value:(NSInteger)value
{

    switch (style) {
        case RedDotBadgeStyle:
            [self showRedDotBadge];
            break;
        case NumberBadgeStyle:
            [self showNumberBadgeWithValue:value];
            break;
        case CustomImageBadgeStyle:
            [self badgeImageViewInit];
            break;
            
        default:
            break;
    }
}

- (void)clearBadge
{
    self.badge.hidden = YES;
}

- (void)resumeBadge
{
    if (self.badge && self.badge.hidden == YES) {
        self.badge.hidden = NO;
    }
}
- (void)showRedDotBadge
{
    [self badgeInit];
    self.badge.text = @"";
    [self resetBadgeForRedDot];
    self.badge.layer.cornerRadius = CGRectGetWidth(self.badge.frame) / 2;
    self.badge.hidden = NO;
}

- (void)resetBadgeForRedDot {
    if (self.badgeRadius > 0) {
        self.badge.frame = CGRectMake(self.badge.center.x - self.badgeRadius, self.badge.center.y + self.badgeRadius , self.badgeRadius * 2, self.badgeRadius *2);
    }
}
- (void)badgeImageViewInit
{
    if (self.badgeBackgroundImageView == nil) {
        CGFloat redotWidth = kBadgeDefaultRedDotRadius *2;
        CGRect frm = CGRectMake(CGRectGetWidth(self.frame), -redotWidth, redotWidth, redotWidth);
        self.badgeBackgroundImageView = [[UIImageView alloc] init];
        self.badgeBackgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.badgeBackgroundImageView.frame = frm;
        [self addSubview:self.badgeBackgroundImageView];
        [self bringSubviewToFront:self.badgeBackgroundImageView];
    }
}
- (void)badgeInit
{
    if (self.badgeBgColor == nil) {
        self.badgeBgColor = [UIColor redColor];
    }
    if (self.badgeTextColor == nil) {
        self.badgeTextColor = [UIColor whiteColor];
    }
    
    if (nil == self.badge) {
        CGFloat redotWidth = kBadgeDefaultRedDotRadius *2;
        CGRect frm = CGRectMake(CGRectGetWidth(self.frame), -redotWidth, redotWidth, redotWidth);
        self.badge = [[UILabel alloc] initWithFrame:frm];
        self.badge.textAlignment = NSTextAlignmentCenter;
        self.badge.center = CGPointMake(CGRectGetWidth(self.frame) + 2 + self.badgeCenterOffset.x, self.badgeCenterOffset.y);
        self.badge.backgroundColor = self.badgeBgColor;
        self.badge.textColor = self.badgeTextColor;
        self.badge.layer.cornerRadius = CGRectGetWidth(self.badge.frame) / 2;
        self.badge.layer.masksToBounds = YES;//very important
        self.badge.hidden = NO;
        [self addSubview:self.badge];
        [self bringSubviewToFront:self.badge];
    }

}

- (void)showNumberBadgeWithValue:(NSInteger)value
{
    if (value < 0) {
        return;
    }
    [self badgeInit];
    self.badge.hidden = (value == 0);
    self.badge.font = self.badgeFont;
    self.badge.text = (value > self.badgeMaximumBadgeNumber ?
                       [NSString stringWithFormat:@"%@+", @(self.badgeMaximumBadgeNumber)] :
                       [NSString stringWithFormat:@"%@", @(value)]);
    [self adjustLabelWidth:self.badge];
    CGRect frame = self.badge.frame;
    frame.size.width += 4;
    frame.size.height += 4;
    if(CGRectGetWidth(frame) < CGRectGetHeight(frame)) {
        frame.size.width = CGRectGetHeight(frame);
    }
    self.badge.frame = frame;
    self.badge.center = CGPointMake(CGRectGetWidth(self.frame) + 2 + self.badgeCenterOffset.x, self.badgeCenterOffset.y);
    self.badge.layer.cornerRadius = CGRectGetHeight(self.badge.frame) / 2;
}
#pragma mark --  other private methods
- (void)adjustLabelWidth:(UILabel *)label
{
    [label setNumberOfLines:0];
    NSString *s = label.text;
    UIFont *font = [label font];
    CGSize size = CGSizeMake(320,2000);
    CGSize labelsize;
    
    if (![s respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        labelsize = [s sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
#pragma clang diagnostic pop
        
    } else {
        NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        [style setLineBreakMode:NSLineBreakByWordWrapping];
        
        labelsize = [s boundingRectWithSize:size
                                    options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                 attributes:@{ NSFontAttributeName:font, NSParagraphStyleAttributeName : style}
                                    context:nil].size;
    }
    CGRect frame = label.frame;
    frame.size = CGSizeMake(ceilf(labelsize.width), ceilf(labelsize.height));
    [label setFrame:frame];
}

#pragma mark -- setter/getter

- (UILabel *)badge
{
    return objc_getAssociatedObject(self, &badgeLabelKey);
}

- (void)setBadge:(UILabel *)label
{
    objc_setAssociatedObject(self, &badgeLabelKey, label, OBJC_ASSOCIATION_RETAIN);
}

 - (UIImageView *)badgeBackgroundImageView
{
    return objc_getAssociatedObject(self, &badgeBackgroundImageViewKey);
}

-(void)setBadgeBackgroundImageView:(UIImageView *)badgeBackgroundImageView
{
     objc_setAssociatedObject(self, &badgeBackgroundImageViewKey, badgeBackgroundImageView, OBJC_ASSOCIATION_RETAIN);
}

- (UIFont *)badgeFont
{
    id font = objc_getAssociatedObject(self, &badgeFontKey);
    return font == nil ? kBadgeDefaultFont : font;
}

- (void)setBadgeFont:(UIFont *)badgeFont
{
    objc_setAssociatedObject(self, &badgeFontKey, badgeFont, OBJC_ASSOCIATION_RETAIN);
    if (!self.badge) {
        [self badgeInit];
    }
    self.badge.font = badgeFont;
}
- (UIColor *)badgeBgColor
{
    return objc_getAssociatedObject(self, &badgeBgColorKey);
}

- (void)setBadgeBgColor:(UIColor *)badgeBgColor
{
    objc_setAssociatedObject(self, &badgeBgColorKey, badgeBgColor, OBJC_ASSOCIATION_RETAIN);
    if (!self.badge) {
        [self badgeInit];
    }
    self.badge.backgroundColor = badgeBgColor;
}

- (UIColor *)badgeTextColor
{
    return objc_getAssociatedObject(self, &badgeTextColorKey);
}

- (void)setBadgeTextColor:(UIColor *)badgeTextColor
{
    objc_setAssociatedObject(self, &badgeTextColorKey, badgeTextColor, OBJC_ASSOCIATION_RETAIN);
    if (!self.badge) {
        [self badgeInit];
    }
    self.badge.textColor = badgeTextColor;
}


- (CGRect)badgeFrame
{
    id obj = objc_getAssociatedObject(self, &badgeFrameKey);
    if (obj != nil && [obj isKindOfClass:[NSDictionary class]] && [obj count] == 4) {
        CGFloat x = [obj[@"x"] floatValue];
        CGFloat y = [obj[@"y"] floatValue];
        CGFloat width = [obj[@"width"] floatValue];
        CGFloat height = [obj[@"height"] floatValue];
        return  CGRectMake(x, y, width, height);
    } else
        return CGRectZero;
}

- (void)setBadgeFrame:(CGRect)badgeFrame
{
    NSDictionary *frameInfo = @{@"x" : @(badgeFrame.origin.x), @"y" : @(badgeFrame.origin.y),
                                @"width" : @(badgeFrame.size.width), @"height" : @(badgeFrame.size.height)};
    objc_setAssociatedObject(self, &badgeFrameKey, frameInfo, OBJC_ASSOCIATION_RETAIN);
    if (!self.badge) {
        [self badgeInit];
    }
    self.badge.frame = badgeFrame;
}

- (CGPoint)badgeCenterOffset
{
    id obj = objc_getAssociatedObject(self, &badgeCenterOffsetKey);
    if (obj != nil && [obj isKindOfClass:[NSDictionary class]] && [obj count] == 2) {
        CGFloat x = [obj[@"x"] floatValue];
        CGFloat y = [obj[@"y"] floatValue];
        return CGPointMake(x, y);
    } else
        return CGPointZero;
}

- (void)setBadgeCenterOffset:(CGPoint)badgeCenterOff
{
    NSDictionary *cenerInfo = @{@"x" : @(badgeCenterOff.x), @"y" : @(badgeCenterOff.y)};
    objc_setAssociatedObject(self, &badgeCenterOffsetKey, cenerInfo, OBJC_ASSOCIATION_RETAIN);
    if (!self.badge) {
        [self badgeInit];
    }
    self.badge.center = CGPointMake(CGRectGetWidth(self.frame) + 2 + badgeCenterOff.x, badgeCenterOff.y);
}

- (void)setBadgeRadius:(CGFloat)badgeRadius {
    objc_setAssociatedObject(self, &badgeRadiusKey, [NSNumber numberWithFloat:badgeRadius], OBJC_ASSOCIATION_RETAIN);
    if (!self.badge) {
        [self badgeInit];
    }
//    self.badge.layer.cornerRadius = CGRectGetWidth(self.badge.frame)/ 2;
}

- (CGFloat)badgeRadius {
    return [objc_getAssociatedObject(self, &badgeRadiusKey) floatValue];
}

- (NSInteger)badgeMaximumBadgeNumber {
    id obj = objc_getAssociatedObject(self, &badgeMaximumBadgeNumberKey);
    if(obj != nil && [obj isKindOfClass:[NSNumber class]])
    {
        return [obj integerValue];
    }
    else
        return kBadgeDefaultMaximumBadgeNumber;
}

- (void)setBadgeMaximumBadgeNumber:(NSInteger)badgeMaximumBadgeNumber {
    NSNumber *numObj = @(badgeMaximumBadgeNumber);
    objc_setAssociatedObject(self, &badgeMaximumBadgeNumberKey, numObj, OBJC_ASSOCIATION_RETAIN);
    if (!self.badge) {
        [self badgeInit];
    }
}


@end
