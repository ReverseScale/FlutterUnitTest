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

#import "PigeonMessage.h"
#import "ZgPlatformChannelsPlugin.h"
#import "zg_platform_channels.h"

FOUNDATION_EXPORT double zg_platform_channelsVersionNumber;
FOUNDATION_EXPORT const unsigned char zg_platform_channelsVersionString[];

