//
//  FCEnterParametersViewController.m
//  Forecasting
//
//  Created by Andrey Filyakov on 17.11.15.
//  Copyright © 2015 Andrey Filyakov. All rights reserved.
//

#import "FCEnterParametersViewController.h"
#import "FCChartsViewController.h"
#import "FCServerDataProvider.h"

@interface FCEnterParametersViewController ()

@property (weak, nonatomic) IBOutlet UITextField *val1TextField;
@property (weak, nonatomic) IBOutlet UITextField *val2TextField;
@property (weak, nonatomic) IBOutlet UITextField *val3TextField;
@property (weak, nonatomic) IBOutlet UITextField *tmTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;
@property (weak, nonatomic) IBOutlet UIButton *calculateButton;

@end

@implementation FCEnterParametersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Enter parameters of algorythm:";
    self.val1TextField.text = @"0.2";
    self.val2TextField.text = @"0.9";
    self.val3TextField.text = @"90";
    self.tmTextField.text = @"500";
}

- (IBAction)calculate:(id)sender {
    [self.loadingIndicator startAnimating];
    [self.calculateButton setUserInteractionEnabled:NO];
    FCRequestModel *request = [FCRequestModel requestWithVal1:@(self.val1TextField.text.integerValue)
                                                         val2:@(self.val2TextField.text.integerValue)
                                                         val3:@(self.val3TextField.text.integerValue)
                                                           tm:@(self.tmTextField.text.integerValue)];
    [[FCServerDataProvider sharedInstance] getDataWithRequest:request
                                                   completion:^(FCResponseModel *response) {
                                                       FCChartsViewController *chartsViewController = [self.storyboard instantiateViewControllerWithIdentifier:[FCChartsViewController storyboardId]];
                                                       chartsViewController.response = response;
                                                       [self.navigationController pushViewController:chartsViewController animated:YES];
                                                       [self.calculateButton setUserInteractionEnabled:YES];
                                                       [self.loadingIndicator stopAnimating];
                                                   }];
}

@end
