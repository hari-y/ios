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

@interface BNRHypnosisViewController() <UITextFieldDelegate,UIScrollViewDelegate>
@property (strong, nonatomic) UISegmentedControl *segCon;

- (void)changeColor:(id)sender;
@end

@implementation BNRHypnosisViewController

-(void) loadView
{
    
    CGRect screenRect=[UIScreen mainScreen].bounds;
    CGRect bigRect=screenRect;
    bigRect.size.width *=3.0;
   
   // bigRect.size.height *=2.0;
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:screenRect];
  //  [self.view addSubview:scrollView];
    
    // BNRHypnosisView *hypnosisView=[[BNRHypnosisView alloc] initWithFrame:bigRect];
    BNRHypnosisView *hypnosisView=[[BNRHypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:hypnosisView];
    
    
    //add second hypnosis view
    screenRect.origin.x+=screenRect.size.width;
    BNRHypnosisView *anotherView=[[BNRHypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:anotherView];
    
    scrollView.contentSize=bigRect.size;
   
   // BNRHypnosisView *backgroundview=[[BNRHypnosisView alloc] initWithFrame:frame];
    
    CGRect textFieldRect=CGRectMake(40,70,240,30);
    UITextField *textField=[[UITextField alloc] initWithFrame:textFieldRect];
    textField.borderStyle=UITextBorderStyleRoundedRect;
    textField.placeholder=@"Hypnotize me";
    textField.returnKeyType=UIReturnKeyDone;
    textField.delegate=self;
    
    UITextField *textField1=[[UITextField alloc] initWithFrame:textFieldRect];
    textField1.borderStyle=UITextBorderStyleRoundedRect;
    textField1.placeholder=@"Hypnotize me";
    textField1.returnKeyType=UIReturnKeyDone;
    textField1.delegate=self;
    [hypnosisView addSubview:textField];
    [anotherView addSubview:textField1];
    self.view=scrollView;
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

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [self drawHypnoticMessage:textField.text];
    textField.text=@"";
    [textField resignFirstResponder];
    return YES;
}

-(void) drawHypnoticMessage:(NSString *) message
{
    for(int i=0;i<20;i++)
    {
        UILabel *messageLabel=[[UILabel alloc]init];
        
        messageLabel.backgroundColor=[UIColor clearColor];
        messageLabel.textColor=[UIColor whiteColor];
        messageLabel.text=message;
        
        [messageLabel sizeToFit];
       
        int width=self.view.bounds.size.width-messageLabel.bounds.size.width;
            int height=self.view.bounds.size.height-messageLabel.bounds.size.height;
        int x=(arc4random()%width)*2;//two support two hypnosis views
        int y=arc4random()%height;
        
        CGRect frame=messageLabel.frame;
        frame.origin=CGPointMake(x,y);
        messageLabel.frame=frame;
        
        [self.view addSubview:messageLabel];
        
        //motion effect
        
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect=[[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:(UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis)];
        motionEffect.minimumRelativeValue=@-25;
        motionEffect.maximumRelativeValue=@25;
        [messageLabel addMotionEffect:motionEffect];
        
        motionEffect=[[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.y" type:(UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis)];
        motionEffect.minimumRelativeValue=@-25;
        motionEffect.maximumRelativeValue=@25;
        [messageLabel addMotionEffect:motionEffect];
        
    }
}
@end
