//
//  IAHFakeNotificationCenter.h
//  Wallet
//
//  Created by Izabela on 14/2/16.
//  Copyright © 2016 Izabela. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IAHFakeNotificationCenter : NSObject

@property (nonatomic, strong) NSMutableDictionary *observers;
-(void) addObserver:(NSObject *)observer selector:(nonnull SEL)aSelector name:(nullable NSString *)aName object:(nullable id)anObject;
@end
