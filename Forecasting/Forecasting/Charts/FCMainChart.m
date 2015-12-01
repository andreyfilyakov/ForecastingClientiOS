//
//  FCMainChart.m
//  Forecasting
//
//  Created by Andrey Filyakov on 01.12.15.
//  Copyright © 2015 Andrey Filyakov. All rights reserved.
//

#import "FCMainChart.h"

@implementation FCMainChart

- (SChartNumberRange *)chartYRange {
    SChartNumberRange *yRange = [[SChartNumberRange alloc] initWithMinimum:@(-10) andMaximum:@10];
    return yRange;
}

@end
