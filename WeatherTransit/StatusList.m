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
