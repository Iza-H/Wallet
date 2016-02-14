//
//  IAHMoney.m
//  Wallet
//
//  Created by Izabela on 11/2/16.
//  Copyright © 2016 Izabela. All rights reserved.
//

#import "IAHMoney.h"
#import "NSObject+GNUStepAddons_h.h"
#import "IAHWallet.h"
#import "IAHBroker.h"


@interface IAHMoney()
@property (nonatomic, strong) NSNumber *amount;

@end

@implementation IAHMoney


+(instancetype) euroWithAmount: (NSInteger) amount{
    return [[IAHMoney alloc] initWithAmount:amount currency: @"EUR"];
    
}
+(instancetype) dollarWithAmount: (NSInteger) amount{
    return [[IAHMoney alloc] initWithAmount:amount currency: @"USD"];
}

-(id) initWithAmount: (NSInteger) amount currency: (NSString*) currency{
    if (self = [super init]){
        _amount = @(amount);
        _currency = currency;
    }
    return self;
    
}

-(id<IAHMoney>)reduceToCurrency: (NSString*) currency withBroker: (IAHBroker *) broker{
    IAHMoney *result;
    double rate = [[broker.rates objectForKey:[broker keyFromCurrency:self.currency toCurrency:currency]]doubleValue];
    
    if ([self.currency isEqual:currency]){
        result = self;
    }else if (rate==0){
        //No hay tasa de conversion
        [NSException raise:@"NoConversionRateException" format:@"Must have a conversion from %@ to %@", self.currency, currency ];
    }else{
        //double rate = [[self.rates objectForKey:[self keyFromCurrency:self.currency toCurrency:currency]]doubleValue];
        NSInteger newAmount = [self.amount integerValue] * rate;
        IAHMoney *newMoney = [[IAHMoney alloc] initWithAmount:newAmount currency:currency];
        result = newMoney;
    }
    return result;
}

-(id<IAHMoney>) plus: (IAHMoney *) other{
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    IAHMoney *total = [[IAHMoney alloc] initWithAmount:totalAmount currency:self.currency];
    return total;
}



-(id<IAHMoney>) times : (NSInteger)multiplier{
    //no se deberia llamar, se deberia usar de la subclase
    //return  [self subclassResponsibility:_cmd];
    
    IAHMoney *newMoney  = [[IAHMoney alloc] initWithAmount:[self.amount integerValue] * multiplier  currency:self.currency];
    return newMoney;

}

#pragma mark - Overwritten
-(BOOL) isEqual:(id)object{
    if ([self.currency isEqual:[object currency]]){
        return [self amount] == [object amount];
    }
    return NO;
}

-(NSUInteger) hash{
    return  [self.amount integerValue];
}

- (NSString *) description{
    return [NSString stringWithFormat:@"<%@: %@ %@>" ,[self class] , self.currency ,[self  amount]];
}


@end
