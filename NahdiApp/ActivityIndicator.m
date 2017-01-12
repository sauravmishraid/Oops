//
//  ActivityIndicator.m
//  NahdiApp
//
//  Created by Saurav Mishra on 12/01/2017.
//

#import "ActivityIndicator.h"


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
 /*   self.activityIndicator= [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    
    self.activityIndicator.layer.cornerRadius = 5;
    
    self.activityIndicator.opaque = NO;
    
    self.activityIndicator.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.9f];
    
    self.activityIndicator.center = self.center;
    
    self.activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    
    [self.activityIndicator setColor:[UIColor colorWithRed:31.0/256.0 green:184.0/256.0 blue:250.0/256.0 alpha:1.0]];
    
    [self addSubview: self.activityIndicator];*/
    
    
    
    //Test
    
    //Create the first status image and the indicator view
    UIImage *statusImage = [UIImage imageNamed:@"Loader-1"];
    self.activityImageView = [[UIImageView alloc]
                                      initWithImage:statusImage];
    
    
    //Create an array with the image names.
    
    NSMutableArray *animationImageArray=[NSMutableArray new];
    
    for (int i=1; i<20; i++)
    {
        NSString *imageName = [NSString stringWithFormat:@"Loader-%d",i];
        
        UIImage *animationImage = [UIImage imageNamed:imageName];
        
        [animationImageArray addObject:animationImage];
        
    }
    
    
    //Add more images which will be used for the animation
    self.activityImageView.animationImages = animationImageArray;
    
    self.activityImageView.animationDuration = 0.5;
    
    self.activityImageView.center = self.center;
    
    [self addSubview:self.activityImageView];

}

-(void)startAnimatingInController:(id)parentControllerView
{
    
    //[self.activityIndicator startAnimating];
   //
    
    [self.activityImageView startAnimating];

    
    [parentControllerView addSubview:self];
    
}

-(void)stopAnimating
{
    
    [self.activityIndicator stopAnimating];
    
    [self removeFromSuperview];
}

@end
