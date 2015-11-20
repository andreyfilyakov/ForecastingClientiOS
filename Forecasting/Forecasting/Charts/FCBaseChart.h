//
//  FCBaseChart.h
//  Forecasting
//
//  Created by Andrey Filyakov on 16.11.15.
//  Copyright © 2015 Andrey Filyakov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShinobiCharts/ShinobiCharts.h>

@interface FCBaseChart : NSObject <SChartDatasource>

@property (nonatomic, strong) NSString *title;

- (instancetype)initWithData:(NSArray *)data title:(NSString *)title;
- (void)addToView:(UIView *)view;
- (void)removeFromSuperview;
- (void)updateChart;

@end
