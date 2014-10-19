//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Hari  on 10/18/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"

@interface BNRItemsViewController ()

@end

@implementation BNRItemsViewController

-(instancetype) init
{
    self=[super initWithStyle:UITableViewStylePlain];
    if(self)
    {
        for(int i=0;i<5;i++)
            {
                [[BNRItemStore sharedStore] createItem];
            }
    }
    return self;
}

-(instancetype) initWithStyle:(UITableViewStyle)style
{
    return [self init];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    UITableViewCell *footer = [[UITableViewCell alloc] init];
    footer.textLabel.text = @"No more items!";
    footer.rowHeight=44;
    self.tableView.tableFooterView = footer;
    self.tableView.rowHeight = 60;
     footer.d
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 
        return [[BNRItemsViewController filterItemsForSection:section] count];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"More than $50";
    }
    else {
        return @"Less than $50";
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld %ld", (long)indexPath.section, (long)indexPath.row);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSArray *items;
    BNRItem *item;
    
  items=[BNRItemsViewController filterItemsForSection:indexPath.section];
    
    item = items[indexPath.row];
    cell.textLabel.text = [item description];
    return cell;
}

+ (NSArray *)filterItemsForSection:(NSInteger)section {
    // Filter allItems to have only items for the requested section [elegant solution!]
    NSPredicate *predicate;
    if (section == 0) {         // section 0 === cheap items
        predicate = [NSPredicate predicateWithFormat:@"valueInDollars > 50"];
    }
    else if (section == 1) {    // section 1 === valuable items
        predicate = [NSPredicate predicateWithFormat:@"valueInDollars <= 50"];
    }
    else {
        NSLog(@"Error: Expected no more than two sections");
    }
    
    NSArray *allItems      = [[BNRItemStore sharedStore] allItems];
    NSArray *filteredItems = [allItems filteredArrayUsingPredicate:predicate];
    return filteredItems;
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
