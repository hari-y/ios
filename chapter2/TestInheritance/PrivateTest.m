//
//  PrivateTest.m
//  TestInheritance
//
//  Created by Hari  on 9/21/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import "PrivateTest.h"

@interface PrivateTest()

@property  id atest;



@end
@implementation PrivateTest
-(instancetype) init
{
    self=[super init];
    self.atest=@"helloooo";
    return self;
}

@end
