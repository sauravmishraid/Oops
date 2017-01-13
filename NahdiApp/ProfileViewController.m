//
//  ProfileViewController.m
//  NahdiApp
//
//  Created by Saurav  Mishra on 13/01/17.
//  Copyright © 2017 Saurav  Mishra. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()
@property (strong, nonatomic) IBOutlet UIView *profileView;
@property (weak, nonatomic) IBOutlet UIView *slideView;
//Constraints..
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *profileViewTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *slideViewHeightConstraint;


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
    [self setupConstraints];
}

-(void)setupConstraints
{
    self.profileViewTopConstraint.constant =  NAVIGATIONBAR_HEIGHT;
    self.slideViewHeightConstraint.constant= -NAVIGATIONBAR_HEIGHT;
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


@end
