//
//  JustPostedFlikrPhotosTVC.m
//  Shutterbug
//
//  Created by 郭添伟 on 16/10/31.
//  Copyright © 2016年 Zero. All rights reserved.
//

#import "JustPostedFlikrPhotosTVC.h"
#import "FlickrFetcher.h"

@interface JustPostedFlikrPhotosTVC ()

@end

@implementation JustPostedFlikrPhotosTVC

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self fetchPhotos];
}

-(IBAction)fetchPhotos
{
    [self.refreshControl beginRefreshing];
    NSURL *url = [FlickrFetcher URLforRecentGeoreferencedPhotos];
    dispatch_queue_t fetchQ= dispatch_queue_create("flickr fetcher", NULL);
    dispatch_async(fetchQ, ^(){
        NSData *jsonResult = [NSData dataWithContentsOfURL:url];
        NSDictionary *propertyListResult = [NSJSONSerialization JSONObjectWithData:jsonResult
                                                                           options:0
                                                                             error:NULL];
        NSLog(@"Fetch result is %@", propertyListResult);
        NSArray *photos = [propertyListResult valueForKeyPath:FLICKR_RESULTS_PHOTOS];
        dispatch_async(dispatch_get_main_queue(), ^(){
            [self.refreshControl endRefreshing];
            self.photos = photos;
        });

    });


}



@end
