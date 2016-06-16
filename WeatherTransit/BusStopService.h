//
//  BusStopService.h
//  WeatherTransit
//
//  Created by Michelle Burke on 6/16/16.
//  Copyright © 2016 Burke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface BusStopService : NSObject

+(NSArray*)loadStopsWithRoute:(NSString*)route direction:(NSString*)direction;

@end
