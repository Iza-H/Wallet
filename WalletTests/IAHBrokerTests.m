//
//  IAHBrokerTests.m
//  Wallet
//
//  Created by Izabela on 11/2/16.
//  Copyright © 2016 Izabela. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IAHMoney.h"
#import "IAHBroker.h"

@interface IAHBrokerTests : XCTestCase
@property(nonatomic, strong) IAHBroker *emptyBroker;
@property (nonatomic, strong) IAHMoney *oneDollar;

@end

@implementation IAHBrokerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.emptyBroker = [IAHBroker new];
    self.oneDollar = [IAHMoney dollarWithAmount:1];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.emptyBroker = nil;
    self.oneDollar = nil;
}

-(void) testSimpleReduction{

    IAHMoney *sum = [[IAHMoney dollarWithAmount:5] plus: [IAHMoney dollarWithAmount:5]];
    IAHMoney *reduced = [self.emptyBroker reduce: sum toCurrency: @"USD"];
    XCTAssertEqualObjects(sum, reduced, @"Conversion to some currency should be a NOP");
    
}

-(void)testThatNoRateRaisesException{
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar toCurrency:@"EUR"] , @"No rates should cause exception");
}

-(void) testThatNilConversionDoesnNotChangeMoney{
    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduce:self.oneDollar toCurrency:@"USD"], @"A nil conversion should have no effect");
}

//10 doll =5eur
-(void) testReduction{

    [self.emptyBroker addRate: 2 fromCurrency: @"EUR" toCurrency: @"USD"];
    IAHMoney *dollars = [IAHMoney dollarWithAmount:10];
    IAHMoney *euros = [IAHMoney euroWithAmount:5];
    IAHMoney *converted = [self.emptyBroker reduce:dollars toCurrency:@"EUR"];
    
    XCTAssertEqualObjects(converted, euros, @"10dollars == 5eur, 2:1");
}


@end
