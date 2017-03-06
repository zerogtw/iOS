//
//  PlayingCard.h
//  CardGames
//
//  Created by 郭添伟 on 16/3/14.
//  Copyright © 2016年 Zero. All rights reserved.
//

#ifndef PlayingCard_h
#define PlayingCard_h


#endif /* PlayingCard_h */

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSInteger rank;

+(NSArray *) validSuits;
+(NSInteger) maxRank;

@end