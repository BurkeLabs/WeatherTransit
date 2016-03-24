//
//  CTAStatusViewController.m
//  WeatherTransit
//
//  Created by Michelle Burke on 1/15/16.
//  Copyright © 2016 BurkeLabs. All rights reserved.
//

#import "CTAStatusViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CTAStatusViewController () <UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate>

@property NSArray *busStatus;
@property NSString *busRoute;
@property CLLocationManager *ctaStatus;
@property MKPointAnnotation *pointAnnotation;

@end

@implementation CTAStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.busStatus.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@""];
    //cell.textLabel.text = self.busRoute.text;
    return cell;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *location = locations.firstObject;
    if (location.verticalAccuracy < 1000 && location.horizontalAccuracy < 1000) {
        [self.ctaStatus stopUpdatingLocation];
        [self reverseGeocode:location];
    }
}

-(void)reverseGeocode:(CLLocation *)location
{
    CLGeocoder *geocoder = [CLGeocoder new];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        [self findBusStopNear:location];
    }];
}

-(void)findBusStopNear:(CLLocation *)location
{
    MKLocalSearchRequest *request = [MKLocalSearchRequest new];
    request.naturalLanguageQuery = @"Bus Stop";
    request.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1, 1));
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
    [search startWithCompletionHandler:^(MKLocalSearchResponse * _Nullable response, NSError * _Nullable error) {
        //do stuff
    }];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(nonnull NSError *)error
{
    NSLog(@"couldn't find user\t%@", error);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end