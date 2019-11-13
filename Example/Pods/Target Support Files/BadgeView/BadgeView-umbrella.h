#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "BadgeProtocol.h"
#import "UIBarButtonItem+BadgeView.h"
#import "UITabBarItem+BadgeView.h"
#import "UIView+BadgeView.h"

FOUNDATION_EXPORT double BadgeViewVersionNumber;
FOUNDATION_EXPORT const unsigned char BadgeViewVersionString[];

