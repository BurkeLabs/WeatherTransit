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
@property (weak, nonatomic) IBOutlet UILabel *alarm1;
@property (weak, nonatomic) IBOutlet UISwitch *switch1;
@property (weak, nonatomic) IBOutlet UILabel *alarm2;
@property (weak, nonatomic) IBOutlet UISwitch *switch2;
@property (weak, nonatomic) IBOutlet UILabel *alarm3;
@property (weak, nonatomic) IBOutlet UISwitch *switch3;

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

- (IBAction)setAlarm:(UIButton *)sender {
//    [self.alarmButton updateAlarmLabel]
}
-(void)updateAlarmLabel{
    NSDateFormatter *clockFormat2 = [NSDateFormatter new];
    [clockFormat2 setDateFormat:@"hh:mm a"];
    self.alarm1.text = [clockFormat2 stringFromDate:[NSDate date]];
    self.alarm2.text = [clockFormat2 stringFromDate:[NSDate date]];
    self.alarm3.text = [clockFormat2 stringFromDate:[NSDate date]];
}

@end