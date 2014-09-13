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



-(instancetype) initWithItemName:(NSString *)name
                    serialNumber:(NSString *) sNumber
{
    self=[super initWithItemName:name];
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
   NSString *descriptionString =[[NSString alloc] initWithFormat:@"%@ Container (%@): worth $%d, recorded on %@ \n",
                      self.itemName , self.serialNumber, self.valueInDollars,self.dateCreated];
    [temp appendString:descriptionString];
    for(int i=0;i<[subItems count];i++)
    {
     descriptionString=[[NSString alloc] initWithFormat:@"child %@  (%d) (%@): worth $%d, recorded on %@ \n",
                                                   [subItems[i] itemName] , i,[subItems[i] serialNumber], [subItems[i]valueInDollars],[subItems[i] dateCreated]];
        [temp appendString:descriptionString];
        
    }
    return temp;
}
@end
