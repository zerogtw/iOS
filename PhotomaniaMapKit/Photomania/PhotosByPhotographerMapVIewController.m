//
//  PhotosByPhotographerMapVIewController.m
//  Photomania
//
//  Created by 郭添伟 on 17/3/13.
//  Copyright © 2017年 Stanford University. All rights reserved.
//

#import "PhotosByPhotographerMapVIewController.h"
#import <MapKit/MapKit.h>
#import "Photo.h"
#import "ImageViewController.h"

@interface PhotosByPhotographerMapVIewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) NSArray *photosByPhotographer; // of Photo

@end

@implementation PhotosByPhotographerMapVIewController

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *reuseId = @"PhotosByPhotographerMapVIewController";
    MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:reuseId];
    if(!view){
        view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseId];
        view.canShowCallout = YES;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 46, 46)];
        view.leftCalloutAccessoryView = imageView;
        UIButton *disclosureButton = [[UIButton alloc] init];
        [disclosureButton setBackgroundImage:[UIImage imageNamed:@"disclosure"] forState:UIControlStateNormal];
        [disclosureButton sizeToFit];
        view.rightCalloutAccessoryView = disclosureButton;
    }
    view.annotation = annotation;

    
    return view;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    [self updateLeftCalloutAccessoryViewInAnnonation:view];
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    [self performSegueWithIdentifier:@"Show Photo" sender:view];
}

- (void)prepareViewController:(id)vc
                    forSegue:(NSString *)segueIdentifier
            toShowAnnotation:(id <MKAnnotation>)annotation
{
    Photo *photo = nil;
    if ([annotation isKindOfClass:[Photo class]]) {
        photo = (Photo *)annotation;
    }
    if (photo) {
        if (![segueIdentifier length] || [segueIdentifier isEqualToString:@"Show Photo"]) {
            if ([vc isKindOfClass:[ImageViewController class]]) {
                ImageViewController *ivc = (ImageViewController *)vc;
                ivc.imageURL = [NSURL URLWithString:photo.imageURL];
                ivc.title = photo.title;
            }
        }
    }
}

- (void)updateLeftCalloutAccessoryViewInAnnonation:(MKAnnotationView *)annotationView
{
    UIImageView *imageView = nil;
    if ([annotationView.leftCalloutAccessoryView isKindOfClass:[UIImageView class]]) {
        imageView = (UIImageView *)annotationView.leftCalloutAccessoryView;
    }
    if (imageView) {
        Photo *photo = nil;
        if ([annotationView.annotation isKindOfClass:[Photo class]]) {
            photo = (Photo *)annotationView.annotation;
        }
        if (photo) {
#warning Blocking main queue!
            imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:photo.thumbnailURL]]];
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[MKAnnotationView class]]) {
        [self prepareViewController:segue.destinationViewController forSegue:segue.identifier toShowAnnotation:((MKAnnotationView *)sender).annotation];
    }
}



- (void)updateMapViewAnnotations
{
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView addAnnotations:self.photosByPhotographer];
    [self.mapView showAnnotations:self.photosByPhotographer animated:YES];
}

- (void)setMapView:(MKMapView *)mapView
{
    _mapView = mapView;
    self.mapView.delegate = self;
    [self updateMapViewAnnotations];
}

- (void)setPhotograpger:(Photographer *)photograpger
{
    _photograpger = photograpger;
    self.title = photograpger.name;
    self.photosByPhotographer = nil;
    [self updateMapViewAnnotations];
}

- (NSArray *)photosByPhotographer
{
    if (!_photosByPhotographer) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photo"];
        request.predicate = [NSPredicate predicateWithFormat:@"whoTook = %@", self.photograpger];
        _photosByPhotographer = [self.photograpger.managedObjectContext executeFetchRequest:request error:NULL];
    }
    return _photosByPhotographer;
}

@end
