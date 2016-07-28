//
//  AlarmViewController.h
//  WeatherTransit
//
//  Created by Michelle Burke on 5/19/16.
//  Copyright © 2016 Burke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlarmViewController : UIViewController

/******** 1 ********/
@property (weak, nonatomic) IBOutlet UILabel *clockLabel;

/******** 2 ********/
- (IBAction)dateWheel:(id)sender;
-(void)updateClockLabel;
-(void)updateAlarmLabel;
@end
