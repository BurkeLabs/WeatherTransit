//
//  ETA.m
//  WeatherTransit
//
//  Created by Michelle Burke on 3/18/16.
//  Copyright © 2016 Burke. All rights reserved.
//

#import "ETA.h"

@implementation ETA

-(NSString *)description{
    return [NSString stringWithFormat:@"StationID, %i, StationName, %@", _stationID, _stationName];
}

@end
