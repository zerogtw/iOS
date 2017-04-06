//
//  Photo+Annotation.m
//  Photomania
//
//  Created by 郭添伟 on 17/3/13.
//  Copyright © 2017年 Stanford University. All rights reserved.
//

#import "Photo+Annotation.h"

@implementation Photo (Annotation)

- (CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D coordinate;
    
    coordinate.latitude = [self.latitude doubleValue];
    coordinate.longitude = [self.longtitude doubleValue];
    
    return coordinate;
}

@end
