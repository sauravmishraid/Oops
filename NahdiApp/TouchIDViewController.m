//
//  TouchIDViewController.m
//  NahdiApp
//
//  Created by Saurav  Mishra on 14/01/17.
//  Copyright © 2017 Saurav  Mishra. All rights reserved.
//

#import "TouchIDViewController.h"

@interface TouchIDViewController ()

@end

@implementation TouchIDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)TouchIDSwitchToggled:(UISwitch *)sender {
    
    
}
- (IBAction)backButtontapped:(UIButton *)sender {
    if(self.presentingViewController)
        [self dismissViewControllerAnimated:YES completion:nil];
    else
        [self.navigationController popViewControllerAnimated:YES];
    
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
