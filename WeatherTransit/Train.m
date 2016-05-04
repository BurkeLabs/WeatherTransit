//
//  ETA.m
//  WeatherTransit
//
//  Created by Michelle Burke on 3/18/16.
//  Copyright © 2016 Burke. All rights reserved.
//

#import "Train.h"

@implementation Train

-(NSString *)description{
    return [NSString stringWithFormat:@"StationID, %i, StationName, %@", _stationID, _stationName];
}

@end
