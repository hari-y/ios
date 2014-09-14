//
//  BNRItem.h
//  RandomItems
//
//  Created by Hari  on 9/3/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

@property (nonatomic,copy) NSString *itemName;
@property  (nonatomic,copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic,readonly) NSDate *dateCreated;
@property (nonatomic,strong) BNRItem *containedItem;
@property (nonatomic,weak) BNRItem *container;


+ (instancetype) randomItem;
-(instancetype) initWithItemName:(NSString *) name
                  valueInDollars:(int) value
                    serialNumber:(NSString *) sNumber;

-(instancetype) initWithItemName:(NSString *) name
                    serialNumber:(NSString *) sNumber;

-(instancetype) initWithItemName:(NSString *) name;


@end
