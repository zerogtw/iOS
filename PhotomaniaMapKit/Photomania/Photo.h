//
//  Photo.h
//  Photomania
//
//  Created by CS193p Instructor.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Photographer;

@interface Photo : NSManagedObject

@property (nullable, nonatomic, copy) NSString *imageURL;
@property (nullable, nonatomic, copy) NSString *subtitle;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *unique;
@property (nullable, nonatomic, copy) NSNumber *latitude;
@property (nullable, nonatomic, copy) NSNumber *longtitude;
@property (nullable, nonatomic, copy) NSString *thumbnailURL;
@property (nullable, nonatomic, retain) Photographer *whoTook;

@end
