//
//  FCChartCollectionViewCell.m
//  Forecasting
//
//  Created by Andrey Filyakov on 21.11.15.
//  Copyright © 2015 Andrey Filyakov. All rights reserved.
//

#import "FCChartCollectionViewCell.h"

@interface FCChartCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIView *chartView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation FCChartCollectionViewCell

- (void)setChart:(FCBaseChart *)chart {
    [_chart removeFromSuperview];
    _chart = chart;
    self.titleLabel.text = _chart.title;
    [_chart addToView:self.chartView];
}

@end
