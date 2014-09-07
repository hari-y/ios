//
//  main.m
//  RandomItems
//
//  Created by Hari  on 9/3/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"
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
        
        
        BNRItem *itemWithName= [[BNRItem alloc]initWithItemName:@"Blue Sofa" serialNumber:@"3"];
        NSLog(@"%@",itemWithName);
        
        BNRItem *itemWithNoName=[[BNRItem alloc]init];
        NSLog(@"%@",itemWithNoName);
        items=nil;
        
         NSMutableArray *items1=[[NSMutableArray alloc] init];
        for (int i=0;i<10;i++)
        {
            BNRItem *item=[BNRItem randomItem];
            [items1 addObject:item];
            
        }
        
        for(BNRItem *item in items1)
        {
            NSLog(@"%@",item);
        }
        /* id lastObj1=[items lastObject];
        NSLog(@"dosa %lu",[ lastObj1 count]);
        id lastObj=[items1 lastObject];
        [lastObj count];*/
       // items1[11]; Bronze challenge NSRangeException
        items1=nil;
        
        //gold channgenge
        BNRContainer *containerWithName= [[BNRContainer alloc]initWithItemName:@"Blue Sofa" serialNumber:@"3"];
        NSLog(@"%@",containerWithName.description);
        
    }
    return 0;
}

