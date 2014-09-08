//
//  VariablesTestSubClass.m
//  TestInheritance
//
//  Created by Hari  on 9/7/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import "VariablesTestSubClass.h"

@implementation VariablesTestSubClass

- (void) test
{
    self->publicString=@"publicString";
    self->protectedString=@"protectedString";
    self->defaultString=@"defaultString";
    NSLog(@"%@ %@ %@", self->publicString ,self->protectedString ,self->defaultString);
}
@end
