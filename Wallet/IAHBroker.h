//
//  IAHBroker.h
//  Wallet
//
//  Created by Izabela on 11/2/16.
//  Copyright © 2016 Izabela. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IAHMoney.h"

@interface IAHBroker : NSObject
@property (nonatomic, strong) NSMutableDictionary *rates;
-(IAHMoney*) reduce: (id<IAHMoney>) money toCurrency: (NSString *) currency;
-(void) addRate: (NSInteger) rate fromCurrency: (NSString *)fromCurrency toCurrency: (NSString*) toCurrency;
-(NSString *) keyFromCurrency:(NSString *) fromCurrency toCurrency: (NSString *) toCurrency;
-(void)parseJSONRates: (NSData *) json;

@end
