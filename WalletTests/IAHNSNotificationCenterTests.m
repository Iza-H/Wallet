//
//  IAHNSNotificationCenterTests.m
//  Wallet
//
//  Created by Izabela on 14/2/16.
//  Copyright © 2016 Izabela. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IAHFakeNotificationCenter.h"
#import "IAHWallet.h"

@interface IAHNSNotificationCenterTests : XCTestCase

@end

@implementation IAHNSNotificationCenterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testThatSubscribesToMemoryWarning{
    IAHFakeNotificationCenter *fake = [IAHFakeNotificationCenter new];
    IAHWallet *w = [IAHWallet new];
    [w subscribeToMemoryWarning:(NSNotificationCenter *)fake];
    NSDictionary *obs = [fake observers];
    id observer = [obs objectForKey:UIApplicationDidReceiveMemoryWarningNotification];
    XCTAssertEqualObjects(observer, w, @"Fat object must subscribe to UIApplicationDidReceiveMemoryWarningNotification");
}

@end
