//
//  Card.h
//  CardGames
//
//  Created by 郭添伟 on 16/3/14.
//  Copyright © 2016年 Zero. All rights reserved.
//

#ifndef Card_h
#define Card_h


#endif /* Card_h */

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

//Return the match score
- (int)match:(NSArray *)otherCard;

@end
