//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Hari  on 10/18/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRDetailViewController.h"

@interface BNRItemsViewController ()
@property (nonatomic,strong) IBOutlet UIView *headerView;
@end

@implementation BNRItemsViewController

/*-(UIView *) headerView
{
    if(!_headerView)
    {
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView"
                                     owner:self
                                     options:nil];
    }
    return _headerView;
}*/

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([indexPath row] < [[[BNRItemStore sharedStore] allItems] count])
    {
    BNRDetailViewController *detailViewController=[[BNRDetailViewController alloc]init];
    NSArray *items=[[BNRItemStore sharedStore]allItems];
    BNRItem *selectedItem=items[indexPath.row];
    detailViewController.item=selectedItem;
    
    [self.navigationController pushViewController:detailViewController animated:YES];
    }
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
-(IBAction) addNewItem:(id) sender
{
    BNRItem *newItem=[[BNRItemStore sharedStore]createItem];
    NSInteger lastRow=[[[BNRItemStore sharedStore]allItems]indexOfObject:newItem];
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:lastRow inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    
}

/*-(IBAction) toggleEditingMode:(id)sender
{
    if(self.isEditing)
    {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self setEditing:NO animated:YES];
    }
    else
    {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
    
}*/

-(instancetype) init
{
    self=[super initWithStyle:UITableViewStylePlain];
    if(self)
    {
        UINavigationItem *navItem=self.navigationItem;
        navItem.title=@"Homepwner";
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
        
        navItem.rightBarButtonItem = bbi;
        navItem.leftBarButtonItem = self.editButtonItem;
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
    
 //   UIView *header=self.headerView;
   // [self.tableView setTableHeaderView:header];

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



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
     return [[[BNRItemStore sharedStore] allItems] count] + 1;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    if([indexPath row] < [[[BNRItemStore sharedStore] allItems] count]) {
        BNRItem *p = [[[BNRItemStore sharedStore] allItems] objectAtIndex:[indexPath row]];
        [[cell textLabel] setText:[p description]];
    } else {
        [[cell textLabel] setText:@"No more items"];
    }
    
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
   // UITableViewCell *item = [tableView cellForRowAtIndexPath:indexPath];
    
    if([indexPath row] < [[[BNRItemStore sharedStore] allItems] count]) {
        return YES;
    }
    else
    return NO;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *items=[[BNRItemStore sharedStore]allItems];
        BNRItem *item=items[indexPath.row];
        [[BNRItemStore sharedStore]removeItem:item];
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if (proposedDestinationIndexPath.row >= [[[BNRItemStore sharedStore] allItems] count]) {
        return sourceIndexPath;
    }
    
    return proposedDestinationIndexPath;
}

// Override to support rearranging the table view.
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    if (toIndexPath.row < [[[BNRItemStore sharedStore] allItems] count]) {
        [[BNRItemStore sharedStore] moveItemAtIndex:fromIndexPath.row toIndex:toIndexPath.row];
    }
    
}

//bronze challenge
-(NSString *)tableView:(UITableView *)tableView :(NSIndexPath *)indexPath {
    return @"Remove!";
}


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
