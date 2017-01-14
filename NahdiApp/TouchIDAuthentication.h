/*!
 @header        TouchIDAuthentication
 
 @brief         The TouchIDAuthentication class for authenticating the user using touch id
 
 @superclass    NSObject \n
 
 @classdesign   Singleton
 
 @author        Saurav Mishra
 */

#import <Foundation/Foundation.h>

@interface TouchIDAuthentication : NSObject

/*!
 @brief         This method creates a singleton of the TouchIDAuthentication class
 
 @discussion    This method creates a singleton object of the TouchIDAuthentication class using the dispatch_once method which ensures the object has only instance through out the app.
 
 @return        Returns the singleton instance of the TouchIDAuthentication class.
 */
+(instancetype)sharedInstance;

/*!
 @brief         This method checks the status of Touch ID availablity in the device
 
 @return        Returns the status of Touch ID device status
 */
-(BOOL) doesDevichaveTouchID;

/*!
 @brief         This method checks the status of Touch ID enrollment in the device
 
 @return        Returns the status of Touch ID enrollment in the device
 */
-(BOOL) isTouchIDSetInTheDevice;


@end
