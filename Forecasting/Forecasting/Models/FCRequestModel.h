//
//  FCRequestModel.h
//  Forecasting
//
//  Created by Andrey Filyakov on 17.11.15.
//  Copyright © 2015 Andrey Filyakov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FCRequestModel : NSObject

@property (nonatomic, strong) NSNumber *val1;
@property (nonatomic, strong) NSNumber *val2;
@property (nonatomic, strong) NSNumber *val3;
@property (nonatomic, strong) NSNumber *tm;

+ (instancetype)requestWithVal1:(NSNumber *)val1
                           val2:(NSNumber *)val2
                           val3:(NSNumber *)val3
                             tm:(NSNumber *)tm;

@end
