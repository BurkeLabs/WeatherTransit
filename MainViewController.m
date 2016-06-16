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
#import "Train.h"

@interface MainViewController () <CLLocationManagerDelegate, MKMapViewDelegate, NSXMLParserDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property NSXMLParser *ctaTrain;
@property NSArray *ctaTrainArray;
@property CLLocationManager *transitLocation;
@property NSArray *ctaStatus;
@property NSMutableArray *etas;
@property Train *currentParsedEta;
@property NSDateFormatter *ctaDateFormat;

typedef enum {
    NONE,
    staId,
    stpId,
    staNm,
    rt,
    destNm,
    prdt,
    arrT,
    lat,
    lon,
} ETAField;

@property ETAField currentField;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.transitLocation = [CLLocationManager new];
//    self.mapView.delegate = self;
    [self.transitLocation requestWhenInUseAuthorization];
    self.mapView.showsUserLocation = YES;
    self.transitLocation.delegate = self;
    self.ctaTrain.delegate = self;

    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance (CLLocationCoordinate2DMake(41.9456354, -87.6679754), 5000, 5000);
    [self.mapView setRegion:region animated:YES];

    [self loadTransitData];
    [self addAnnotation];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
//    MKUserLocation *userLocation = self.mapView.userLocation;
}

-(void)loadTransitData {
    self.etas = [NSMutableArray new];
    self.currentParsedEta = NULL;
    self.currentField = 0;

    BOOL success;
    NSURL *xmlURL = [NSURL URLWithString:@"http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=986d0447c8104e648015675ec4e28c68&stpid="];

     self.ctaTrain = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    [self.ctaTrain setDelegate:self];
//    [self.ctaTrain setShouldResolveExternalEntities:YES];
    success = [self.ctaTrain parse];
//    NSLog(@"%d, Successful or not successful %@", success, self.etas);
//    [self.ctaTrain release];
}

-(void)addAnnotation
{
    for (Train *train in self.etas) {
        MKPointAnnotation *point;
        point = [MKPointAnnotation new];
        point.coordinate = CLLocationCoordinate2DMake(train.latitude, train.longitude);
        point.title = train.stationName;
        [self.mapView addAnnotation:point];
    }
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    MKAnnotationView *aView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CTAStations"];
    aView.image = [UIImage imageNamed:@"railroad_car"];
    return aView;
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if ([elementName  isEqual: @"eta"]) {
        self.currentParsedEta = [Train new];
    } else if (self.currentParsedEta) {
        if([elementName  isEqual: @"staId"]) {
            self.currentField = staId;
        } else if ([elementName isEqual:@"stpId"]) {
            self.currentField = stpId;
        } else if ([elementName isEqual:@"staNm"]) {
            self.currentField = staNm;
        } else if ([elementName isEqual:@"rt"]) {
            self.currentField = rt;
        } else if ([elementName isEqual:@"destNm"]) {
            self.currentField = destNm;
        } else if ([elementName isEqual:@"prdt"]) {
            self.currentField = prdt;
        } else if ([elementName isEqual:@"arrT"]) {
            self.currentField = arrT;
        } else if ([elementName isEqual:@"lat"]) {
            self.currentField = lat;
        } else if ([elementName isEqual:@"lon"]) {
            self.currentField = lon;
        }
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName  isEqual: @"eta"]) {
        [self.etas addObject:self.currentParsedEta];
        self.currentParsedEta = NULL;
    } else {
        self.currentField = NONE;
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    [self.ctaDateFormat setDateFormat:@"yyyyMMdd hh:mm:ss"];

    if (self.currentParsedEta) {
        switch (self.currentField) {
            case staId:
                self.currentParsedEta.stationID = [string intValue];
            break;
            case stpId:
                self.currentParsedEta.stopID = [string intValue];
            break;
            case staNm:
                self.currentParsedEta.stationName = string;
            break;
            case rt:
                self.currentParsedEta.route = string;
                break;
            case destNm:
                self.currentParsedEta.destinationName = string;
            break;
            case prdt:
                self.currentParsedEta.predictionTime = [self.ctaDateFormat dateFromString:string];
            break;
            case arrT:
                self.currentParsedEta.nextTrain = [self.ctaDateFormat dateFromString:string];
                break;
            case lat:
                self.currentParsedEta.latitude = [string floatValue];
                break;
            case lon:
                self.currentParsedEta.longitude = [string floatValue];
                break;
            case NONE:
                break;
            default:
                break;
        }
    }
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(nonnull NSError *)error
{
    NSLog(@"couldn't find user\t%@", error);
}

@end