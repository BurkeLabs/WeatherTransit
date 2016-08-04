//
//  AlarmViewController.m
//  WeatherTransit
//
//  Created by Michelle Burke on 5/19/16.
//  Copyright © 2016 Burke. All rights reserved.
//

#import "AlarmViewController.h"
#import <EventKit/EventKit.h>

@interface AlarmViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *alarmButton;
@property (weak, nonatomic) IBOutlet UILabel *alarm1;
@property (weak, nonatomic) IBOutlet UISwitch *switch1;

@end

@implementation AlarmViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Create Label
//    UILabel *myLabel = [[UILabel alloc]initWithFrame:CGRectMake(19, 288, 144, 31)];
//    [myLabel setBackgroundColor:[UIColor clearColor]];
//    [myLabel setText:@"00:00 a"];
//    [[self view] addSubview:myLabel];
//    [myLabel release];

//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(23, 331, 144, 31)];
//    label.text = @"00:00 a";
//    [label setFont:[UIFont boldSystemFontOfSize:16]];
//    [self.view addSubview:label];

   /******* 1 *******/
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
    [self updateAlarmLabel];
}

- (IBAction)dateWheel:(id)sender {
//    [self updateAlarmLabel];
}

-(void)updateAlarmLabel{
    NSDateFormatter *clockFormat2 = [NSDateFormatter new];
    [clockFormat2 setDateFormat:@"hh:mm a"];
    self.alarm1.text = [clockFormat2 stringFromDate:self.datePicker.date];
}

@end