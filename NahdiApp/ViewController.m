//
//  ViewController.m
//  NahdiApp
//
//  Created by Saurav  Mishra on 12/01/17.
//  Copyright © 2017 Saurav  Mishra. All rights reserved.
//

#import "ViewController.h"
#import "ContactUsViewController.h"
#import "LocationsViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.hidden = YES;
    
}
-(void)viewWillAppear:(BOOL)animated
{
    self.userNameTextField.text = nil;
    self.passwordTextField.text = nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)contactUsTapped:(UIButton *)sender {
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ContactUsViewController * viewToPresent = [mainStoryBoard instantiateViewControllerWithIdentifier:@"contactUsIdentifier"];
    viewToPresent.URLString = @"https://www.nahdi.sa/contact/";
    [self presentViewController:viewToPresent animated:YES completion:nil];
    
}

- (IBAction)findLocationsTapped:(UIButton *)sender {
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LocationsViewController * viewToPresent = [mainStoryBoard instantiateViewControllerWithIdentifier:@"mapViewIdentifier"];
    [self presentViewController:viewToPresent animated:YES completion:nil];
}


@end
