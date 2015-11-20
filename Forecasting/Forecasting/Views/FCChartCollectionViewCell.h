//
//  FCChartCollectionViewCell.h
//  Forecasting
//
//  Created by Andrey Filyakov on 21.11.15.
//  Copyright © 2015 Andrey Filyakov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCBaseChart.h"

@interface FCChartCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) FCBaseChart *chart;

@end
