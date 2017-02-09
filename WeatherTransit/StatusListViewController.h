//
//  StatusListViewController.h
//  WeatherTransit
//
//  Created by Michelle Burke on 12/22/16.
//  Copyright © 2016 Burke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StatusList.h"


@interface StatusListViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *statusTableView;

@property StatusList *statusArray;
@property StatusList *statusList;

@end
