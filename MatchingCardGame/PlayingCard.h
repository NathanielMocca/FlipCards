//
//  PlayingCard.h
//  MatchingCardGame
//
//  Created by Mocca Yang on 2017/3/29.
//  Copyright © 2017年 Mocca Yang. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property(strong,nonatomic) NSString *suit;
@property(nonatomic) NSUInteger rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;

@end
