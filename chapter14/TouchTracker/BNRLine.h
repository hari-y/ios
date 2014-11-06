//
//  BNRLine.h
//  TouchTracker
//
//  Created by Hari  on 11/5/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface BNRLine : UIView

@property (nonatomic) CGPoint begin;
@property (nonatomic) CGPoint end;
@property (nonatomic,strong) NSMutableArray *containingArray;
@end
