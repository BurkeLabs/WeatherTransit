//
//  BusStops.m
//  WeatherTransit
//
//  Created by Michelle Burke on 5/4/16.
//  Copyright © 2016 Burke. All rights reserved.
//

#import "BusStops.h"

@implementation BusStops

-(NSString *)description{
    return [NSString stringWithFormat:@"route %@, direction %@, stopID %d, stopName, %@", _route, _direction, _stopID, _stopName];
}

@end
