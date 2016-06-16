//
//  BusTrackerViewController.m
//  WeatherTransit
//
//  Created by Michelle Burke on 1/15/16.
//  Copyright © 2016 BurkeLabs. All rights reserved.
//  Awu5sVzWPUXFske5WVnHMyDgF

#import "BusTrackerViewController.h"
#import "BusStopViewController.h"
#import "BusName.h"

@interface BusTrackerViewController () <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource, NSXMLParserDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *busSearch;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray *busStationArray; //results from XML
@property NSMutableArray *busSearchArray; // Search Results
@property NSMutableArray *activeArray; // the list of busses shown in the list right now, either busStationArray or busSearchArray
@property NSXMLParser *ctaBus;
@property BusName *busName;

typedef enum {
    NONE,
    rt,
    rtnm,
} ETAField;

@property ETAField currentField;

@end

@implementation BusTrackerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.busSearch.delegate = self;
    [self loadBusData];
}

-(void)loadBusData
{
    self.busStationArray = [NSMutableArray new];
    self.activeArray = self.busStationArray;
    self.busName = NULL;
    self.currentField = 0;

    BOOL success;
    NSURL *xmlURL = [NSURL URLWithString:@"http://www.ctabustracker.com/bustime/api/v1/getroutes?key=Awu5sVzWPUXFske5WVnHMyDgF"];

    self.ctaBus = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    [self.ctaBus setDelegate:self];
    success = [self.ctaBus parse];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    // NSLog(@"START ELEMENT %@", elementName);
    if ([elementName isEqual:@"route"]) {
        self.busName = [BusName new];
    }
    else if (self.busName) {
        if ([elementName isEqual:@"rt"]) {
            self.currentField = rt;
        } else if ([elementName isEqual:@"rtnm"]){
            self.currentField = rtnm;
        }
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
//    NSLog(@"END ELEMENT %@", elementName);
    if ([elementName  isEqual: @"route"]) {
        [self.busStationArray addObject:self.busName];
        self.busName = NULL;
    } else {
        self.currentField = NONE;
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
//    NSLog(@"CHARS \"%@\"", string);
    if (self.busName) {
        switch (self.currentField) {
            case rt:
                self.busName.route = string;
                break;
            case rtnm:
                self.busName.routeName = string;
                break;
            case NONE:
                break;
            default:
                break;
        }
    }
}

#pragma mark - UISearchBarDelegate
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length > 0) {
        self.busSearchArray = [NSMutableArray new];
        for (BusName *bus in self.busStationArray) {
            NSRange range = [bus.routeName rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if (range.location != NSNotFound) {
                [self.busSearchArray addObject:bus];
            }
        }
        self.activeArray = self.busSearchArray;
    } else {
        self.activeArray = self.busStationArray;
    }
    [self resignFirstResponder];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource and UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"busTracker"];

    BusName *busName = [self.activeArray objectAtIndex:indexPath.row];
    cell.textLabel.text = busName.route;
    cell.detailTextLabel.text = busName.routeName;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.activeArray.count;
}

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BusStopViewController *busStopVC = segue.destinationViewController;
    BusName *busName = [self.activeArray objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    busStopVC.busName = busName;
}

@end