//
//  Upcoming.h
//  WeatherTransit
//
//  Created by Michelle Burke on 5/5/16.
//  Copyright © 2016 Burke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Upcoming : NSObject

@property int stopID;
@property NSString *vehicleID;
@property NSString *message;
@property NSString *timeStamp;
@property NSString *stopName;
@property NSString *destination;
@property NSString *route;
@property NSString *routeDirection;
@property int destinationPoint;
@property NSString *predictionTime;
@property NSString *routeDestination;
@property BOOL delay;

@end
