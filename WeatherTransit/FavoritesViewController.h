//
//  FavoritesViewController.h
//  WeatherTransit
//
//  Created by Michelle Burke on 3/7/17.
//  Copyright © 2017 Burke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusName.h"
#import "BusTrackerViewController.h"

@interface FavoritesViewController : UIViewController <BusTrackerViewControllerDelegate>

@property BusName *busName;
@property NSMutableArray *addedBus;

@end
