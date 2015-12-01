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
#import "FCMainChart.h"
#import "FCWChart.h"

#define kFCNumberOfSections 1
#define kFCNumberOfItemsInSection 4

@interface FCChartsViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (nonatomic, strong) FCMainChart *sw0Chart;
@property (nonatomic, strong) FCMainChart *sw1Chart;
@property (nonatomic, strong) FCMainChart *sw2Chart;
@property (nonatomic, strong) FCMainChart *sw3Chart;

@property (nonatomic, strong) FCMainChart *slms0Chart;
@property (nonatomic, strong) FCMainChart *slms1Chart;
@property (nonatomic, strong) FCMainChart *slms2Chart;
@property (nonatomic, strong) FCMainChart *slms3Chart;

@property (nonatomic, strong) FCBaseChart *s0ErrorChart;
@property (nonatomic, strong) FCBaseChart *s1ErrorChart;
@property (nonatomic, strong) FCBaseChart *s2ErrorChart;
@property (nonatomic, strong) FCBaseChart *s3ErrorChart;

@property (nonatomic, strong) FCWChart *winnerW0Chart;
@property (nonatomic, strong) FCWChart *winnerW1Chart;
@property (nonatomic, strong) FCWChart *winnerW2Chart;
@property (nonatomic, strong) FCWChart *winnerW3Chart;

@property (nonatomic, strong) FCWChart *lmsW0Chart;
@property (nonatomic, strong) FCWChart *lmsW1Chart;
@property (nonatomic, strong) FCWChart *lmsW2Chart;
@property (nonatomic, strong) FCWChart *lmsW3Chart;

@property (nonatomic, assign) NSUInteger currentSegment;
@property (nonatomic, strong) NSArray *currentCharts;

@end

@implementation FCChartsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Charts";
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    self.sw0Chart = [[FCMainChart alloc] initWithData:@[
                                                        self.response.x,
                                                        self.response.s0,
                                                        self.response.y0
                                                        ]
                                                title:@"W0"];
    self.sw1Chart = [[FCMainChart alloc] initWithData:@[
                                                        self.response.x,
                                                        self.response.s1,
                                                        self.response.y1
                                                        ]
                                                title:@"W1"];
    self.sw2Chart = [[FCMainChart alloc] initWithData:@[
                                                        self.response.x,
                                                        self.response.s2,
                                                        self.response.y2
                                                        ]
                                                title:@"W2"];
    self.sw3Chart = [[FCMainChart alloc] initWithData:@[
                                                        self.response.x,
                                                        self.response.s3,
                                                        self.response.y3
                                                        ]
                                                title:@"W3"];
    
    self.slms0Chart = [[FCMainChart alloc] initWithData:@[
                                                          self.response.x,
                                                          self.response.s0,
                                                          self.response.lms0
                                                          ]
                                                  title:@"LMS0"];
    self.slms1Chart = [[FCMainChart alloc] initWithData:@[
                                                          self.response.x,
                                                          self.response.s1,
                                                          self.response.lms1
                                                          ]
                                                  title:@"LMS1"];
    self.slms2Chart = [[FCMainChart alloc] initWithData:@[
                                                          self.response.x,
                                                          self.response.s2,
                                                          self.response.lms2
                                                          ]
                                                  title:@"LMS2"];
    self.slms3Chart = [[FCMainChart alloc] initWithData:@[
                                                          self.response.x,
                                                          self.response.s3,
                                                          self.response.lms3
                                                          ]
                                                  title:@"LMS3"];
    
    self.s0ErrorChart = [[FCBaseChart alloc] initWithData:@[
                                                            self.response.x,
                                                            self.response.lms0Error,
                                                            self.response.w0Error
                                                            ]
                                                    title:@"S0 Error"];
    self.s1ErrorChart = [[FCBaseChart alloc] initWithData:@[
                                                            self.response.x,
                                                            self.response.lms1Error,
                                                            self.response.w1Error
                                                            ]
                                                    title:@"S1 Error"];
    self.s2ErrorChart = [[FCBaseChart alloc] initWithData:@[
                                                            self.response.x,
                                                            self.response.lms2Error,
                                                            self.response.w2Error
                                                            ]
                                                    title:@"S2 Error"];
    self.s3ErrorChart = [[FCBaseChart alloc] initWithData:@[
                                                            self.response.x,
                                                            self.response.lms3Error,
                                                            self.response.w3Error
                                                            ]
                                                    title:@"S3 Error"];
    
    NSMutableArray *winnerW = [NSMutableArray arrayWithObject:self.response.wX];
    [winnerW addObjectsFromArray:self.response.winnerW];
    self.winnerW0Chart = [[FCWChart alloc] initWithData:winnerW title:@"W0"];
    self.winnerW1Chart = [[FCWChart alloc] initWithData:winnerW title:@"W1"];
    self.winnerW2Chart = [[FCWChart alloc] initWithData:winnerW title:@"W2"];
    self.winnerW3Chart = [[FCWChart alloc] initWithData:winnerW title:@"W3"];
    
    NSMutableArray *lmsW = [NSMutableArray arrayWithObject:self.response.wX];
    [lmsW addObjectsFromArray:self.response.lmsW];
    self.lmsW0Chart = [[FCWChart alloc] initWithData:lmsW title:@"W0"];
    self.lmsW1Chart = [[FCWChart alloc] initWithData:lmsW title:@"W1"];
    self.lmsW2Chart = [[FCWChart alloc] initWithData:lmsW title:@"W2"];
    self.lmsW3Chart = [[FCWChart alloc] initWithData:lmsW title:@"W3"];
    
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
            
        case 3:
            self.currentCharts = @[
                                   self.winnerW0Chart,
                                   self.winnerW1Chart,
                                   self.winnerW2Chart,
                                   self.winnerW3Chart
                                   ];
            break;
            
        case 4:
            self.currentCharts = @[
                                   self.lmsW0Chart,
                                   self.lmsW1Chart,
                                   self.lmsW2Chart,
                                   self.lmsW3Chart
                                   ];
            
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
