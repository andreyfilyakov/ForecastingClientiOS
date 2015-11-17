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
    self.val1TextField.text = @"0";
    self.val2TextField.text = @"0";
    self.val3TextField.text = @"0";
    self.tmTextField.text = @"0";
}

- (IBAction)calculate:(id)sender {
    [self.loadingIndicator startAnimating];
    [self.calculateButton setUserInteractionEnabled:NO];
    FCRequestModel *request = [FCRequestModel requestWithVal1:@(self.val1TextField.text.integerValue)
                                                         val2:@(self.val2TextField.text.integerValue)
                                                         val3:@(self.val3TextField.text.integerValue)
                                                           tm:@(self.tmTextField.text.integerValue)];
    [[FCServerDataProvider sharedInstance] getDataWithRequest:request
                                                   completion:^(NSDictionary *response) {
                                                       
                                                           [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:[FCChartsViewController storyboardId]] animated:YES];
                                                       [self.calculateButton setUserInteractionEnabled:YES];
                                                       [self.loadingIndicator stopAnimating];
                                                   }];
}

@end
