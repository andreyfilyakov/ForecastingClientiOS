//
//  FCServerDataProvider.h
//  Forecasting
//
//  Created by Andrey Filyakov on 16.11.15.
//  Copyright © 2015 Andrey Filyakov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FCRequestModel.h"
#import "FCResponseModel.h"

@interface FCServerDataProvider : NSObject

+ (instancetype)sharedInstance;

- (void)getDataWithRequest:(FCRequestModel *)request
                completion:(void(^)(FCResponseModel *response))completionBlock;

@end
