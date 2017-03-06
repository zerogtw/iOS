//
//  CardMatchingGame.m
//  CardGames
//
//  Created by 郭添伟 on 16/3/21.
//  Copyright © 2016年 Zero. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of card
@property (nonatomic, strong) NSMutableArray *chosenCards;
@end

@implementation CardMatchingGame

static const int TWO_CARD_GAME_MODE = 2;
static const int THREE_CARD_GAME_MODE = 3;

- (void) resetGame
{
    [self setScore:0];
    [self setGameMode:TWO_CARD_GAME_MODE];
    for (Card *card in self.cards) {
        card.chosen = NO;
        card.matched = NO;
    }
    [self.chosenCards removeAllObjects];
}

-(void) switchGameMode
{
    if (self.gameMode == TWO_CARD_GAME_MODE) {
        [self setGameMode:THREE_CARD_GAME_MODE];
    }else
        [self setGameMode:TWO_CARD_GAME_MODE];
}

- (NSMutableArray *)cards
{
    if (!_cards)  _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger) count
                        usingDeck: (Deck *)deck
{
    self = [super init];// super's designated initializer

    if (self) {
        [self setGameMode:TWO_CARD_GAME_MODE];
        for (int i = 0; i <count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
    }


    return self;
}

- (NSMutableArray *)chosenCards
{
    if (!_chosenCards) _chosenCards = [[NSMutableArray alloc] init];
    return _chosenCards;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count])? self.cards[index] : nil;

}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;


- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    
    if (self.gameMode == TWO_CARD_GAME_MODE){
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        }
        else{
            //match against other chosen cards
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                        }else {
                            self.score -= MISMATCH_PENALTY;
                            otherCard.chosen = NO;
                        }
                        break; // can only choose 2 card for now
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
    }else{// three-card-match mode
        if (!card.isMatched) {
            if (card.isChosen) {
                card.chosen = NO;
                [self.chosenCards removeObject:card];
            }
            else{
                if ([self.chosenCards count] <2) {
                    [self.chosenCards addObject:card];
//                    NSLog(@"%lu",(unsigned long)[self.chosenCards count]);
                }else{
                    int matchScore = [card match:self.chosenCards];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        for (NSUInteger i = self.chosenCards.count; i > 0; i--) {
                            Card *otherCard = [self.chosenCards objectAtIndex:(i-1)];
                            otherCard.matched = YES;
                            [self.chosenCards removeObject:otherCard];
                        }
                        card.matched = YES;
                    }else{
                        self.score -= MISMATCH_PENALTY;
                        for (NSUInteger i = self.chosenCards.count; i > 0; i--) {
                            Card *otherCard = [self.chosenCards objectAtIndex:(i-1)];
                            otherCard.chosen = NO;
                            [self.chosenCards removeObject:otherCard];
                        }
                        [self.chosenCards addObject:card];
                    }
                }
                self.score -= COST_TO_CHOOSE;
                card.chosen = YES;
            }

        }
    }
    
}
            
                    
                    
                    
//                    [self.chosenCards addObject:otherCard];
//            }
//            if ([self.chosenCards count] == (self.gameMode - 1)) {
//                int matchScore = [card match:self.chosenCards];
//                NSLog(@"match score %d", matchScore);
//                if (matchScore) {
//                    NSLog(@"score 1 : %ld", self.score);
//                    self.score += matchScore * BONUS;
//                    for (Card *chosenCard in self.chosenCards) {
//                        chosenCard.matched = YES;
//                    }
//                    card.matched = YES;
//                }else{
//                    self.score -= MISMATCH_PENALTY;
//                    for (Card *chosenCard in self.chosenCards) {
//                        chosenCard.matched = NO;
//                    }
//                
//                }
//            }
            
                    

                
                


@end
