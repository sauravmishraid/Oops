

@import UIKit;

@interface ActivityIndicator : UIView

+(instancetype)sharedInstance;
-(void)startAnimatingInController:(id)parentControllerView;
@property (nonatomic,strong) UIActivityIndicatorView *activityIndicator;

@end
