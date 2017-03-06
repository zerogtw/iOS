//
//  URLVIewController.m
//  Photomania
//
//  Created by 郭添伟 on 17/3/6.
//  Copyright © 2017年 Stanford University. All rights reserved.
//

#import "URLViewController.h"

@interface URLViewController ()

@property (weak, nonatomic) IBOutlet UITextView *urlTextView;

@end

@implementation URLViewController

- (void)setUrl:(NSURL *)url
{
    _url = url;
    [self updateUI];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self updateUI];
}

-(void)updateUI
{
    self.urlTextView.text = [self.url absoluteString];
}
@end
