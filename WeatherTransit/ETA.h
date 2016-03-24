//
//  ETA.h
//  WeatherTransit
//
//  Created by Michelle Burke on 3/18/16.
//  Copyright © 2016 Burke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ETA : NSObject

@property int stationID;
@property int stopID;
@property NSString *stationName;
@property NSString *destinationName;
@property NSString *route;
@property NSDate *predictionTime;
@property NSDate *nextTrain;
@property float latitude;
@property float longitude;



@end
