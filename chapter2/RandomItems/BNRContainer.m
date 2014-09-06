//
//  BNRContainer.m
//  RandomItems
//
//  Created by Hari  on 9/4/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import "BNRContainer.h"
//gold challenge
@implementation BNRContainer

-(id)init
{
    self=[super init];
    if(self)
    {
       subItems=[[NSMutableArray alloc]init];
        for(int i=0;i<10;i++)
        {
            BNRItem *bnrItem=[BNRItem randomItem];
            [subItems addObject:bnrItem];
        }
    }
    return self;
}

-(NSString *) description
{
    NSMutableString *temp=[[NSMutableString alloc]init];
   NSString *descriptionString =[[NSString alloc] initWithFormat:@"%@ (%@): worth $%d, recorded on %@",
                      self.itemName , self.serialNumber, self.valueInDollars,self.dateCreated];
    [temp appendString:descriptionString];
    for(int i=0;i<(sizeof subItems);i++)
    {
     descriptionString=[[NSString alloc] initWithFormat:@"%@ (%@): worth $%d, recorded on %@",
                                 self.itemName , self.serialNumber, self.valueInDollars,self.dateCreated];
        [temp appendString:descriptionString];
        
    }
    return descriptionString;
}
@end
