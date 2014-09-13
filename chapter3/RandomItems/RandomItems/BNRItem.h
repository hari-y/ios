//
//  BNRItem.h
//  RandomItems
//
//  Created by Hari  on 9/3/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

@property NSString *itemName;
@property  NSString *serialNumber;
@property int valueInDollars;
@property NSDate *dateCreated;
@property BNRItem *containedItem;
@property BNRItem *container;


+ (instancetype) randomItem;
-(instancetype) initWithItemName:(NSString *) name
                  valueInDollars:(int) value
                    serialNumber:(NSString *) sNumber;

-(instancetype) initWithItemName:(NSString *) name
                    serialNumber:(NSString *) sNumber;

-(instancetype) initWithItemName:(NSString *) name;


@end
