//
//  ProfileViewController.m
//  NahdiApp
//
//  Created by Saurav  Mishra on 13/01/17.
//  Copyright © 2017 Saurav  Mishra. All rights reserved.
//

@import UIKit;
#import "ProfileViewController.h"
#import "MenuTableViewCell.h"
#import "LocationsViewController.h"
#import "ContactUsViewController.h"
#import "TouchIDAuthentication.h"

@interface ProfileViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *profileView;
@property (weak, nonatomic) IBOutlet UIView *slideView;
//Constraints..
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *profileViewTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *slideViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *menuTableViewHeightConstraint;
@property (weak, nonatomic) IBOutlet UITableView *menuTableView;
@end

@implementation ProfileViewController
#define ANIMATION_DURATION_SLIDEMENU 0.25
#define ORIGIN_X_POSITION 0
#define NAVIGATIONBAR_HEIGHT 64.0
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = NO;
    [self addSlideGesture];
    self.menuTableView.delegate= self;
    self.menuTableView.dataSource = self;
}

-(void)setupConstraints
{
    self.profileViewTopConstraint.constant =  NAVIGATIONBAR_HEIGHT;
    self.slideViewHeightConstraint.constant= -NAVIGATIONBAR_HEIGHT;
    self.menuTableViewHeightConstraint.constant=-NAVIGATIONBAR_HEIGHT;
}
- (IBAction)slideButtonTapped:(UIBarButtonItem *)sender {
    
    (self.profileView.frame.origin.x == ORIGIN_X_POSITION) ? [self showMenu] : [self hideMenu];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Gesture handlers
-(void) addSlideGesture
{
    //Adding Swipe Gesture Recognizers to the  parent view.
    UISwipeGestureRecognizer *swipeLeft     =   [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeLeft:)];
    
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight    =   [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeRight:)];
    
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    
    [self.view addGestureRecognizer:swipeRight];
}
//Handle left swipe
-(void)handleSwipeLeft:(UISwipeGestureRecognizer*)recognizer
{
    if(self.profileView.frame.origin.x != ORIGIN_X_POSITION)
        [self hideMenu];
}

//Handle right swipe
-(void)handleSwipeRight:(UISwipeGestureRecognizer*)recognizer
{
    if(self.profileView.frame.origin.x == ORIGIN_X_POSITION)
        [self showMenu];
}
-(void)showMenu
{
    //Slide the content view to the right to reveal the menu
    [UIView animateWithDuration:ANIMATION_DURATION_SLIDEMENU
                     animations:^
     {
         [self.profileView setFrame:CGRectMake(self.slideView.frame.size.width,
                                               self.profileView.frame.origin.y,
                                               self.profileView.frame.size.width,
                                               self.profileView.frame.size.height)];
     }];
}

-(void)hideMenu
{
    //Slide the content view to the left to hide the menu
    [UIView animateWithDuration:ANIMATION_DURATION_SLIDEMENU
                     animations:^
     {
         [self.profileView setFrame:CGRectMake(ORIGIN_X_POSITION,
                                               self.profileView.frame.origin.y,
                                               self.profileView.frame.size.width,
                                               self.profileView.frame.size.height)];
     }];
}

-(void)viewDidDisappear:(BOOL)animated
{
  //  self.profileViewTopConstraint.constant =self.slideViewHeightConstraint.constant=self.menuTableViewHeightConstraint.constant=0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
    
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Settings";
}

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    UITableViewHeaderFooterView * headerView = (UITableViewHeaderFooterView *)view;
    headerView.textLabel.textColor = [UIColor whiteColor];
    headerView.textLabel.textAlignment = NSTextAlignmentCenter;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"MenuTableViewIdentifier";
    MenuTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell)
        cell = [[MenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    switch (indexPath.row) {
        case 0:
            cell.labelForMenu.text = @"Touch ID";
            cell.menuImageView.image=[UIImage imageNamed:@"TouchID"];
            break;
        case 1:
            cell.labelForMenu.text = @"Inbox";
            cell.menuImageView.image=[UIImage imageNamed:@"mail_icon"];
            break;
        case 2:
            cell.labelForMenu.text = @"Contact us";
            cell.menuImageView.image=[UIImage imageNamed:@"contact_icon"];
            break;
        case 3:
            cell.labelForMenu.text = @"Locations";
            cell.menuImageView.image=[UIImage imageNamed:@"locations"];
            break;
        case 4:
            cell.labelForMenu.text = @"Sign Out";
            cell.menuImageView.image=[UIImage imageNamed:@"signout_icon"];
            break;

        default:
            break;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ViewController * viewToPresent = [mainStoryBoard instantiateViewControllerWithIdentifier:@"TouchIDIdentifier"];
            
            [self presentViewController:viewToPresent animated:YES completion:nil];
            break;
        }
        case 1:
           
            break;
        case 2:
        {
            UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ContactUsViewController * viewToPresent = [mainStoryBoard instantiateViewControllerWithIdentifier:@"contactUsIdentifier"];
            viewToPresent.URLString = @"https://www.nahdi.sa/contact/";
            [self presentViewController:viewToPresent animated:YES completion:nil];
            break;
        }
        case 3:
        {
            UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            LocationsViewController * viewToPresent = [mainStoryBoard instantiateViewControllerWithIdentifier:@"mapViewIdentifier"];
            [self presentViewController:viewToPresent animated:YES completion:nil];
            break;
        }
        case 4:
        {
            UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ViewController * viewToPresent = [mainStoryBoard instantiateViewControllerWithIdentifier:@"LoginViewControlleridentifier"];
            
            [self presentViewController:viewToPresent animated:YES completion:nil];

        }
            break;
            
        default:
        break;
    }
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![[TouchIDAuthentication sharedInstance] doesDevichaveTouchID])
    {   [cell setUserInteractionEnabled:NO];
        cell.textLabel.textColor =[UIColor grayColor];
    }
    
}

@end
