//
//  CNNumber.h
//  CNNumber
//
//  Created by apple on 4/17/15.
//  Copyright (c) 2015 DeltaX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNNumberHelper.h"

@interface CNNumberParser : NSObject

+ (NSString *)stringFromArabic:(NSInteger)integer;
+ (NSArray *)removeExtraZeroFromArray:(NSArray *)array;
+ (NSArray *)addUnitToArray:(NSArray *)array;

+ (NSString *)cn_numberWithInteger:(NSInteger)integer;

@end
