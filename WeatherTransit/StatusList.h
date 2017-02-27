//
//  StatusList.h
//  WeatherTransit
//
//  Created by Michelle Burke on 12/22/16.
//  Copyright © 2016 Burke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatusList : NSObject

@property NSString *Route;
@property NSString *RouteColorCode;
@property NSString *RouteTextColor;
@property NSString *ServiceId;
@property NSString *RouteURL;
@property NSString *RouteStatus;
@property NSString *RouteStatusColor;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
