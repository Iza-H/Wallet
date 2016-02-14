//
//  IAHNetworkTests.m
//  Wallet
//
//  Created by Izabela on 14/2/16.
//  Copyright © 2016 Izabela. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IAHBroker.h"

@interface IAHNetworkTests : XCTestCase

@end

@implementation IAHNetworkTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


-(void) testThatEmptyRatesRaisesException{
    IAHBroker *broker = [IAHBroker new];
    NSData *jsonData = nil;
    XCTAssertThrows([broker parseJSONRates: jsonData], @"An empty json should raise an exception");
    
}

@end
