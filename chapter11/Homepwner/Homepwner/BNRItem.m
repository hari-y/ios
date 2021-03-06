//
//  BNRItem.m
//  RandomItems
//
//  Created by Hari  on 9/3/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem


-(instancetype) initWithItemName:(NSString *)name
                  valueInDollars:(int) value
                    serialNumber:(NSString *) sNumber
{
    self=[super init];
    if(self)
    {
        _itemName=name;
        _serialNumber=sNumber;
        _valueInDollars=value;
        _dateCreated=[[NSDate alloc] init];
        
        NSUUID *uuid=[[NSUUID alloc]init];
        NSString *key=[uuid UUIDString];
        _itemKey=key;
    }
    return self;
}
//silver challenge
-(instancetype) initWithItemName:(NSString *)name
                    serialNumber:(NSString *) sNumber
{
    self=[super init];
    if(self)
    {
        _itemName=name;
        _serialNumber=sNumber;
                _dateCreated=[[NSDate alloc] init];
    }
    return self;
}

-(instancetype) initWithItemName:(NSString *)name
{
    return [self initWithItemName:name valueInDollars:0 serialNumber:@""];
    
    
}

-(instancetype)init{
    return [self initWithItemName:@"Item"];
}

+(instancetype)randomItem
{
    NSArray *randomAdjectiveList=@[@"Fluffy",@"Rusty",@"Shiny"];
    NSArray *randomNounList=@[@"Bear",@"Spork",@"MAc"];
    
    NSInteger adjectiveIndex=arc4random()%[randomNounList count];
    
    NSInteger nounIndex=arc4random() %[randomNounList count];
    
    NSString *randomName=[NSString stringWithFormat:@"%@ %@", randomAdjectiveList[adjectiveIndex],
                          randomNounList [nounIndex]];
    int randomValue=arc4random()%100;
    NSString *randomSerialNumber=[NSString stringWithFormat:@"%c%c%c%c%c",
                                  '0'+arc4random()%10,
                                  'A'+arc4random()%26,
                                  '0'+arc4random()%10,
                                  'A'+arc4random()%26,
                                  '0'%arc4random()%10];
    BNRItem *newItem=[[self alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
    return newItem;
                                   
                                   
}


-(void) setItemName:(NSString *) str
{
    _itemName=str;
}

-(NSString *) itemName
{
    return _itemName;
}

-(void) setItemKey:(NSString *) str
{
    _itemKey=str;
}

-(NSString *) itemKey
{
    return _itemKey;
}

-(void) setSerialNumber:(NSString *) str
{
    _serialNumber=str;
    
}

-(NSString *) serialNumber
{
    return _serialNumber;
}


-(void) setValueInDollars:(int)v
{
    _valueInDollars=v;
}

-(int) valueInDollars
{
    return _valueInDollars;
}


-(void) setDateCreated:(NSDate *) date
{
    _dateCreated=date;
    
}

-(NSDate *) dateCreated
{
    return _dateCreated;
}

-(NSString *) description
{
    NSString *descriptionString=[[NSString alloc] initWithFormat:@"%@ (%@): worth $%d, recorded on %@",
                                 self.itemName , self.serialNumber, self.valueInDollars,self.dateCreated];
    return descriptionString;
}
@end
