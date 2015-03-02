//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by Hari  on 11/5/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@implementation BNRDrawViewController

- (void)loadView
{
    self.view = [[BNRDrawView alloc] initWithFrame:CGRectZero];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(saveChanges:)
                                                 name: @"EVENT_APP_BACKGROUND"
                                               object: nil];
}

- (void) saveChanges: (NSNotification*) notification
{
    UIView *uiView=self.view;
    
    if([uiView isKindOfClass:[BNRDrawView class]]) {
        BNRDrawView *bnrView = (BNRDrawView *)uiView;
        [bnrView saveChanges];
        BOOL result= bnrView.saveChanges;
       NSLog(@"Output of saved result %@", result ? @"YES" : @"NO");
    }
    
}

@end
