//
//  NCFEntry.m
//  NestedCoreFramework
//
//  Created by Abbey Jackson on 2019-05-03.
//  Copyright © 2019 abbeytest. All rights reserved.
//

#import "NCFEntry.h"

@implementation NCFEntry

- (NSString *)coreLabel:(NSString *)prefix {
    return [NSString stringWithFormat:@"%@ - Core Accessed", prefix];
}

@end
