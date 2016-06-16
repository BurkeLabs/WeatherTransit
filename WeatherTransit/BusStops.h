//
//  BusStops.h
//  WeatherTransit
//
//  Created by Michelle Burke on 5/4/16.
//  Copyright © 2016 Burke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BusStops : NSObject

@property NSString *route;
@property NSString *direction;
@property int stopID;
@property NSString *stopName;

@end
