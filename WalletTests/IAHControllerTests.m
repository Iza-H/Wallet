//
//  IAHControllerTests.m
//  Wallet
//
//  Created by Izabela on 14/2/16.
//  Copyright © 2016 Izabela. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IAHSimpleViewController.h"
#import "IAHWalletTableViewController.h"
#import "IAHWallet.h"

@interface IAHControllerTests : XCTestCase
@property(nonatomic, strong) IAHSimpleViewController *simpleVC;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) IAHWalletTableViewController *walletVC;
@property(nonatomic, strong) IAHWallet *wallet;
@end

@implementation IAHControllerTests

- (void)setUp {
    [super setUp];
    self.simpleVC = [[IAHSimpleViewController alloc] initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;

    self.wallet = [[IAHWallet alloc] initWithAmount:1 currency:@"USD"];
    [self.wallet plus: [IAHMoney euroWithAmount:1]];
    self.walletVC = [[IAHWalletTableViewController alloc] initWithModel: self.wallet];
}

- (void)tearDown {
    
    [super tearDown];
    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
}

- (void)testThatTextOnLabelIsEqualToTextOnButton{
    [self.simpleVC displayText:self.button];
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text, @"Buton and label should have the same text");
    
}

-(void) testTheTableHasOneSection{
    NSInteger sections= [self.walletVC numberOfSectionsInTableView: nil];
    XCTAssertEqual(sections, 1, @"The number of section should be 1");
    
}

-(void) testTahtNumberOfCellsIsNumberOfMoneysPlusOne{
    XCTAssertEqual(self.wallet.count +1, [self.walletVC tableView:nil numberOfRowsInSection:0], @"Number of celss is the number of moneys plus 1");
}

@end
