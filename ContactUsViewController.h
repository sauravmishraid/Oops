//
//  ContactUsViewController.h
//  NahdiApp
//
//  Created by Saurav  Mishra on 14/01/17.
//  Copyright © 2017 Saurav  Mishra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactUsViewController : UIViewController

@property (nonatomic,strong) NSString *URLString;
@property (weak, nonatomic) IBOutlet UIWebView *contactUsWebView;

@end
