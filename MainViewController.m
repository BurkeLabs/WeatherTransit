//
//  MainViewController.m
//  WeatherTransit
//
//  Created by Michelle Burke on 1/2/16.
//  Copyright © 2016 BurkeLabs. All rights reserved.
//

#import "MainViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
//#import "TransitInfo.h"

@interface MainViewController () <CLLocationManagerDelegate, MKMapViewDelegate, NSXMLParserDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property NSXMLParser *ctaTrain;
@property NSArray *ctaTrainArray;
@property CLLocationManager *transit;
@property NSArray *ctaStatus;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.transit = [CLLocationManager new];

    [self.transit requestWhenInUseAuthorization];
    self.mapView.showsUserLocation = YES;
    self.transit.delegate = self;

    self.ctaTrain = [[NSXMLParser alloc] initWithContentsOfURL:@"http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=986d0447c8104e648015675ec4e28c68&stpid="];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}

@end

/*
 NSURL *url = [NSURL URLWithString:@"http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=986d0447c8104e648015675ec4e28c68&stpid="];
 NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
 dispatch_async(dispatch_get_main_queue(), ^{
 MKPointAnnotation *annotation;
 [self.mapView addAnnotation:annotation];
 });
 }];
 [task resume];
 */