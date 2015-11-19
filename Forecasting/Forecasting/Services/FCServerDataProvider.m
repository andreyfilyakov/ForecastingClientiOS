//
//  FCServerDataProvider.m
//  Forecasting
//
//  Created by Andrey Filyakov on 16.11.15.
//  Copyright © 2015 Andrey Filyakov. All rights reserved.
//

#import "FCServerDataProvider.h"
#import <AFNetworking/AFNetworking.h>

#define kFCServerURL @"http://95.79.7.149:8081/Forecasting/api/parameters"

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
                completion:(void(^)(FCResponseModel *response))completionBlock {
    NSDictionary *parameters = @{
                                 @"val1":[NSString stringWithFormat:@"%f", request.val1.doubleValue],
                                 @"val2":[NSString stringWithFormat:@"%f", request.val2.doubleValue],
                                 @"val3":[NSString stringWithFormat:@"%f", request.val3.doubleValue],
                                 @"Tm":[NSString stringWithFormat:@"%f", request.tm.doubleValue]
                                 };
    [self makeRequestWithParameters:parameters completion:^(NSDictionary *data) {
        FCResponseModel *response = [FCResponseModel responseWithJSON:data];
        completionBlock(response);
    }];
}

- (void)makeRequestWithParameters:(NSDictionary *)parameters
                       completion:(void (^)(NSDictionary *data))completionBlock {
    [[AFHTTPRequestOperationManager manager] GET:kFCServerURL
                                      parameters:parameters
                                         success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                                             completionBlock(responseObject);
                                         } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                                             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"HTTP request is failed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                             [alert show];
                                         }];
}

@end
