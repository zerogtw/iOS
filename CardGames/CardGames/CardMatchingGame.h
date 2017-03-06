//
//  CardMatchingGame.h
//  CardGames
//
//  Created by 郭添伟 on 16/3/21.
//  Copyright © 2016年 Zero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

//designated initializer
- (instancetype)initWithCardCount:(NSUInteger) count
                        usingDeck: (Deck *)deck;


- (void)chooseCardAtIndex: (NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic) NSUInteger gameMode;

- (void)switchGameMode;

- (void)resetGame;

@end
