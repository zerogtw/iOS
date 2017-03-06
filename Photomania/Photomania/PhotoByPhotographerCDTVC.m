//
//  PhotoByPhotographerCDTVC.m
//  Photomania
//
//  Created by 郭添伟 on 17/3/4.
//  Copyright © 2017年 Stanford University. All rights reserved.
//

#import "PhotoByPhotographerCDTVC.h"

@interface PhotoByPhotographerCDTVC ()

@end

@implementation PhotoByPhotographerCDTVC

- (void)setPhotograpger:(Photographer *)photograpger
{
    _photograpger = photograpger;
    self.title = photograpger.name;
    [self setupFetchedResultController];
}

- (void)setupFetchedResultController
{
    NSManagedObjectContext *context = self.photograpger.managedObjectContext;
    
    if (context) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photo"];
        request.predicate = [NSPredicate predicateWithFormat:@"whoTook = %@", self.photograpger];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES selector:@selector(localizedStandardCompare:)]];
        
        self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                            managedObjectContext:context
                                                                              sectionNameKeyPath:nil
                                                                                       cacheName:nil];
    } else {
        self.fetchedResultsController = nil;
    }
}
@end
