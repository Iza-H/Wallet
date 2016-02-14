//
//  IAHWalletTableViewController.m
//  Wallet
//
//  Created by Izabela on 14/2/16.
//  Copyright © 2016 Izabela. All rights reserved.
//

#import "IAHWalletTableViewController.h"
#import "IAHBroker.h"

@interface IAHWalletTableViewController ()
@property (nonatomic, strong) IAHWallet *model;
@property (nonatomic, strong) NSDictionary *currency;
@end

@implementation IAHWalletTableViewController

-(id) initWithModel: (IAHWallet *) model{
    if (self = [super initWithStyle:UITableViewStylePlain]){
        _model = model;
        _currency =  [model getNumberOfDifferentCurrency];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.currency =  [self.model getNumberOfDifferentCurrency];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.model getNumberOfDifferentCurrency] count] + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSDictionary *currency =  [self.model getNumberOfDifferentCurrency];
    NSArray *keys = [self.currency allKeys];
    if ([self.currency count]<=section){
        return 1;
    } else{
        return [[self.currency objectForKey: [keys objectAtIndex:section]] count] + 1;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }

    if (indexPath.section<[self.currency count]){
        NSArray *keys = [self.currency allKeys];
        NSString *currencyName = [keys objectAtIndex:indexPath.section];
        NSArray*amounts = [self.currency objectForKey:currencyName];
        if (indexPath.row < [amounts count]){
            cell.textLabel.text = [NSString stringWithFormat:@"%@", [amounts objectAtIndex:indexPath.row]] ;
        }else{
            IAHMoney *sum  = [[IAHMoney alloc] initWithAmount:0 currency:[keys objectAtIndex:indexPath.section]];
            for (int i = 0; i<[amounts count]; i++){
                sum = [sum plus: [[IAHMoney alloc] initWithAmount:[[amounts objectAtIndex:i] integerValue]  currency:currencyName]];
            }
            //[self.sumWallet setObject:sum forKey:currencyName];
            cell.textLabel.text = [NSString stringWithFormat:@"Total %@ - %@" , [keys objectAtIndex:indexPath.section], [sum amount]] ;
            //cell.textLabel.text = [NSString stringWithFormat:@"Total %@ - %@" , currencyName, [[self.sumWallet objectForKey:currencyName] amount]] ;
        }
    }else{
        IAHBroker *broker = [IAHBroker new];
        [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
        //IAHWallet *wallet = [[IAHWallet alloc] initWithAmount:40 currency:@"EUR"];
        //[wallet plus: [IAHMoney dollarWithAmount:20] ];
        IAHMoney *reduced = [broker reduce:self.model toCurrency:@"EUR"];
        //XCTAssertEqualObjects(reduced, [IAHMoney dollarWithAmount:100], @"40E + 20$ = 100$, 2:1");
        cell.textLabel.text = [NSString stringWithFormat: @"%@",[reduced amount]] ;
    }
    
    // Configure the cell...
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    //NSDictionary *currency =  [self.model getNumberOfDifferentCurrency];
    NSArray *keys = [self.currency allKeys];
    if ([self.currency count]<=section){
        return @"TOTAL IN EUR";
    } else{
        return  [keys objectAtIndex:section];
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
