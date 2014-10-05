//
//  BNRHpnosisViewController.m
//  HpnoNerd
//
//  Created by Hari  on 10/4/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

-(void) loadView
{
    
    CGRect frame=[UIScreen mainScreen].bounds;
    BNRHypnosisView *backgroundview=[[BNRHypnosisView alloc] initWithFrame:frame];
    self.view=backgroundview;
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
@end
