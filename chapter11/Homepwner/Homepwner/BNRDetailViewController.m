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
#import "BNRImageStore.h"

@interface BNRDetailViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)changeDate:(id)sender;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;

@end

@implementation BNRDetailViewController

- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];
}
- (IBAction)clearImage:(id)sender {
    if ([self.item itemKey ]) {
        
        // Remove the image from the screen
        [self.imageView setImage:nil];
        
        // Delete the image form the image store
        [[BNRImageStore sharedStore] deleteImageForKey:[self.item itemKey]];
        
        // Delete the imageKey of the item
        //[self.item setItemKey:nil];
        
        // Hide the clearImage button
        [self.clearButton setHidden:YES];
    }
}

- (IBAction)takePicture:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc ]init];
     imagePicker.allowsEditing = YES;
    // if the device has a camera, take a picture, otherwise
    // just pick from photo library
    if ([UIImagePickerController
         isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    //  next three lines are from for the more curious: recording video
   /* NSArray *availableTypes = [UIImagePickerController
                               availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    imagePicker.mediaTypes = availableTypes;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
   */
     imagePicker.delegate = self;
    // PLACE IMAGE PICKER ON THE SCREEN
    [self presentViewController:imagePicker animated:YES completion:nil];

}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image=info[UIImagePickerControllerOriginalImage];
    [[BNRImageStore sharedStore]setImage:image forKey:self.item.itemKey];
    self.imageView.image=image;
    [self dismissViewControllerAnimated:YES completion:NULL];
    [self.clearButton setHidden:NO];
}

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
    NSString *itemKey=item.itemKey;
    if ([self.item itemKey ]) {
    UIImage *imageToDisplay=[[BNRImageStore sharedStore]imageForKey:itemKey];
    self.imageView.image=imageToDisplay;
        if(imageToDisplay==nil)
          [self.clearButton setHidden:YES];
    }
    
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
