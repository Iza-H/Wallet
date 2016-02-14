//
//  IAHWallet.m
//  Wallet
//
//  Created by Izabela on 12/2/16.
//  Copyright © 2016 Izabela. All rights reserved.
//

#import "IAHWallet.h"
@import UIKit;

@interface IAHWallet()
@property (nonatomic, strong) NSMutableArray *moneys;
@end

@implementation IAHWallet
-(NSUInteger) count{
    return [self.moneys count];
}

-(id) initWithAmount:(NSInteger)amount currency:(NSString *)currency{
    if(self=[super init]){
        IAHMoney *money = [[IAHMoney alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
    }
    return self;
}

-(id<IAHMoney>) plus: (IAHMoney*) money{
    [self.moneys addObject:money];
    return self;
}

-(id<IAHMoney>) times:(NSInteger) multiplier{
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    for (IAHMoney *each in self.moneys){
        IAHMoney *newMoney = [each times:multiplier];
        [newMoneys addObject:newMoney];
    }
    self.moneys = newMoneys;
    return self;
}

-(id<IAHMoney>)reduceToCurrency: (NSString*) currency withBroker: (IAHBroker *) broker{
    IAHMoney *result = [[IAHMoney alloc] initWithAmount:0 currency:currency];
    for (IAHMoney *each in self.moneys){
        result = [[each reduceToCurrency:currency withBroker:broker] plus:result];
    }
    return result;

}

-(void) subscribeToMemoryWarning:(NSNotificationCenter *) nc{
    [nc addObserver:self selector:@selector(dumpToDisk:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
}


-(void) dumpToDisk: (NSNotification *) notification{
    
}

@end
