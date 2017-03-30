//
//  CardMatchingGame.h
//  MatchingCardGame
//
//  Created by Mocca Yang on 2017/3/30.
//  Copyright © 2017年 Mocca Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck;
-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic,readonly)NSUInteger score;

@end
