//
//  IAHBroker.m
//  Wallet
//
//  Created by Izabela on 11/2/16.
//  Copyright © 2016 Izabela. All rights reserved.
//

#import "IAHBroker.h"
#import "IAHMoney.h"



@implementation IAHBroker

-(id) init{
    if(self =[super init]){
        _rates = [@{}mutableCopy];
    }
    return self;
}

-(IAHMoney*) reduce: (id<IAHMoney>) money toCurrency: (NSString *) currency{
    
    //double dispatch
    
    return [money reduceToCurrency:currency withBroker:self];
    
    
    /*IAHMoney *result;
    double rate = [[self.rates objectForKey:[self keyFromCurrency:money.currency toCurrency:currency]]doubleValue];
    
    if ([money.currency isEqual:currency]){
        result = money;
    }else if (rate==0){
        //No hay tasa de conversion
        [NSException raise:@"NoConversionRateException" format:@"Must have a conversion from %@ to %@", money.currency, currency ];
    }else{
        double rate = [[self.rates objectForKey:[self keyFromCurrency:money.currency toCurrency:currency]]doubleValue];
        NSInteger newAmount = [money.amount integerValue] * rate;
        IAHMoney *newMoney = [[IAHMoney alloc] initWithAmount:newAmount currency:currency];
        result = newMoney;
    }
    return result;*/
}

-(void) addRate: (NSInteger) rate fromCurrency: (NSString *)fromCurrency toCurrency: (NSString*) toCurrency{
    [self.rates setObject:@(rate) forKey:[self keyFromCurrency: fromCurrency toCurrency: toCurrency]];
    [self.rates setObject:@(1.0/rate) forKey:[self keyFromCurrency:toCurrency toCurrency:fromCurrency]];
}

-(NSString *) keyFromCurrency:(NSString *) fromCurrency toCurrency: (NSString *) toCurrency{
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
}

-(void)parseJSONRates: (NSData *) json{
    NSError *err = nil;
    id obj = [NSJSONSerialization JSONObjectWithData:json options: NSJSONReadingAllowFragments error:&err];
    if(obj != nil){
        //Cogemos los rates
    }else{
        [NSException raise:@"NoRatesException" format:@"JSON must carry some data"];
    }
}

@end
