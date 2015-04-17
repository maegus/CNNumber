//
//  NSMutableArray+Helper.m
//  CNNumber
//
//  Created by apple on 4/17/15.
//  Copyright (c) 2015 DeltaX. All rights reserved.
//

#import "NSMutableArray+Helper.h"

@implementation NSMutableArray (Helper)

- (void)reverse {
    if ([self count] <= 1) {
        return;
    }
    NSUInteger i = 0;
    NSUInteger j = [self count] - 1;
    while (i < j) {
        [self exchangeObjectAtIndex:i
                  withObjectAtIndex:j];

        i++;
        j--;
    }
}

@end
