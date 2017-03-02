//
//  ViewController.h
//  Fraction_Calculator
//
//  Created by 郭添伟 on 16/2/21.
//  Copyright © 2016年 com.zero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(strong, nonatomic) IBOutlet UILabel *display;

-(void)processDigit:(int)digit;
-(void)processOp:(char)theOp;
-(void)storeFracPart;

//数字键

- (IBAction)clickDigit: (UIButton*) sender;

//算数操作符

- (IBAction)clickPlus;
- (IBAction)clickMinus;
- (IBAction)clickMultiply;
- (IBAction)clickDivide;

//Misc键

- (IBAction)clickOver;
- (IBAction)clickEqual;
- (IBAction)clickClear;

@end

