//
//  CNNumberHelper.h
//  CNNumber
//
//  Created by apple on 4/17/15.
//  Copyright (c) 2015 DeltaX. All rights reserved.
//

#ifndef CNNumber_CNNumberHelper_h
#define CNNumber_CNNumberHelper_h

typedef enum : NSUInteger {
    CNNUmberUnitDigit,
    CNNumberUnitTen,
    CNNumberUnitHundred,
    CNNumberUnitThousand,
    CNNumberUnitTenThousand,
} CNNumberUnit;

#import "NSString+Helper.h"
#import "NSArray+Helper.h"
#import "NSMutableArray+Helper.h"

#endif
