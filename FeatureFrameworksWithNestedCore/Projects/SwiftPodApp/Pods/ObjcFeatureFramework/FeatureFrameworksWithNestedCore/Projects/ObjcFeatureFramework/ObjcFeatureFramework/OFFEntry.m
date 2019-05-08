//
//  OFFEntry.m
//  ObjcFeatureFramework
//
//  Created by Abbey Jackson on 2019-05-03.
//  Copyright © 2019 abbeytest. All rights reserved.
//

#import "OFFEntry.h"
#import <NestedCoreFramework/NestedCoreFramework.h>

@implementation OFFEntry

- (NSString *)objcLabel {
    return [[NCFEntry new] coreLabel:@"Objc"];
}

@end
