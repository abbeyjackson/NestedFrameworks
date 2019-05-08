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

#import "ObjcFeatureFramework.h"
#import "OFFEntry.h"

FOUNDATION_EXPORT double ObjcFeatureFrameworkVersionNumber;
FOUNDATION_EXPORT const unsigned char ObjcFeatureFrameworkVersionString[];

