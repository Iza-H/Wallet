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

    //self.wallet = [[IAHWallet alloc] initWithAmount:1 currency:@"USD"];
    //[self.wallet plus: [IAHMoney euroWithAmount:1]];
    //self.walletVC = [[IAHWalletTableViewController alloc] initWithModel: self.wallet];
    
    self.wallet = [[IAHWallet alloc] initWithAmount:25 currency:@"EUR"];
    [self.wallet plus:[IAHMoney dollarWithAmount:6]];
    [self.wallet plus:[IAHMoney dollarWithAmount:14]];
    [self.wallet plus:[IAHMoney euroWithAmount:15]];
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
    XCTAssertEqual(sections, [[self.wallet getDictionaryWithDifferentCurrency] count] +  1, @"The number of sections should be a number of currencies + 1");
    
}

-(void) testThatNumberOfCellsIsNumberOfMoneysPlusOne{
    NSArray *obj = [[self.wallet getDictionaryWithDifferentCurrency] objectForKey:@"EUR"];
    NSInteger n = [obj count] + 1;
    NSInteger numbersOfRow = [self.walletVC tableView:nil numberOfRowsInSection:0];
    XCTAssertEqual(n, [self.walletVC tableView:nil numberOfRowsInSection:0], @"Number of cells is the number of moneys plus 1");
}

@end
