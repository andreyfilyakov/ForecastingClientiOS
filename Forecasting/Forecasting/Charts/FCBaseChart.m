//
//  FCBaseChart.m
//  Forecasting
//
//  Created by Andrey Filyakov on 16.11.15.
//  Copyright © 2015 Andrey Filyakov. All rights reserved.
//

#import "FCBaseChart.h"

@interface FCBaseChart ()

@property (nonatomic, strong) ShinobiChart *chart;
@property (nonatomic, strong) NSArray *data;

@end

@implementation FCBaseChart

- (instancetype)initWithData:(NSArray *)data title:(NSString *)title {
    self = [super init];
    if (self) {
        self.data = data;
        self.title = title;
        self.chart = [[ShinobiChart alloc] initWithFrame:CGRectZero];
        self.chart.licenseKey = @"mjxSEmGyeK335XLMjAxNTEyMTZBbmRyZXkuRmlseWFrb3ZASGFybWFuLmNvbQ==WLGLG6uCeIXdHPj74kCh4W9/iTuRyR/EjiyMpBgkXEv/hw0oKmmhVL9zjX+6O2bq839oIoIAvJ08/BRXT7dUqMED9qXPyu1h9zXQ3Gkio9WLHfRie93eZzU3K8fdrtHRyumIFnL2v2J/KFkWY2hCMQrdpZxM=AXR/y+mxbZFM+Bz4HYAHkrZ/ekxdI/4Aa6DClSrE4o73czce7pcia/eHXffSfX9gssIRwBWEPX9e+kKts4mY6zZWsReM+aaVF0BL6G9Vj2249wYEThll6JQdqaKda41AwAbZXwcssavcgnaHc3rxWNBjJDOk6Cd78fr/LwdW8q7gmlj4risUXPJV0h7d21jO1gzaaFCPlp5G8l05UUe2qe7rKbarpjoddMoXrpErC9j8Lm5Oj7XKbmciqAKap+71+9DGNE2sBC+sY4V/arvEthfhk52vzLe3kmSOsvg5q+DQG/W9WbgZTmlMdWHY2B2nbgm3yZB7jFCiXH/KfzyE1A==PFJTQUtleVZhbHVlPjxNb2R1bHVzPnh6YlRrc2dYWWJvQUh5VGR6dkNzQXUrUVAxQnM5b2VrZUxxZVdacnRFbUx3OHZlWStBK3pteXg4NGpJbFkzT2hGdlNYbHZDSjlKVGZQTTF4S2ZweWZBVXBGeXgxRnVBMThOcDNETUxXR1JJbTJ6WXA3a1YyMEdYZGU3RnJyTHZjdGhIbW1BZ21PTTdwMFBsNWlSKzNVMDg5M1N4b2hCZlJ5RHdEeE9vdDNlMD08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+";
        self.chart.datasource = self;
        self.chart.backgroundColor = [UIColor whiteColor];
        [self updateChart];
    }
    return self;
}

- (void)addToView:(UIView *)view {
    self.chart.autoresizingMask = ~UIViewAutoresizingNone;
    self.chart.frame = view.bounds;
    [view addSubview:self.chart];
}

- (void)removeFromSuperview {
    [self.chart removeFromSuperview];
}

- (void)updateChart {
    self.chart.xAxis = [self chartXAxis];
}

- (SChartNumberAxis *)chartXAxis {
    SChartNumberAxis *xAxis = [[SChartNumberAxis alloc] initWithRange:[self chartXRange]];
    return xAxis;
}

- (SChartNumberRange *)chartXRange {
    SChartNumberRange *xRange = [[SChartNumberRange alloc] initWithMinimum:@(-1.1) andMaximum:@1.1];
    return xRange;
}

- (SChartNumberAxis *)chartYAxis {
    SChartNumberAxis *yAxis = [[SChartNumberAxis alloc] initWithRange:[self chartYRange]];
    return yAxis;
}

- (SChartNumberRange *)chartYRange {
    SChartNumberRange *yRange = [[SChartNumberRange alloc] initWithMinimum:@(-1.5) andMaximum:@1.5];
    return yRange;
}

- (NSInteger)numberOfSeriesInSChart:(ShinobiChart *)chart {
    return [self.data count] - 1;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
    SChartLineSeries *series = [[SChartLineSeries alloc] init];
    SChartLineSeriesStyle *style = [[SChartLineSeriesStyle alloc] init];
    UIColor *lineColor;
    switch (index) {
        case 0:
            lineColor = [UIColor redColor];
            break;
        case 1:
            lineColor = [UIColor blueColor];
            break;
        case 2:
            lineColor = [UIColor greenColor];
            break;
        case 3:
            lineColor = [UIColor orangeColor];
            break;
    }
    style.lineColor = lineColor;
    style.areaLineColor = lineColor;
    series.style = style;
    return series;
}

- (NSInteger)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
    NSArray *dataArray = [self.data objectAtIndex:seriesIndex + 1];
    return [dataArray count];
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
    SChartDataPoint *dataPoint = [[SChartDataPoint alloc] init];
    NSArray *xArray = [self.data objectAtIndex:0];
    NSArray *yArray = [self.data objectAtIndex:seriesIndex + 1];
    dataPoint.xValue = @([[xArray objectAtIndex:dataIndex] doubleValue]);
    dataPoint.yValue = @([[yArray objectAtIndex:dataIndex] doubleValue]);
    return dataPoint;
}

@end
