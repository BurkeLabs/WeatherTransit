//
//  CTAStatusViewController.m
//  WeatherTransit
//
//  Created by Michelle Burke on 1/15/16.
//  Copyright © 2016 BurkeLabs. All rights reserved.
//

#import "CTAStatusViewController.h"
#import "TransitInfo.h"

@interface CTAStatusViewController () <UITableViewDataSource, UITableViewDelegate, NSXMLParserDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property NSMutableArray *busStatus; //xml
@property NSXMLParser *ctaStatus; //xml part 2
//@property NSMutableArray *ctaSearchStatus; //search bar
//@property NSMutableArray *ctaSearchArray; // search and xml
@property TransitInfo *status;

typedef enum {
    NONE, Route, ServiceId, RouteStatus, RouteStatusColor
} Alerts;

@property Alerts currentField;

@end

@implementation CTAStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadCTAStatusReport];
//    self.searchBar.delegate = self;
}

-(void)loadCTAStatusReport{
    self.busStatus = [NSMutableArray new];
    self.status = NULL;
    self.currentField = 0;

    BOOL success;
    NSURL *xmlURL = [NSURL URLWithString:@"http://www.transitchicago.com/api/1.0/routes.aspx?routeid="];
    self.ctaStatus = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    self.ctaStatus.delegate = self;
    success = [self.ctaStatus parse];
//    self.busStatus = self.ctaSearchStatus;
    [self.tableView reloadData];
}

#pragma mark - UISearchBarDelegate
//-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
//    if (searchBar.text > 0) {
//        self.ctaSearchStatus = [NSMutableArray new];
//        for (TransitInfo *info in self.busStatus) {
//            NSRange range = [info.Route rangeOfString:searchText options:NSCaseInsensitiveSearch];
//            if (range.location !=NSNotFound) {
//                [self.ctaSearchStatus addObject:info];
//            }
//        }
//        self.ctaSearchArray = self.ctaSearchStatus;
//    } else {
//        self.ctaSearchArray = self.busStatus;
//    }
//    [self resignFirstResponder];
//    [self.tableView reloadData];
//}

#pragma mark - UITableView DataSource and Delegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ctaStatus"];
    TransitInfo *transitInfo = [self.busStatus objectAtIndex:indexPath.row];
    cell.textLabel.text = transitInfo.Route;
    cell.detailTextLabel.text = transitInfo.RouteStatus;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.busStatus.count;
}

#pragma mark - NSXML
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    // NSLog(@"START ELEMENT %@", elementName);
    if ([elementName isEqual:@"RouteInfo"]) {
        self.status = [TransitInfo new];
    } else if (self.status) {
        if ([elementName isEqual:@"Route"]) {
            self.currentField = Route;
        } else if ([elementName isEqual:@"ServiceId"]) {
            self.currentField = ServiceId;
        } else if ([elementName isEqual:@"RouteStatus"]) {
            self.currentField = RouteStatus;
        } else if ([elementName isEqual:@"RouteStatusColor"]) {
            self.currentField = RouteStatusColor;
        }
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    // NSLog(@"END ELEMENT %@", elementName);
    if ([elementName isEqual:@"RouteInfo"]) {
        [self.busStatus addObject:self.status];
        self.status = NULL;
    } else {
        self.currentField = NONE;
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    // NSLog(@"CHARS \"%@\"", string);
    if (self.status) {
        switch (self.currentField) {
            case Route:
                self.status.Route = string;
                break;
            case ServiceId:
                self.status.ServiceId = string;
                break;
            case RouteStatus:
                self.status.RouteStatus = string;
                break;
            case RouteStatusColor:
                self.status.RouteStatusColor = string;
                break;
            case NONE:
                break;
            default:
                break;
        }
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