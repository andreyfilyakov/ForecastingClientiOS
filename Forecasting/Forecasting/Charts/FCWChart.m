//
//  FCWChart.m
//  Forecasting
//
//  Created by Andrey Filyakov on 01.12.15.
//  Copyright © 2015 Andrey Filyakov. All rights reserved.
//

#import "FCWChart.h"

@implementation FCWChart

- (SChartNumberRange *)chartYRange {
    SChartNumberRange *yRange = [[SChartNumberRange alloc] initWithMinimum:@(-2) andMaximum:@2];
    return yRange;
}

@end
