//
//  DisplayStatus.m
//  WeatherTransit
//
//  Created by Michelle Burke on 1/26/17.
//  Copyright © 2017 Burke. All rights reserved.
//

#import "DisplayStatus.h"

@implementation DisplayStatus

-(NSString *)description{
    return [NSString stringWithFormat:@"Headline %@, Short Description %@", _Headline, _ShortDescription];
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];

    if (self) {
        self.Headline = dictionary[@"Headline"];
        self.ShortDescription = dictionary[@"ShortDescription"];
    }
    return self;
}

@end

/*
 "CTAAlerts":{
 "TimeStamp":"2015-04-30T20:53:17",
 "ErrorCode":"0",
 "ErrorMessage":null,
 "Alert":[
 {
 "AlertId":"27792",
 "Headline":"Temporary Reroute",
 "ShortDescription":"#36 buses will operate in both directions via Broadway, Lawrence, Sheridan, Wilson, and Broadway.\r\n",
 "FullDescription":{
 "#cdata-section":"<div><b>How does this affect my trip?</b></div>\r\n<div>Buses will operate in both directions via Broadway, Lawrence, Sheridan, Wilson,</div>\r\n<div>and Broadway.</div>\r\n<div>&nbsp;</div>\r\n<div><b>Why is service being changed?</b></div>\r\n<div>Buses are rerouted due to the&nbsp;Wilson Station Reconstruction Project.</div>"
 },
 "SeverityScore":"37",
 "SeverityColor":"06c",
 "SeverityCSS":"planned",
 "Impact":"Planned Reroute",
 "EventStart":"2015-05-08T21:00:00",
 "EventEnd":"2015-05-11T04:00:00",
 "TBD":"0",
 "MajorAlert":"0",
 "AlertURL":{
 "#cdatasection":"http://www.transitchicago.com/travel_information/alert_detail.aspx?AlertI
 d=27792"
 },
 "ImpactedService":{
 "Service":{
 "ServiceType":"B",
 "ServiceTypeDescription":"Bus Route",
 "ServiceName":"Broadway",
 "ServiceId":"36",
 "ServiceBackColor":"059",
 "ServiceTextColor":"ffffff",
 "ServiceURL":{
 "#cdatasection":"http://www.transitchicago.com/riding_cta/busroute.aspx?RouteId=191"
 }
 }
 },
 "ttim":"0",
 "GUID":"9979cd0c-a29d-4b52-805d-4baa0b32322b"
 }
 ]
 }
 }
*/
