//
//  ActivityIndicator.m
//  NahdiApp
//
//  Created by Saurav Mishra on 12/01/2017.
//

#import "ActivityIndicator.h"
#import "ContactUsViewController.h"

@interface ActivityIndicator ()

@property (nonatomic,strong) UIImageView *activityImageView;

@end
@implementation ActivityIndicator

//Initializing the frame.
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        [self setUpOverlayView];
    }
    return self;
}

//Creating the sharedinstance.
+(instancetype)sharedInstance
{
    static dispatch_once_t predicate;
    
    static ActivityIndicator * activityIndicatorObject;
    
    dispatch_once(&predicate, ^{
        
        activityIndicatorObject = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
    });
    
    return activityIndicatorObject;
}

#pragma mark-Setting up view for the app.

//Setting up the overlay view
-(void)setUpOverlayView
{
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    UIView *mainView = [[UIView alloc] initWithFrame:screenRect];
    
    [mainView setBackgroundColor:[UIColor grayColor]];
    
    mainView.center =  self.center;
    
    [mainView setAlpha:0.7f];
    
    [mainView setUserInteractionEnabled:NO];
    
    [self addSubview:mainView];
    
    [self setUpIndicatorView];
}

//Setting up the indicator view
-(void)setUpIndicatorView
{
    self.activityIndicator= [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    
    self.activityIndicator.layer.cornerRadius = 5;
    
    self.activityIndicator.opaque = NO;
    
    self.activityIndicator.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.9f];
    
    self.activityIndicator.center = self.center;
    
    self.activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    
    [self.activityIndicator setColor:[UIColor greenColor]];
    
    [self addSubview: self.activityIndicator];
 
}

-(void)startAnimatingInController:(UIViewController *)parentControllerView
{
    
    [self.activityIndicator startAnimating];
    
    //[self.activityImageView startAnimating];

        if([parentControllerView isKindOfClass:[ContactUsViewController class]])
        {
            ContactUsViewController *instancePassed =(ContactUsViewController *)parentControllerView;
            [instancePassed.contactUsWebView addSubview:self];
        }
        else
        {
            [parentControllerView.view addSubview:self];
        }
    
}

-(void)stopAnimating
{
    
    [self.activityIndicator stopAnimating];
    
    [self removeFromSuperview];
}

@end
