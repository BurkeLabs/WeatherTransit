//
//  DisplayStatus.h
//  WeatherTransit
//
//  Created by Michelle Burke on 1/26/17.
//  Copyright © 2017 Burke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DisplayStatus : NSObject

@property NSString *Headline;
@property NSString *ShortDescription;
@property NSString *fullDescription;
@property NSString *severityColor;
@property NSString *severityCSS;
@property NSString *impact;
@property NSString *eventStart;
@property NSString *eventEnd;
@property NSString *alertURL;
@property NSString *serviceType;
@property NSString *serviceTypeDescription;
@property NSString *serviceName;
@property NSString *serviceID;
@property NSString *serviceBackColor;
@property NSString *serviceURL;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

/*
 <xs:element name="AlertId" type="xs:unsignedShort" />
 <xs:element name="Headline" type="xs:string" />
 <xs:element name="ShortDescription" type="xs:string" />
 <xs:element name="FullDescription" type="xs:string" />
 <xs:element name="SeverityScore" type="xs:unsignedByte" />
 <xs:element name="SeverityColor" type="xs:string" />
 <xs:element name="SeverityCSS" type="xs:string" />
 <xs:element name="Impact" type="xs:string" />
 <xs:element name="EventStart" type="xs:string" />
 <xs:element name="EventEnd" type="xs:string" />
 <xs:element name="TBD" type="xs:unsignedByte" />
 <xs:element name="MajorAlert" type="xs:unsignedByte" />
 <xs:element name="AlertURL" type="xs:string" />
 <xs:element name="ImpactedService">
 <xs:complexType>
 <xs:sequence>
 <xs:element maxOccurs="unbounded" name="Service">
 <xs:complexType>
 <xs:sequence>
 <xs:element name="ServiceType" type="xs:string" />
 <xs:element name="ServiceTypeDescription" type="xs:string" />
 <xs:element name="ServiceName" type="xs:string" />
 <xs:element name="ServiceId" type="xs:string" />
 <xs:element name="ServiceBackColor" type="xs:string" />
 <xs:element name="ServiceTextColor" type="xs:string" />
 <xs:element name="ServiceURL" type="xs:string" />
*/
