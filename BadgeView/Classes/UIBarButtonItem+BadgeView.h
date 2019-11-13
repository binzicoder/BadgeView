//
//  UIBarButtonItem+BadgeView.h
//  test
//
//  Created by bin@ on 2019/11/13.
//  Copyright © 2019 bin@. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BadgeProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (BadgeView)<BadgeProtocol>
- (void)showRedDotBadge;
- (void)showBadgeWithStyle:(BadgeStyle)style value:(NSInteger)value;
- (void)clearBadge;
@end

NS_ASSUME_NONNULL_END
