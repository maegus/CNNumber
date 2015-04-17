//
//  NSString+Helper.m
//  CNNumber
//
//  Created by apple on 4/17/15.
//  Copyright (c) 2015 DeltaX. All rights reserved.
//

#import "NSString+Helper.h"

@implementation NSString (Helper)

- (BOOL)isZero {
    return [self isEqualToString:@"零"] || [self isEqualToString:@""];
}

- (NSArray *)splitString {
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < [self length]; i++) {
        NSString *ch = [self substringWithRange:NSMakeRange(i, 1)];
        [array addObject:ch];
    }
    return [array copy];
}

@end
