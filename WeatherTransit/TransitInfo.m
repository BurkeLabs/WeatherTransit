//
//  TransitInfo.m
//  WeatherTransit
//
//  Created by Michelle Burke on 1/14/16.
//  Copyright © 2016 BurkeLabs. All rights reserved.
//

#import "TransitInfo.h"

@implementation TransitInfo

-(NSString *)description{
    return [NSString stringWithFormat:@"Route %@, ServiceID %@, RouteStatus %@, RouteStatusColor %@", _Route, _ServiceId, _RouteStatus, _RouteStatusColor];
}

@end
