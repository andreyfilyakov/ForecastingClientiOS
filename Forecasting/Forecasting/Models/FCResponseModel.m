//
//  FCResponseModel.m
//  Forecasting
//
//  Created by Andrey Filyakov on 20.11.15.
//  Copyright © 2015 Andrey Filyakov. All rights reserved.
//

#import "FCResponseModel.h"

@implementation FCResponseModel

- (instancetype)initWithJSON:(NSDictionary *)json {
    self = [super init];
    if (self) {
        self.x = [json objectForKey:@"X"];
        self.y0 = [json objectForKey:@"Y0"];
        self.y1 = [json objectForKey:@"Y1"];
        self.y2 = [json objectForKey:@"Y2"];
        self.y3 = [json objectForKey:@"Y3"];
        
        NSArray *s = [json objectForKey:@"S"];
        self.s0 = [s objectAtIndex:0];
        self.s1 = [s objectAtIndex:1];
        self.s2 = [s objectAtIndex:2];
        self.s3 = [s objectAtIndex:3];
        
        self.w0Error = [json objectForKey:@"dW0"];
        self.w1Error = [json objectForKey:@"dW1"];
        self.w2Error = [json objectForKey:@"dW2"];
        self.w3Error = [json objectForKey:@"dW3"];
        
        self.lms0 = [json objectForKey:@"LMS0"];
        self.lms1 = [json objectForKey:@"LMS1"];
        self.lms2 = [json objectForKey:@"LMS2"];
        self.lms3 = [json objectForKey:@"LMS3"];
        self.lms0Error = [json objectForKey:@"dLMS0"];
        self.lms1Error = [json objectForKey:@"dLMS1"];
        self.lms2Error = [json objectForKey:@"dLMS2"];
        self.lms3Error = [json objectForKey:@"dLMS3"];
        
        self.wX = [json objectForKey:@"Wx"];
        self.winnerW = [json objectForKey:@"WinnerW"];
        self.lmsW = [json objectForKey:@"LMSW"];
    }
    return self;
}

+ (instancetype)responseWithJSON:(NSDictionary *)json {
    return [[self alloc] initWithJSON:json];
}

@end
