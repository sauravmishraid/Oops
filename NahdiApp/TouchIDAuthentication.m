//
//  TouchIDAuthentication.m
//
//

#import "TouchIDAuthentication.h"

@import LocalAuthentication;

@implementation TouchIDAuthentication

#pragma  mark-Class Methods

//Singleton method
+(instancetype)sharedInstance
{
    static dispatch_once_t predicate;
    
    static TouchIDAuthentication * TouchIDAuthenticationObject;
    
    dispatch_once(&predicate, ^{
        
        TouchIDAuthenticationObject = [self new];
        
    });
    
    return TouchIDAuthenticationObject;
}

//Method to check the touch ID availablity in the device
-(BOOL)doesDevichaveTouchID
{
    LAContext *context =[LAContext new];
    
    NSError *error;
    
    BOOL devicehasTouchID = [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error];
    
    
    if(!devicehasTouchID)
        return  error.code == kLAErrorTouchIDNotAvailable ? NO : YES ;
    else
        return YES;
    
}

//Method to check the touch ID enrollment in the device
-(BOOL) isTouchIDSetInTheDevice
{
    LAContext *context =[LAContext new];
    
    NSError *error;
    
    BOOL devicehasTouchID = [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error];
    

    if(!devicehasTouchID)
        return  ((error.code == kLAErrorPasscodeNotSet) || (error.code == kLAErrorTouchIDNotEnrolled)) ? NO :YES;
    else
        return YES;
    
}



@end
