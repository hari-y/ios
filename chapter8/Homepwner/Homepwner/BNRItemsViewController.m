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
    
        self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    // footer.d
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath   *)indexPath
{
    //NSLog(@"index path length %d index path row %d",indexPath.,indexPath.row);
    
    if([indexPath row] < [[[BNRItemStore sharedStore] allItems] count]) {
        return 60;
    }
    else
    {
        return 20;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [[BNRItemsViewController filterItemsForSection:section] count] ;
    }
    else {
        return [[BNRItemsViewController filterItemsForSection:section] count]+1 ;
    }
   
 
    
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0 ) {
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    NSArray *items;
    BNRItem *item;
    
    items=[BNRItemsViewController filterItemsForSection:indexPath.section];
    if(indexPath.section==0 || (indexPath.section==1 && indexPath.row<indexPath.length)) {
       
        
        item = items[indexPath.row];
        cell.textLabel.text = [item description];
        cell.textLabel.font = [UIFont systemFontOfSize:20.0];
        cell.backgroundColor = [UIColor clearColor];
     
    }
    else {
        [[cell textLabel] setText:@"No more items!"];
    }
   
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
