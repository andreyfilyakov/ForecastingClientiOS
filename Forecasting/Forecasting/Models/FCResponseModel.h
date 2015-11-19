//
//  FCResponseModel.h
//  Forecasting
//
//  Created by Andrey Filyakov on 20.11.15.
//  Copyright © 2015 Andrey Filyakov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FCResponseModel : NSObject

@property (nonatomic, strong) NSArray *x;
@property (nonatomic, strong) NSArray *y0;
@property (nonatomic, strong) NSArray *y1;
@property (nonatomic, strong) NSArray *y2;
@property (nonatomic, strong) NSArray *y3;

@property (nonatomic, strong) NSArray *s0;
@property (nonatomic, strong) NSArray *s1;
@property (nonatomic, strong) NSArray *s2;
@property (nonatomic, strong) NSArray *s3;

@property (nonatomic, strong) NSArray *w0Error;
@property (nonatomic, strong) NSArray *w1Error;
@property (nonatomic, strong) NSArray *w2Error;
@property (nonatomic, strong) NSArray *w3Error;

@property (nonatomic, strong) NSArray *lms0;
@property (nonatomic, strong) NSArray *lms1;
@property (nonatomic, strong) NSArray *lms2;
@property (nonatomic, strong) NSArray *lms3;
@property (nonatomic, strong) NSArray *lms0Error;
@property (nonatomic, strong) NSArray *lms1Error;
@property (nonatomic, strong) NSArray *lms2Error;
@property (nonatomic, strong) NSArray *lms3Error;

+ (instancetype)responseWithJSON:(NSDictionary *)json;

@end
