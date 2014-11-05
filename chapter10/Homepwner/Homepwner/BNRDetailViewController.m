//
//  BNRDetailViewController.m
//  Homepwner
//
//  Created by Hari  on 11/2/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRDateViewController.h"
#import "BNRItem.h"

@interface BNRDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
- (IBAction)changeDate:(id)sender;
@end

@implementation BNRDetailViewController

- (IBAction)changeDate:(id)sender {
    BNRDateViewController *dvc = [[BNRDateViewController alloc] init];
    dvc.item = self.item;
    
    [self.navigationController pushViewController:dvc animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    BNRItem *item = self.item;
    
    self.nameField.text = item.itemName;
    self.serialNumberField.text = item.serialNumber;
    self.valueField.text = [NSString stringWithFormat:@"%d", item.valueInDollars];
    
    static NSDateFormatter *dateFormatter = nil;
    
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    
    self.dateLabel.text = [dateFormatter stringFromDate:item.dateCreated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
    
    BNRItem *item = self.item;
    item.itemName = self.nameField.text;
    item.serialNumber = self.serialNumberField.text;
    item.valueInDollars = [self.valueField.text intValue];
}
- (void)setItem:(BNRItem *)item
{
    _item = item;
    self.navigationItem.title = _item.itemName;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
    
    //[self.valueField resignFirstResponder];
    //[self.serialNumberField resignFirstResponder]; //Added for serial number
    //[self.nameField resignFirstResponder]; // Added for name
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.serialNumberField ||
        theTextField == self.nameField||
        theTextField == self.valueField) {
        [theTextField resignFirstResponder];
    }
    return YES;
}
@end
