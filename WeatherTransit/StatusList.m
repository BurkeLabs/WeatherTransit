//
//  StatusList.m
//  WeatherTransit
//
//  Created by Michelle Burke on 12/22/16.
//  Copyright © 2016 Burke. All rights reserved.
//

#import "StatusList.h"

@implementation StatusList

-(NSString *)description{
    return [NSString stringWithFormat:@"Route %@, RouteStatus %@, ", _Route, _RouteStatus];
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];

    if (self) {
        self.Route = dictionary[@"Route"];
        self.RouteStatus = dictionary[@"RouteStatus"];
    }
    return self;
}

@end

/*
 {
 "CTARoutes": {
 "TimeStamp": "2017-01-16T11:03:39",
 "ErrorCode": "0",
 "ErrorMessage": null,
 "RouteInfo": {
 "Route": "Red Line",
 "RouteColorCode": "c60c30",
 "RouteTextColor": "ffffff",
 "ServiceId": "Red",
 "RouteURL": {
 "#cdata-section": "http://www.transitchicago.com/riding_cta/systemguide/redline.aspx"
 },
 "RouteStatus": "Planned Work",
 "RouteStatusColor": "06c"
 }
 }
 }
*/
