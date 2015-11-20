//
//  FCChartsViewController.m
//  Forecasting
//
//  Created by Andrey Filyakov on 16.11.15.
//  Copyright © 2015 Andrey Filyakov. All rights reserved.
//

#import "FCChartsViewController.h"
#import "FCChartCollectionViewCell.h"
#import "FCBaseChart.h"

#define kFCNumberOfSections 1
#define kFCNumberOfItemsInSection 4

@interface FCChartsViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (nonatomic, strong) FCBaseChart *sw0Chart;
@property (nonatomic, strong) FCBaseChart *sw1Chart;
@property (nonatomic, strong) FCBaseChart *sw2Chart;
@property (nonatomic, strong) FCBaseChart *sw3Chart;

@property (nonatomic, strong) FCBaseChart *slms0Chart;
@property (nonatomic, strong) FCBaseChart *slms1Chart;
@property (nonatomic, strong) FCBaseChart *slms2Chart;
@property (nonatomic, strong) FCBaseChart *slms3Chart;

@property (nonatomic, strong) FCBaseChart *s0ErrorChart;
@property (nonatomic, strong) FCBaseChart *s1ErrorChart;
@property (nonatomic, strong) FCBaseChart *s2ErrorChart;
@property (nonatomic, strong) FCBaseChart *s3ErrorChart;

@property (nonatomic, assign) NSUInteger currentSegment;
@property (nonatomic, strong) NSArray *currentCharts;

@end

@implementation FCChartsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Charts";
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    self.sw0Chart = [[FCBaseChart alloc] initWithData:@[
                                                        self.response.x,
                                                        self.response.s0,
                                                        self.response.y0
                                                        ]
                                                title:@"W0"];
    self.sw1Chart = [[FCBaseChart alloc] initWithData:@[
                                                        self.response.x,
                                                        self.response.s1,
                                                        self.response.y1
                                                        ]
                                                title:@"W1"];
    self.sw2Chart = [[FCBaseChart alloc] initWithData:@[
                                                        self.response.x,
                                                        self.response.s2,
                                                        self.response.y2
                                                        ]
                                                title:@"W2"];
    self.sw3Chart = [[FCBaseChart alloc] initWithData:@[
                                                        self.response.x,
                                                        self.response.s3,
                                                        self.response.y3
                                                        ]
                                                title:@"W3"];
    
    self.slms0Chart = [[FCBaseChart alloc] initWithData:@[
                                                          self.response.x,
                                                          self.response.s0,
                                                          self.response.lms0
                                                          ]
                                                  title:@"LMS0"];
    self.slms1Chart = [[FCBaseChart alloc] initWithData:@[
                                                          self.response.x,
                                                          self.response.s1,
                                                          self.response.lms1
                                                          ]
                                                  title:@"LMS1"];
    self.slms2Chart = [[FCBaseChart alloc] initWithData:@[
                                                          self.response.x,
                                                          self.response.s2,
                                                          self.response.lms2
                                                          ]
                                                  title:@"LMS2"];
    self.slms3Chart = [[FCBaseChart alloc] initWithData:@[
                                                          self.response.x,
                                                          self.response.s3,
                                                          self.response.lms3
                                                          ]
                                                  title:@"LMS3"];
    
    self.s0ErrorChart = [[FCBaseChart alloc] initWithData:@[
                                                            self.response.x,
                                                            self.response.w0Error,
                                                            self.response.lms0Error
                                                            ]
                                                    title:@"S0 Error"];
    self.s1ErrorChart = [[FCBaseChart alloc] initWithData:@[
                                                            self.response.x,
                                                            self.response.w1Error,
                                                            self.response.lms1Error
                                                            ]
                                                    title:@"S1 Error"];
    self.s2ErrorChart = [[FCBaseChart alloc] initWithData:@[
                                                            self.response.x,
                                                            self.response.w2Error,
                                                            self.response.lms2Error
                                                            ]
                                                    title:@"S2 Error"];
    self.s3ErrorChart = [[FCBaseChart alloc] initWithData:@[
                                                            self.response.x,
                                                            self.response.w3Error,
                                                            self.response.lms3Error
                                                            ]
                                                    title:@"S3 Error"];
    
    [self setCurrentSegment:0];
}

- (void)setCurrentSegment:(NSUInteger)currentSegment {
    _currentSegment = currentSegment;
    switch (_currentSegment) {
        case 0:
            self.currentCharts = @[
                                   self.sw0Chart,
                                   self.sw1Chart,
                                   self.sw2Chart,
                                   self.sw3Chart
                                   ];
            break;
            
        case 1:
            self.currentCharts = @[
                                   self.slms0Chart,
                                   self.slms1Chart,
                                   self.slms2Chart,
                                   self.slms3Chart
                                   ];
            break;
            
        case 2:
            self.currentCharts = @[
                                   self.s0ErrorChart,
                                   self.s1ErrorChart,
                                   self.s2ErrorChart,
                                   self.s3ErrorChart
                                   ];
            break;
            
        default:
            break;
    }
}

+ (NSString *)storyboardId {
    return @"ChartsViewController";
}

- (IBAction)algorythmSelected:(id)sender {
    [self setCurrentSegment:self.segmentedControl.selectedSegmentIndex];
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return kFCNumberOfItemsInSection;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return kFCNumberOfSections;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FCChartCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"ChartCell" forIndexPath:indexPath];
    cell.chart = [self.currentCharts objectAtIndex:indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return CGSizeMake(self.collectionView.bounds.size.width / 2 - 25, self.collectionView.bounds.size.height / 2 - 25);
}

@end
