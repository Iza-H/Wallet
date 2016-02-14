//
//  IAHFakeNotificationCenter.m
//  Wallet
//
//  Created by Izabela on 14/2/16.
//  Copyright © 2016 Izabela. All rights reserved.
//

#import "IAHFakeNotificationCenter.h"

@implementation IAHFakeNotificationCenter

-(id) init{
    if(self =[super init]){
        _observers = [NSMutableDictionary dictionary];
    }
    return self;
}

-(void) addObserver:(NSObject *)observer selector:(nonnull SEL)aSelector name:(nullable NSString *)aName object:(nullable id)anObject{
    [self.observers setObject:observer forKey:aName];
}


@end
