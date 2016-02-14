//
//  IAHWallet.h
//  Wallet
//
//  Created by Izabela on 12/2/16.
//  Copyright © 2016 Izabela. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IAHMoney.h"

@interface IAHWallet : NSObject<IAHMoney>
@property (nonatomic, readonly) NSUInteger count;
-(id<IAHMoney>)reduceToCurrency: (NSString*) currency withBroker: (IAHBroker *) broker;
-(void) subscribeToMemoryWarning:(NSNotificationCenter *) nc;
-(IAHMoney*) getMoneyAtIndex: (NSInteger) index;
-(NSDictionary *) getNumberOfDifferentCurrency;


@end
