//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by Hari  on 8/24/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()
@property (nonatomic) int currentQuestionIndex;
@property (nonatomic,copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;
@property (nonatomic,weak) IBOutlet UILabel *questionLabel;
@property (nonatomic,weak) IBOutlet UILabel *answerLabel;
@end

@implementation BNRQuizViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self= [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self)
    {
        self.questions=@[@"What is capital of Tonga ?",
                         @"What is the value of LOGe?",
                         @"What is sugar chemical formula?" ];
        self.answers=@[@"Nuku'alofa",@"1",@"Cn(H2O)n"];
        self.tabBarItem.title=@"Quiz";
        
      //  UIImage *image=[UIImage imageNamed:@"Hypno.png"];
        
      // self.tabBarItem.image=image;
    }
    return self;
}

- (IBAction)showQuestion:(id)sender
{
    self.currentQuestionIndex++;
    if(self.currentQuestionIndex ==[self.questions count])
    {
        self.currentQuestionIndex=0;
        
    }
    
    NSString *question=self.questions[self.currentQuestionIndex];
    self.questionLabel.text=question;
    self.answerLabel.text=@"??";
}

- (IBAction)showAnswer:(id)sender
{
    NSString *answer= self.answers[self.currentQuestionIndex];
    self.answerLabel.text=answer;
    
}

@end
