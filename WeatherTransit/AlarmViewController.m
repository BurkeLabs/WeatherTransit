//
//  AlarmViewController.m
//  WeatherTransit
//
//  Created by Michelle Burke on 5/19/16.
//  Copyright © 2016 Burke. All rights reserved.
//

#import "AlarmViewController.h"

@interface AlarmViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *alarmButton;

@end

@implementation AlarmViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /******** 1 ********/
    [self updateClockLabel];

}

/******** 1 ********/
-(void)updateClockLabel{

    /******** 2 ********/
    NSDateFormatter *clockFormat = [[NSDateFormatter alloc] init];
    [clockFormat setDateFormat:@"hh:mm:ss a"];

    /******** 3 ********/
    self.clockLabel.text = [clockFormat stringFromDate:[NSDate date]];

    /******** 4 ********/
    [self performSelector:@selector(updateClockLabel) withObject:self afterDelay:1.0];
}

@end