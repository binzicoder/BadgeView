//
//  UIView+BadgeView.h
//  BadgeView
//
//  Created by bin@ on 2019/11/11.
//  Copyright © 2019 bin@. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BadgeProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface UIView (BadgeView)<BadgeProtocol>
- (void)showBadgeWithStyle:(BadgeStyle)style value:(NSInteger)value;
- (void)showNumberBadgeWithValue:(NSInteger)value;
- (void)showRedDotBadge;
- (void)clearBadge;
- (void)resumeBadge;
@end

NS_ASSUME_NONNULL_END
