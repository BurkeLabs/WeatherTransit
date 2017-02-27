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

@property UILocalNotification *local;

@end

@implementation AlarmViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Create Label
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(23, 331, 144, 31)];
//    label.text = @"00:00 a";
//    [label setFont:[UIFont boldSystemFontOfSize:16]];
//    [self.view addSubview:label];

}

- (IBAction)setAlarm:(UIButton *)sender {
    [self updateAlarmLabel];
}

- (IBAction)dateWheel:(id)sender {
}

-(void)updateAlarmLabel{
    NSDateFormatter *clockFormat2 = [NSDateFormatter new];
    [clockFormat2 setDateFormat:@"hh:mm a"];
    self.alarm1.text = [clockFormat2 stringFromDate:self.datePicker.date];

//  [self scheduleNotificationForDate:self.datePicker.date];
}

-(void)scheduleNotificationForDate:(NSDate *)date{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];

    self.local = [UILocalNotification new];
    self.local.fireDate = date;

    self.local.timeZone = [NSTimeZone defaultTimeZone];
    self.local.alertBody = [NSString stringWithFormat:@"WAKE UP!"];
    self.local.alertAction = NSLocalizedString(@"View Details", nil);

    self.local.soundName = UILocalNotificationDefaultSoundName;
    self.local.applicationIconBadgeNumber = -1;

    [[UIApplication sharedApplication] scheduleLocalNotification:self.local];
}

@end
