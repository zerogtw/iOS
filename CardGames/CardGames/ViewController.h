//
//  ViewController.h
//  CardGames
//
//  Created by 郭添伟 on 16/3/13.
//  Copyright © 2016年 Zero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface ViewController : UIViewController

// peotected
// for subclass
- (Deck *)createDeck; // abstract

@end

