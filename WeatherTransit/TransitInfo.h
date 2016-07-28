//
//  TransitInfo.h
//  WeatherTransit
//
//  Created by Michelle Burke on 1/14/16.
//  Copyright © 2016 BurkeLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransitInfo : NSObject

//@property NSArray *ctaBus;
//@property NSArray *ctaTrain;
@property NSString *Route;
@property NSString *ServiceId;
@property NSString *RouteStatus;
@property NSString *RouteStatusColor;

//-(void)getTransitInfo;

@end

/* .m file
 -(NSString *)description{
 return [NSString stringWithFormat:@"Route %@, ServiceID %@, RouteStatus %@, RouteStatusColor %@", _Route, _ServiceId, _RouteStatus, _RouteStatusColor];
 }
*/