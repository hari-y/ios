//
//  main.m
//  RandomItems
//
//  Created by Hari  on 9/3/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSMutableArray *items=[[NSMutableArray alloc] init];
        [items addObject:@"one"];
        [items addObject:@"two"];
        [items addObject:@"three"];
        
        [items insertObject:@"Zero" atIndex:0];
        
        for(NSString *item in items){
            NSLog(@"%@", item);
        }
        items=nil;
        
        int a=32;
     
        float b=89.99;
        char c='A';
        NSLog(@"Integer %d Float %f char: %c",a,b,c);
        
        BNRItem *item=[[BNRItem alloc] init];
        
        item.itemName=@"Red Sofa";
        item.serialNumber=@"A1B2C";
        item.valueInDollars=100;
        NSLog(@"%@ ",item);
        items=nil;
    }
    return 0;
}

