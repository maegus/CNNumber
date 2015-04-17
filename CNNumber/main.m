//
//  main.m
//  CNNumber
//
//  Created by apple on 4/17/15.
//  Copyright (c) 2015 DeltaX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNNumber.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *a = [CNNumberParser cn_numberWithInteger:13];
        NSLog(@"%@", a);
    }
    return 0;
}
