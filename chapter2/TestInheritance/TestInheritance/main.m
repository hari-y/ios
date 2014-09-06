//
//  main.m
//  TestInheritance
//
//  Created by Hari  on 9/6/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "A.h"
#import "B.h"
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
      
        
    }
    return 0;
}

