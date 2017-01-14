

@import UIKit;

@interface ActivityIndicator : UIView

+(instancetype)sharedInstance;
-(void)startAnimatingInController:(UIViewController *)parentControllerView;
@property (nonatomic,strong) UIActivityIndicatorView *activityIndicator;
-(void)stopAnimating;

@end
