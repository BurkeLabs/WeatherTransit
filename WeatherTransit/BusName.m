//
//  BusName.m
//  WeatherTransit
//
//  Created by Michelle Burke on 4/21/16.
//  Copyright © 2016 Burke. All rights reserved.
//

#import "BusName.h"

@implementation BusName

-(NSString *)description{
    return [NSString stringWithFormat:@"route, %@, routeName, %@", _route, _routeName];
}

@end
