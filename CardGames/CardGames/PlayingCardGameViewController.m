//
//  PlayingCardGameViewController.m
//  CardGames
//
//  Created by 郭添伟 on 16/7/25.
//  Copyright © 2016年 Zero. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
@interface PlayingCardGameViewController ()

@end


@implementation PlayingCardGameViewController

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

@end
