//
//  CacheManager.m
//  NahdiApp
//
//  Created by Saurav  Mishra on 15/01/17.
//  Copyright © 2017 Saurav  Mishra. All rights reserved.
//

#import "CacheManager.h"

@implementation CacheManager
static dispatch_once_t predicate;
static CacheManager * cacheManagerObject;

+(instancetype)sharedInstance
{
    dispatch_once(&predicate, ^{
        cacheManagerObject = [[self alloc] init];
    });
    return cacheManagerObject;
}

-(instancetype)init
{
    self= [super init];
    if(self)
    {
        self.userName = [NSString new];
        self.passWord = [NSString new];
    }
    return self;
}

-(void)removeCache
{
    predicate=0;
    cacheManagerObject=nil;

}

@end
