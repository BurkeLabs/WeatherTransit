//
//  StatusListViewController.m
//  WeatherTransit
//
//  Created by Michelle Burke on 12/22/16.
//  Copyright © 2016 Burke. All rights reserved.
//

#import "StatusListViewController.h"
#import "StatusList.h"

@interface StatusListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *statusTableView;

@property StatusList *statusList;

@end

@implementation StatusListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURL *url = [NSURL URLWithString:@"http://www.transitchicago.com/api/1.0/routes.aspx?routeid=%@&outputType=JSON"];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *ctaRoutes = [responseDictionary objectForKey:@"CTARoutes"];
        NSDictionary *routeInfo = [ctaRoutes objectForKey:@"RouteInfo"];

//        NSLog(@"error");

        self.statusList = [[StatusList alloc] initWithDictionary:routeInfo];

        dispatch_async(dispatch_get_main_queue(), ^{
            [self.statusTableView reloadData];
        });
        }];
    [task resume];
}

#pragma mark - UITableView DataSource and Delegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Status"];
    cell.textLabel.text = self.statusList.Route;
     cell.detailTextLabel.text = self.statusList.RouteStatus;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.statusList == NULL) {
        return 0;
    } else {
        return 1;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
