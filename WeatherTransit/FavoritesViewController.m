//
//  FavoritesViewController.m
//  WeatherTransit
//
//  Created by Michelle Burke on 3/7/17.
//  Copyright © 2017 Burke. All rights reserved.
//

#import "FavoritesViewController.h"
#import "BusTrackerViewController.h"

@interface FavoritesViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) NSMutableArray *favorited;
@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end

@implementation FavoritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.favorited = [NSMutableArray new];
}

#pragma mark - adding busses
- (IBAction)onAddButtonPressed:(UIBarButtonItem *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    BusTrackerViewController *busListVC = [storyboard instantiateViewControllerWithIdentifier:@"BusList"];
    busListVC.delegate = self;
    busListVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:busListVC animated:YES completion:nil];
}

#pragma mark - UITableViewDataSource and UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"busTracker"];
    BusName *busName = [self.favorited objectAtIndex:indexPath.row];
    cell.textLabel.text = busName.route;
    cell.detailTextLabel.text = busName.routeName;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.favorited.count;
}

-(void)busTrackerViewController:(BusTrackerViewController *)viewController didChooseValue:(BusName *)value{
    [self.favorited addObject:value];
    [self.tableView reloadData];
}

#pragma mark - Navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    BusStopViewController *busStopVC = segue.destinationViewController;
//    BusName *busName = [self.favorited objectAtIndex:self.tableView.indexPathForSelectedRow.row];
//    busStopVC.busName = busName;
//}

@end
