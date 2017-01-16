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


/*
<xs:element name="Route" type="xs:string" />
transitchicago.com v2.0 / rev. 2016-09-29 / p.6
<xs:element name="RouteColorCode" type="xs:string" />
<xs:element name="RouteTextColor" type="xs:string" />
<xs:element name="ServiceId" type="xs:string" />
<xs:element name="RouteURL" type="xs:string" />
<xs:element name="RouteStatus" type="xs:string" />
<xs:element name="RouteStatusColor" type="xs:string" />
*/
@end
