//
//  IAHMoneyTests.m
//  Wallet
//
//  Created by Izabela on 11/2/16.
//  Copyright © 2016 Izabela. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IAHMoney.h"

@interface IAHMoneyTests : XCTestCase

@end

@implementation IAHMoneyTests

-(void) testCurrencies{
    XCTAssertEqualObjects(@"EUR", [[IAHMoney euroWithAmount:1] currency], @"The currency of euros should be EUR");
    XCTAssertEqualObjects(@"USD", [[IAHMoney dollarWithAmount:1] currency], @"The currency of dollars should be USD");
    
}

-(void) testMultiplication{
    IAHMoney *five = [IAHMoney euroWithAmount: 5];
    IAHMoney *ten = [IAHMoney euroWithAmount: 10];
    IAHMoney *total = [five times : 2];
    XCTAssertEqualObjects(total, ten, @"5 * 2 should be 10");
    
    IAHMoney *fivedollars = [IAHMoney dollarWithAmount: 5];
    IAHMoney *tendollars = [IAHMoney dollarWithAmount: 10];
    IAHMoney *totaldollars = [fivedollars times : 2];
    XCTAssertEqualObjects(totaldollars, tendollars, @"5 * 2 should be 10");
    
    
}

-(void) testEqual{
    IAHMoney *five  = [IAHMoney euroWithAmount:5];
    IAHMoney *ten = [IAHMoney euroWithAmount:10];
    IAHMoney *total = [five times:2];
    XCTAssertEqualObjects(ten, total, @"Exuivalent objects should be equal");
    
    IAHMoney *fivedollars  = [IAHMoney dollarWithAmount:5];
    IAHMoney *tendollars = [IAHMoney dollarWithAmount:10];
    IAHMoney *totaldollars = [fivedollars times:2];
    XCTAssertEqualObjects(tendollars, totaldollars, @"Exuivalent objects should be equal");
    
}

-(void) testDifferentCurriencies{
    IAHMoney *euro = [IAHMoney euroWithAmount:1];
    IAHMoney *dollar = [IAHMoney dollarWithAmount:1];
    XCTAssertNotEqualObjects(euro, dollar, @"Different curriences should not be equal!");
}

-(void) testSimpleAddition{
    IAHMoney *sum = [[IAHMoney euroWithAmount:5] plus: [IAHMoney euroWithAmount:5]];
    
    XCTAssertEqualObjects(sum, [IAHMoney euroWithAmount:10], @"5E + 5E = 10E");
    
    
}

-(void) testHash{
    IAHMoney *a = [IAHMoney euroWithAmount:2];
    IAHMoney *b = [IAHMoney euroWithAmount:2];
    XCTAssertEqual([a hash], [b hash], @"Equal object has the same hash");
    
    IAHMoney *d = [IAHMoney dollarWithAmount:2];
    IAHMoney *d2 = [IAHMoney dollarWithAmount:2];
    XCTAssertEqual([d hash], [d2 hash], @"Equal object has the same hash");
    
}

-(void) testAmountStorage{
    IAHMoney *money = [IAHMoney euroWithAmount:2];
    IAHMoney *moneyDollars = [IAHMoney dollarWithAmount:2];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[money performSelector:@selector(amount)] integerValue] , @"The walue should be the smae as the stored");
    XCTAssertEqual(2, [[moneyDollars performSelector:@selector(amount)] integerValue] , @"The walue should be the smae as the stored");
#pragma clang diagnostic pop
}

-(void) testHashStorage{
    IAHMoney *one = [IAHMoney dollarWithAmount:1];
    XCTAssertEqual([one hash], 1, @"The hash must be the same as the amount");
}
-(void) testDescription{
    IAHMoney *one = [IAHMoney dollarWithAmount:1];
    NSString *desc = @"<IAHMoney: USD 1>";
    XCTAssertEqualObjects(desc, [one description], @"Description must match a template");
}



@end
