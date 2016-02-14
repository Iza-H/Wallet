//
//  IAHMoney.h
//  Wallet
//
//  Created by Izabela on 11/2/16.
//  Copyright © 2016 Izabela. All rights reserved.
//

#import <Foundation/Foundation.h>
@class IAHMoney;
@class IAHBroker;

@protocol IAHMoney <NSObject>

-(id) initWithAmount: (NSInteger) amount currency: (NSString*) currency;
-(id<IAHMoney>) times : (NSInteger)multiplier;
-(id<IAHMoney>) plus: (IAHMoney *) other;
-(id<IAHMoney>)reduceToCurrency: (NSString*) currency withBroker: (IAHBroker *) broker;

@end

@interface IAHMoney : NSObject<IAHMoney>

@property(nonatomic, readonly) NSString *currency;
@property(nonatomic, strong, readonly) NSNumber *amount;

+(id) euroWithAmount: (NSInteger) amount;
+(id) dollarWithAmount: (NSInteger) amount;







@end
