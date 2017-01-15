//
//  CacheManager.h
//  NahdiApp
//
//  Created by Saurav  Mishra on 15/01/17.
//  Copyright © 2017 Saurav  Mishra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheManager : NSObject

@property NSString *userName;
@property NSString *passWord;

+(instancetype)sharedInstance;
-(void)removeCache;
@end
