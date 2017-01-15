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
#import "CacheManager.h"
#import "TouchIDViewController.h"
#import "UIAlertAction+AlertController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (nonatomic,strong) NSMutableArray *validUserNames;
@property (nonatomic,strong) NSMutableArray *validPassWords;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.hidden = YES;
    self.validUserNames = [NSMutableArray arrayWithObjects:@"john",@"james",nil];
    self.validPassWords =[NSMutableArray arrayWithObjects:@"password", nil];
    }
-(void)viewWillAppear:(BOOL)animated
{
    self.userNameTextField.text = nil;
    self.passwordTextField.text = nil;
}

-(void)viewDidAppear:(BOOL)animated
{
  /*  if ([UIApplication sharedApplication].applicationState != UIApplicationStateBackground) {
        
        if([[NSUserDefaults standardUserDefaults] objectForKey:@"TouchIDSwitch"])
        {
            UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            TouchIDViewController * touchIDObject = [mainStoryBoard instantiateViewControllerWithIdentifier:@"TouchIDIdentifier"];
            [touchIDObject showLoginOptionsToUser];
            //Save and fetch from KeyChain for next version.
             NSString *userName = [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"];
             NSString *passWord = [[NSUserDefaults standardUserDefaults] objectForKey:@"passWord"];
             
             [self signInWithUserName:userName andPassword:passWord];
        }
    }*/
    

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
- (IBAction)MoreOptions:(UIButton *)sender {
    
    SEL okTappedFromAlert = NSSelectorFromString(@"okTappedFromAlert");

 [UIAlertAction alertControllerWithTitle:@"Message" Message:@"This feature is unavilable in the current version." andParent:self onSelector:okTappedFromAlert];

}

- (IBAction)signInButtonTapped:(UIButton *)sender {
    
    
    if(self.userNameTextField.text.length && self.passwordTextField.text.length)
    {
        [self signInWithUserName:self.userNameTextField.text andPassword:self.passwordTextField.text];
    }
    else return;

  /*  if([[NSUserDefaults standardUserDefaults] objectForKey:@"TouchIDSwitch"])
    {
        
        TouchIDViewController *touchIDController = [[TouchIDViewController alloc] init];
        [touchIDController showLoginOptionsToUser];
    }
    else
    {
        if(self.userNameTextField.text.length && self.passwordTextField.text.length)
        {
            [self signInWithUserName:self.userNameTextField.text andPassword:self.passwordTextField.text];
        }
        else return;

            }*/
   
    
}
-(void)okTappedFromAlert
{
    
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return YES;
}

-(void)signInWithUserName:(NSString *)userName andPassword:(NSString *)passWord
{
       if ([self.validUserNames containsObject:userName] && [self.validPassWords containsObject:passWord])
    {
        [CacheManager sharedInstance].userName = userName;
        [CacheManager sharedInstance].passWord= passWord;
        [self performSegueWithIdentifier:@"signInIdentifier" sender:self];
    }
    
}
@end
