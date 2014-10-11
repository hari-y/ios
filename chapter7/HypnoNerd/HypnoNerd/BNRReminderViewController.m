//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Hari  on 10/4/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()

@end

@implementation BNRReminderViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.tabBarItem.title=@"Reminder";
        
        UIImage *image=[UIImage imageNamed:@"Time.png"];
        
        self.tabBarItem.image=image;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"BNRReminderViewController loaded its view");
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) addReminder:(id) sender
{
    NSDate *date=self.datePicker.date;
    NSLog(@"Setting a reminder for %@",date);
    
    UILocalNotification *note=[[UILocalNotification alloc]init];
    note.alertBody=@"Hypnotize me!";
    note.fireDate=date;
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.datePicker.minimumDate=[NSDate dateWithTimeIntervalSinceNow:60];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
