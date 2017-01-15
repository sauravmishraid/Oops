//
//  TouchIDViewController.m
//  NahdiApp
//
//  Created by Saurav  Mishra on 14/01/17.
//  Copyright © 2017 Saurav  Mishra. All rights reserved.
//

#import "TouchIDViewController.h"
#import "ViewController.h"
#import "CacheManager.h"
#import "UIAlertAction+AlertController.h"
#import "ProfileViewController.h"

@import LocalAuthentication;

@interface TouchIDViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *touchIDSwitch;
@property BOOL isTouchIDSuccessful;
@end

@implementation TouchIDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if([self checkForInitialSetting])
    {
        self.touchIDSwitch.on= YES;
    }
    else
    {
        self.touchIDSwitch.on= NO;

    }
}

-(BOOL)checkForInitialSetting
{
    if (([[NSUserDefaults standardUserDefaults] objectForKey:@"TouchIDSwitch"])) {
        return YES;
    }
    else
    {
        return NO;
    }
    
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)TouchIDSwitchToggled:(UISwitch *)sender {
    
    if(sender.isOn)
    {
        SEL LogoutOnUserAgreement = NSSelectorFromString(@"LogoutOnUserAgreement");

        [UIAlertAction alertControllerWithTitle:@"Message" Message:@"You will be logged out and prompted for Biometric Authentication." andParent:self onSelector:LogoutOnUserAgreement];
        
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"TouchIDSwitch"];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userName"];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"passWord"];
        [[NSUserDefaults standardUserDefaults] synchronize];

    }
    
}
- (IBAction)backButtontapped:(UIButton *)sender {
    if(self.presentingViewController)
        [self dismissViewControllerAnimated:YES completion:nil];
    else
        [self.navigationController popViewControllerAnimated:YES];
    
}

//Display Touch Id login option
- (BOOL)showLoginOptionsToUser
{
    LAContext *context = [[LAContext alloc] init];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSError *error = nil;
        
        if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error])
        {
            [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                    localizedReason:@"Please scan your finger print or Choose to Enter Password."
                              reply:^(BOOL success, NSError *error)
             {
                 __block NSString * message = nil;
                 
                 if (success)
                 {
                    //Sign In - next ver on keychain
//                     NSString *userName = [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"];
//                     NSString *passWord = [[NSUserDefaults standardUserDefaults] objectForKey:@"passWord"];
                     UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                     
                     ProfileViewController * profileObject = [mainStoryBoard instantiateViewControllerWithIdentifier:@"profileControllerIdentifier"];
                     [self presentViewController:profileObject animated:YES completion:nil];
                    }
                 else
                 {
                     self.isTouchIDSuccessful = NO;
                     
                     switch (error.code)
                     {
                         case LAErrorAuthenticationFailed:
                         {
                             message = @"Authentication Failed.Please Try Again";
                         }
                             break;
                             
                         case LAErrorTouchIDNotAvailable:
                         {
                             message = @"Touch ID not available.";
                         }
                             
                         case LAErrorTouchIDNotEnrolled:
                         {
                             message = @"Touch ID not enrolled.";
                         }
                             
                         case LAErrorTouchIDLockout:
                         {
                             message = @"Touch ID is locked out.Please unlock it using passcode.";
                         }
                         default:
                             
                             break;
                     }
                     
                     if(message)
                     {
                         //Handle Error Messages
                         SEL OKTapped = NSSelectorFromString(@"OKTapped");

                         [UIAlertAction alertControllerWithTitle:@"Message" Message:@"You will be logged out and prompted for Biometric Authentication." andParent:self onSelector:OKTapped];
                     }
                 }
             }];
        }
    });
    
    return self.isTouchIDSuccessful;
}

-(void)OKTapped
{
    
}
-(void)LogoutOnUserAgreement
{
    [[NSUserDefaults standardUserDefaults] setObject:@"On" forKey:@"TouchIDSwitch"];
    [[NSUserDefaults standardUserDefaults] setObject:[CacheManager sharedInstance].userName forKey:@"userName"];
    [[NSUserDefaults standardUserDefaults] setObject:[CacheManager sharedInstance].passWord forKey:@"passWord"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[CacheManager sharedInstance] removeCache];
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController * viewToPresent = [mainStoryBoard instantiateViewControllerWithIdentifier:@"LoginViewControlleridentifier"];
    
    [self presentViewController:viewToPresent animated:YES completion:nil];
}

@end

