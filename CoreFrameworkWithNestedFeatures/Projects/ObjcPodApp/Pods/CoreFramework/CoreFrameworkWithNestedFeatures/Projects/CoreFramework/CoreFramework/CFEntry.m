//
//  CFEntry.m
//  CoreFramework
//
//  Created by Abbey Jackson on 2019-05-02.
//  Copyright © 2019 abbeytest. All rights reserved.
//

@import NestedObjcFramework;
@import NestedSwiftFramework;
#import "CFEntry.h"

@implementation CFEntry

- (NSString *)coreLabel {
    return @"Core Connected";
}

- (NSString *)nestedSwiftLabel {
    return [[NSFEntry new] nestedSwiftLabel];
}

- (NSString *)nestedObjcLabel {
    return [[NOFEntry new] nestedObjcLabel];
}

@end
