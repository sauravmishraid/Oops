/*!
 @header       AlertController
 
 @brief        This class provides an alert message to the user in case of an event .
 
 @discussion   This Controller is used to Alert a controller in case of any event and also dismisses itself on tap of a button.
  
 @author        Saurav Mishra
 */

@import UIKit;

@interface UIAlertAction (AlertController)
/*!
 @brief                     This method displays an alert incase of an event.
 
 @discussion                This method is used to display an alert with title,message and a "OK" button.
 
 @param  title              The title of the Alert
 
 @param  message            Message in the Alert.
 
 @param  parentcontroller   The controller which inkoved the method.
 
 */
+(void )alertControllerWithTitle:(NSString *)title Message:(NSString *)message andParent:(id)parentcontroller;

/*!
 @brief                     This method displays an alert incase of an event.
 
 @discussion                This method is used to display an alert with title,message.
 
 @param  title              The title of the Alert
 
 @param  message            Message in the Alert.
 
 @param  parentcontroller   The controller which inkoved the method.
 
 */
+(void)alertControllerWithTitleAndNoAction:(NSString *)title Message:(NSString *)message andParent:(id)parentcontroller;

/*!
 @brief                     This method displays an alert incase of an event.
 
 @discussion                This method is used to display an alert with title,message.
 
 @param  title              The title of the Alert
 
 @param  message            Message in the Alert.
 
 @param  selector           The selector which will be performed when the OK is tapped.
 
 @param  parentcontroller   The controller which inkoved the method.
 
 */

+(void)alertControllerWithTitle:(NSString *)title Message:(NSString *)message andParent:(id)parentcontroller onSelector:(SEL)selector;

/*!
 @brief                     This method displays an alert for Log out
 
 @discussion                This method is used to display an alert with title,message.
 
 @param  title              The title of the Alert
 
 @param  message            Message in the Alert.
 
 @param  parentcontroller   The controller which inkoved the method.
 
 */

+(void)alertControllerWithTitleForlogOut:(NSString *)title Message:(NSString *)message andParent:(id)parentcontroller;


@end
