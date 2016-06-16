//
//  Upcoming.m
//  WeatherTransit
//
//  Created by Michelle Burke on 5/5/16.
//  Copyright © 2016 Burke. All rights reserved.
//

#import "Upcoming.h"

@implementation Upcoming

-(NSString *)description{
    return [NSString stringWithFormat:@"stopID %i, stopName, %@, predictionTime %@", _stopID, _stopName, _predictionTime];
}

@end
