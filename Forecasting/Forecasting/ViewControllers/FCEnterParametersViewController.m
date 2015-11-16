//
//  FCEnterParametersViewController.m
//  Forecasting
//
//  Created by Andrey Filyakov on 17.11.15.
//  Copyright © 2015 Andrey Filyakov. All rights reserved.
//

#import "FCEnterParametersViewController.h"
#import "FCChartsViewController.h"

@interface FCEnterParametersViewController ()

@end

@implementation FCEnterParametersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Enter parameters of algorythm:";
}

- (IBAction)calculate:(id)sender {
    // TODO: send data to the server
    [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:[FCChartsViewController storyboardId]] animated:YES];
}

@end
