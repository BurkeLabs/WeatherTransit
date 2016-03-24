//
//  WeatherViewController.m
//  WeatherTransit
//
//  Created by Michelle Burke on 1/7/16.
//  Copyright © 2016 BurkeLabs. All rights reserved.
//

#import "WeatherViewController.h"

@interface WeatherViewController () <UITabBarDelegate, UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self openURL:@"http://www.weatherbug.com"];
    self.spinner.hidesWhenStopped = YES;
}

-(void)openURL:(NSString *)string
{
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];    
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.spinner startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.spinner stopAnimating];
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