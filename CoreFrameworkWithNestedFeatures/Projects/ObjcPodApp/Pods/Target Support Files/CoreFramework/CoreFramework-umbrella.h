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

#import "CFEntry.h"
#import "CoreFramework.h"

FOUNDATION_EXPORT double CoreFrameworkVersionNumber;
FOUNDATION_EXPORT const unsigned char CoreFrameworkVersionString[];

