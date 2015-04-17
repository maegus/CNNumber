//
//  NSArray+Helper.m
//  CNNumber
//
//  Created by apple on 4/17/15.
//  Copyright (c) 2015 DeltaX. All rights reserved.
//

#import "NSArray+Helper.h"

@implementation NSArray (Helper)

- (NSString *)stringFromArray {
    return [[self valueForKey:@"description"] componentsJoinedByString:@""];
}

- (NSArray *)reverseArray {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (id element in enumerator) {
        [array addObject:element];
    }
    return array;
}

@end
