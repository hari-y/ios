//
//  BNRHpnosisViewController.m
//  HpnoNerd
//
//  Created by Hari  on 10/4/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"
//#import "UISegmentedControl.h"

@interface BNRHypnosisViewController()
@property (strong, nonatomic) UISegmentedControl *segCon;

- (void)changeColor:(id)sender;
@end

@implementation BNRHypnosisViewController

-(void) loadView
{
    
    CGRect frame=[UIScreen mainScreen].bounds;
    BNRHypnosisView *backgroundview=[[BNRHypnosisView alloc] initWithFrame:frame];
    self.view=backgroundview;
    self.segCon = [[UISegmentedControl alloc]
                   initWithItems:(NSArray *)@[@"Red",@"Green", @"Blue"]];
    
    self.segCon.frame = CGRectMake(35, 50, 250, 50);
    UIColor *segColor = [UIColor blackColor];
    [self.segCon setTintColor:segColor];
    
    [self.segCon addTarget:self
                    action:@selector(changeColor:)
          forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segCon];
}

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.tabBarItem.title=@"Hypnotize";
        
        UIImage *image=[UIImage imageNamed:@"Hypno.png"];
        
        self.tabBarItem.image=image;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"BNRHypnosisViewController loaded its view");
    // Do any additional setup after loading the view.
}

- (void)changeColor:(id)sender
{
    NSLog(@"The Segment controller was touched %d", self.segCon.selectedSegmentIndex);
    if(self.segCon.selectedSegmentIndex == 0){
        ((BNRHypnosisView *)self.view).circleColor = [UIColor redColor];
    }
    if(self.segCon.selectedSegmentIndex == 1){
        ((BNRHypnosisView *)self.view).circleColor = [UIColor greenColor];
    }
    if(self.segCon.selectedSegmentIndex == 2){
        ((BNRHypnosisView *)self.view).circleColor = [UIColor blueColor];
    }
    
}
@end
