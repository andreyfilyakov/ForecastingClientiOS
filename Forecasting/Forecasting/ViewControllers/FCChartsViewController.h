//
//  FCChartsViewController.h
//  Forecasting
//
//  Created by Andrey Filyakov on 16.11.15.
//  Copyright © 2015 Andrey Filyakov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCResponseModel.h"

@interface FCChartsViewController : UIViewController

@property (nonatomic, strong) FCResponseModel *response;

+ (NSString *)storyboardId;

@end
