//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Hari  on 10/18/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"
#import "BNRImageStore.h"
@interface BNRItemStore()
@property (nonatomic) NSMutableArray *privateItems;
@end
@implementation BNRItemStore

+(instancetype) sharedStore
{
    static BNRItemStore *sharedStore;
    
    if(!sharedStore)
    {
        sharedStore=[[self alloc] initPrivate];
    }
    return sharedStore;
}

-(instancetype) init
{
    [NSException raise:@"Singleton" format:@"Use +[BNRItemStore sharedStore]"];
    return nil;
}

-(void) removeItem:(BNRItem *) item
{
    NSString *key=item.itemKey;
    [[BNRImageStore sharedStore]deleteImageForKey:key];
    [self.privateItems removeObjectIdenticalTo:item];
}
-(void) moveItemAtIndex:(NSUInteger) fromIndex
                toIndex:(NSUInteger)toIndex
{
    if(fromIndex==toIndex)
    {
        return;
    }
    
    BNRItem *item=self.privateItems[fromIndex];
    [self.privateItems removeObjectAtIndex:fromIndex];
    [self.privateItems insertObject:item atIndex:toIndex];
}

-(instancetype)initPrivate
{
    self=[super init];
    if(self)
    {
        _privateItems=[[NSMutableArray alloc]init];
    }
    return self;
}
-(BNRItem *) createItem{
    BNRItem *item=[BNRItem randomItem];
    [self.privateItems addObject:item] ;
    return item;
}

- (NSArray *)allItems
{
    return [self.privateItems copy];
}
@end
