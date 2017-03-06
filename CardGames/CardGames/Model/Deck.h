//
//  Deck.h
//  CardGames
//
//  Created by 郭添伟 on 16/3/14.
//  Copyright © 2016年 Zero. All rights reserved.
//

#ifndef Deck_h
#define Deck_h


#endif /* Deck_h */

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void) addCard:(Card *) card atTop:(BOOL)atTop;
-(void) addCard:(Card *) card;

-(Card *)drawRandomCard;


@end
