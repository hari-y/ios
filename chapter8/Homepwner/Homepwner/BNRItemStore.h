//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Hari  on 10/18/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
@interface BNRItemStore : NSObject
@property (nonatomic, readonly) NSArray *allItems;
+ (instancetype) sharedStore;
-(BNRItem *) createItem;
@end
