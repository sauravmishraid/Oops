//
//  ContactUsViewController.m
//  NahdiApp
//
//  Created by Saurav  Mishra on 14/01/17.
//  Copyright © 2017 Saurav  Mishra. All rights reserved.
//

#import "ContactUsViewController.h"
#import "ActivityIndicator.h"

@interface ContactUsViewController ()<UIWebViewDelegate>

@end

@implementation ContactUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.contactUsWebView.delegate = self;
    [[ActivityIndicator sharedInstance] startAnimatingInController:self];
    [self.contactUsWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.URLString]]];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [[ActivityIndicator sharedInstance] stopAnimating];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)backButtonTapped:(UIButton *)sender {
    
    if(self.presentingViewController)
        [self dismissViewControllerAnimated:YES completion:nil];
    else
        [self.navigationController popViewControllerAnimated:YES];
}




@end
