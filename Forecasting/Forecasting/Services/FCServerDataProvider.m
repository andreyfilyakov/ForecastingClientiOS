//
//  FCServerDataProvider.m
//  Forecasting
//
//  Created by Andrey Filyakov on 16.11.15.
//  Copyright © 2015 Andrey Filyakov. All rights reserved.
//

#import "FCServerDataProvider.h"
#import <AFNetworking/AFNetworking.h>

#define kFCServerURL @"http://5.166.196.18:8080/Forecasting/api/parameters"

@implementation FCServerDataProvider

static FCServerDataProvider *_sharedProvider = nil;
static dispatch_once_t onceToken;

+ (instancetype)sharedInstance {
    dispatch_once(&onceToken, ^{
        if (_sharedProvider == nil)
            
        {
            _sharedProvider = [FCServerDataProvider new];
        }
    });
    
    return _sharedProvider;
}

- (void)getDataWithRequest:(FCRequestModel *)request
                completion:(void(^)(NSDictionary *response))completionBlock {
    NSDictionary *parameters = @{
                                 @"val1":[NSString stringWithFormat:@"%f", request.val1.doubleValue],
                                 @"val2":[NSString stringWithFormat:@"%f", request.val2.doubleValue],
                                 @"val3":[NSString stringWithFormat:@"%f", request.val3.doubleValue],
                                 @"tm":[NSString stringWithFormat:@"%f", request.tm.doubleValue]
                                 };
    [self makeRequestWithParameters:parameters completion:^(NSDictionary *data) {
        // TODO: parse response
        completionBlock(data);
    }];
}

- (void)makeRequestWithParameters:(NSDictionary *)parameters
                       completion:(void (^)(NSDictionary *data))completionBlock {
    [[AFHTTPRequestOperationManager manager] GET:kFCServerURL
                                      parameters:parameters
                                         success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                                             completionBlock(responseObject);
                                         } failure:nil];
}

@end
