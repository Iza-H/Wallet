//
//  IAHSimpleViewController.h
//  Wallet
//
//  Created by Izabela on 14/2/16.
//  Copyright © 2016 Izabela. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IAHSimpleViewController : UIViewController
- (IBAction)displayText:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@end
