//
//  IAHWalletTests.m
//  Wallet
//
//  Created by Izabela on 11/2/16.
//  Copyright © 2016 Izabela. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IAHMoney.h"
#import "IAHBroker.h"
#import "IAHWallet.h"

@interface IAHWalletTests : XCTestCase

@end

@implementation IAHWalletTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testAddisionWithReduction{
    IAHBroker *broker = [IAHBroker new];
    [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    IAHWallet *wallet = [[IAHWallet alloc] initWithAmount:40 currency:@"EUR"];
    [wallet plus: [IAHMoney dollarWithAmount:20] ];
    IAHMoney *reduced = [broker reduce:wallet toCurrency:@"USD"];
    XCTAssertEqualObjects(reduced, [IAHMoney dollarWithAmount:100], @"40E + 20$ = 100$, 2:1");
    
}



@end
