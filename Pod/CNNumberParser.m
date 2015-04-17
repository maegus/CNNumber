//
//  CNNumber.m
//  CNNumber
//
//  Created by apple on 4/17/15.
//  Copyright (c) 2015 DeltaX. All rights reserved.
//

#import "CNNumberParser.h"

@interface CNNumberParser ()

@end

@implementation CNNumberParser

+ (NSString *)cn_numberWithInteger:(NSInteger)integer {
    NSString *string = [self stringFromArabic:integer];
    NSArray *divideToArray = [string split];
    NSArray *unitArray = [self addUnitToArray:divideToArray];
    NSArray *resultArray = [self removeExtraZeroFromArray:unitArray];
    NSString *result = [resultArray stringFromArray];
    return result;
}

+ (NSArray *)addUnitToArray:(NSArray *)array {
    NSMutableArray *mutableArray = [array mutableCopy];
    [mutableArray reverse];

    NSMutableArray *unitIndex = [[NSMutableArray alloc] init];

    [mutableArray enumerateObjectsUsingBlock:^(NSString *s, NSUInteger idx, BOOL *stop) {
        if (idx + 1 == array.count - 1) {
            *stop = YES;
        }
        NSString *next = mutableArray[idx + 1];
        BOOL closeNumberNeitherZero = ![next isZero] && ![s isZero];
        BOOL havePlace = ![next isZero];

        if (closeNumberNeitherZero || havePlace) {
            [unitIndex addObject:@(idx + 1)];
        }
    }];

    NSMutableArray *unitArray = [[NSMutableArray alloc] init];
    for (__unused id x in array) {
        [unitArray addObject:@""];
    }
    for (NSNumber *number in unitIndex) {
        unitArray[number.integerValue] = [self parseUnitDictionary][number];
    }
    
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < unitArray.count; i++) {
        [resultArray addObject:unitArray[i]];
        [resultArray addObject:mutableArray[i]];
    }
    [resultArray reverse];

    return [resultArray copy];
}

+ (NSArray *)removeExtraZeroFromArray:(NSArray *)array {
    NSMutableArray *mutableArray = [array mutableCopy];
    NSMutableArray *zeroIndex = [[NSMutableArray alloc] init];

    __weak NSArray *weakArray = mutableArray;
    [mutableArray enumerateObjectsUsingBlock:^(NSString *s, NSUInteger idx, BOOL *stop) {
        if (idx + 1 == array.count - 1) {
            *stop = YES;
        }
        NSString *next = weakArray[idx + 1];
        if ([s isZero] && [next isZero]) {
            [zeroIndex addObject:@(idx + 1)];
        }
    }];

    for (NSNumber *number in zeroIndex) {
        mutableArray[number.integerValue] = @"";
    }

    NSString *lastDigit = mutableArray[mutableArray.count - 2];
    if ([lastDigit isZero]) {
        mutableArray[mutableArray.count - 2] = @"";
    }

    return [mutableArray copy];
}

+ (NSString *)stringFromArabic:(NSInteger)integer {
    NSMutableString *number = [[NSMutableString alloc] init];
    while (integer) {
        NSInteger lastInteger = integer % 10;
        NSString *lastCharacter = [self characterFromArabic:lastInteger];
        [number insertString:lastCharacter atIndex:0];
        integer = integer / 10;
    }
    return [number copy];
}

+ (NSString *)characterFromArabic:(NSInteger)integer {
    return [self parseNumberDictionary][@(integer)] ?: @"";
}

#pragma mark - Source

+ (NSDictionary *)parseNumberDictionary {
    return @{@0:@"零",
             @1:@"一",
             @2:@"二",
             @3:@"三",
             @4:@"四",
             @5:@"五",
             @6:@"六",
             @7:@"七",
             @8:@"八",
             @9:@"九"};
}

+ (NSDictionary *)parseUnitDictionary {
    return @{@0:@"零",
             @1:@"十",
             @2:@"百",
             @3:@"千",
             @4:@"万",
             @5:@"十",
             @6:@"百",
             @7:@"千",
             @8:@"亿",
             @9:@"十"};
}

@end
