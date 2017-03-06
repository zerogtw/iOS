//
//  PlayingCard.m
//  CardGames
//
//  Created by 郭添伟 on 16/3/14.
//  Copyright © 2016年 Zero. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank) {
            score = 4;
        } else if ([otherCard.suit isEqualToString:self.suit]) {
            score = 1;
        }
        
    }else {
        //算法有误
        for (PlayingCard *otherCard in otherCards)
            score += [self match:@[otherCard]];
        unsigned long allRankSame = 4 * [otherCards count];
        unsigned long allSuitSame = 1 * [otherCards count];
        if (score == allRankSame)
            score = 88;
        else if (score == allSuitSame)
            score = 4;
        else if (score > 0)
            score = 1;
        else
            score = 0;
//        NSRange theRange;
//        theRange.location = 1;
//        theRange.length = [otherCards count];
//        score += [[otherCards firstObject] match:[otherCards subarrayWithRange:theRange]];
        
    }
    
    
    return score;
}

- (NSString *) contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
    
}

@synthesize suit = _suit; //because we provide setter AND getter

+ (NSArray *) validSuits
{
    return @[@"♠︎", @"♣︎", @"♥︎", @"♦︎"];
}

- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits]containsObject:suit]) {
        _suit = suit;
    }
}


- (NSString *) suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *) rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSInteger) maxRank { return [[PlayingCard rankStrings] count] - 1;}

- (void) setRank: (NSInteger) rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end


