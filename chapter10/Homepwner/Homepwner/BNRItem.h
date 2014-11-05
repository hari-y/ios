//
//  BNRItem.h
//  RandomItems
//
//  Created by Hari  on 9/3/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
NSString *_itemName;
NSString *_serialNumber;
int _valueInDollars;
NSDate *_dateCreated;
}

+ (instancetype) randomItem;
-(instancetype) initWithItemName:(NSString *) name
                  valueInDollars:(int) value
                    serialNumber:(NSString *) sNumber;

-(instancetype) initWithItemName:(NSString *) name
                    serialNumber:(NSString *) sNumber;

-(instancetype) initWithItemName:(NSString *) name;
-(void) setItemName:(NSString *) str;
-(NSString *)itemName;

-(void) setSerialNumber:(NSString *) str;
-(NSString *) serialNumber;

-(void)setValueInDollars:(int)v;
-(int) valueInDollars;

-(NSDate *) dateCreated;
-(void)setDateCreated:(NSDate *)date;
@end
