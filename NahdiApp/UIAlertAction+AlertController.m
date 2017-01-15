//
//  UIAlertAction+AlertController.m
//  WebsterApp
//
//  Created by Saurav Mishra on 03/10/2015.
//  Copyright © 2015 Infosys. All rights reserved.
//

#import "UIAlertAction+AlertController.h"
#import "TouchIDAuthentication.h"
#import "CacheManager.h"

@import UIKit;

@implementation UIAlertAction (AlertController)

+(void)alertControllerWithTitle:(NSString *)title Message:(NSString *)message andParent:(id)parentcontroller
{
    
    UIAlertAction* okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                            handler:^(UIAlertAction * _Nonnull action) {
                                
                             

                            }];
    
   
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    
    [alert addAction:okAction];
    
    
    //Present the alert on the parent controllers view
    
    [parentcontroller presentViewController:alert animated:YES completion:nil];
}


+(void)alertControllerWithTitleAndNoAction:(NSString *)title Message:(NSString *)message andParent:(id)parentcontroller
{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    //Present the alert on the parent controllers view
    [parentcontroller presentViewController:alert animated:YES completion:nil];
}

+(void)alertControllerWithTitle:(NSString *)title Message:(NSString *)message andParent:(id)parentcontroller onSelector:(SEL)selector
{
    UIAlertAction* okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * _Nonnull okAction) {
                                   
                                   [parentcontroller performSelectorOnMainThread:selector withObject:nil waitUntilDone:YES];
                                   
                               }];
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    
    [alert addAction:okAction];
    
    
    //Present the alert on the parent controllers view
    
    [parentcontroller presentViewController:alert animated:YES completion:nil];

}

+(void)alertControllerWithTitleForlogOut:(NSString *)title Message:(NSString *)message andParent:(id)parentcontroller

{
    
    
    SEL YesSelector = NSSelectorFromString(@"yesActionForLogout");
    
    UIAlertAction* noAction = [UIAlertAction
                               actionWithTitle:@"No"
                               style:UIAlertActionStyleDefault
                               handler:nil];
    
    
    
    UIAlertAction* yesAction = [UIAlertAction
                               actionWithTitle:@"Yes"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * _Nonnull okAction) {
                                   
                                   [parentcontroller performSelectorOnMainThread:YesSelector withObject:nil waitUntilDone:YES];
                                   
                               }];
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    
    [alert addAction:noAction];
    
    [alert addAction:yesAction];
    
    //Present the alert on the parent controllers view
    
    [parentcontroller presentViewController:alert animated:YES completion:nil];
    
}


@end
