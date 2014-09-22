//
//  main.m
//  TestInheritance
//
//  Created by Hari  on 9/6/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "A.h"
#import "VariablesTest.h"
#import "VariablesTestSubClass.h"
#import "B.h"
#import "PrivateTest.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        id temp=[[B alloc]init];
      //  B *temp1=[[B alloc]init];
       // A* temp2=temp1;
        [temp atest];
         [temp abtest];
         [temp btest];
      
        VariablesTestSubClass *temp1=[[VariablesTestSubClass alloc]init];
        [temp1 test];
       // NSLog(@(%@ %@ %@", test->publicString ,test->privateString ,test->defaultString"));
        //temp1.publicInt=4;
       // temp1.publicString=@"uthere";
        
      //  VariablesTest *temp2=[[VariablesTest alloc]init];
        //temp1.publicInt=4;
      //  temp2.publicString=@"uthere";
        
        id p=[[PrivateTest alloc]init];
        [p atest];
      NSLog(@"%@",[p atest]);
        
    }
    return 0;
}

