//
//  FCRequestModel.m
//  Forecasting
//
//  Created by Andrey Filyakov on 17.11.15.
//  Copyright © 2015 Andrey Filyakov. All rights reserved.
//

#import "FCRequestModel.h"

@implementation FCRequestModel

- (instancetype)initWithVal1:(NSNumber *)val1
                        val2:(NSNumber *)val2
                        val3:(NSNumber *)val3
                          tm:(NSNumber *)tm {
    self = [super init];
    if (self) {
        self.val1 = val1;
        self.val2 = val2;
        self.val3 = val3;
        self.tm = tm;
    }
    return self;
}

+ (instancetype)requestWithVal1:(NSNumber *)val1 val2:(NSNumber *)val2 val3:(NSNumber *)val3 tm:(NSNumber *)tm {
    return [[self alloc] initWithVal1:val1 val2:val2 val3:val3 tm:tm];
}

@end
