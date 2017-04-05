//
//  BusTrackerViewController.h
//  WeatherTransit
//
//  Created by Michelle Burke on 1/15/16.
//  Copyright © 2016 BurkeLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Upcoming.h"
#import "BusName.h"

@protocol BusTrackerViewControllerDelegate;

@interface BusTrackerViewController : UIViewController

@property (nonatomic, weak) id<BusTrackerViewControllerDelegate> delegate;
@property Upcoming *upcoming;

-(IBAction)addBusToFavorite:(id)sender;

@end

@protocol BusTrackerViewControllerDelegate <NSObject>

-(void)busTrackerViewController:(BusTrackerViewController*)viewController didChooseValue:(BusName *)value;

@end
