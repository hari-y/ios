//
//  BNRLine.m
//  TouchTracker
//
//  Created by Hari  on 11/5/14.
//  Copyright (c) 2014 Pensersoft. All rights reserved.
//

#import "BNRLine.h"

@implementation BNRLine
-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeCGPoint:self.begin forKey:@"beginPoint"];
    [aCoder encodeCGPoint:self.end forKey:@"endPoint"];
    NSLog(@"encoding begin.x %f & begin.y %f", self.begin.x, self.begin.y);
    NSLog(@"encoding end.x %f & end.y %f", self.end.x, self.end.y);
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.begin = [aDecoder decodeCGPointForKey:@"beginPoint"];
        self.end = [aDecoder decodeCGPointForKey:@"endPoint"];
        NSLog(@"decoding begin.x %f & begin.y %f", self.begin.x, self.begin.y);
        NSLog(@"decoding end.x %f & end.y %f", self.end.x, self.end.y);
    }
    return self;
}
@end
