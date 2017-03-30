//
//  CardMatchingGame.m
//  MatchingCardGame
//
//  Created by Mocca Yang on 2017/3/30.
//  Copyright © 2017年 Mocca Yang. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite)NSUInteger score;
@property (nonatomic,strong)NSMutableArray *cards;
@end

@implementation CardMatchingGame

-(NSMutableArray *)cards{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    
    if(self){
        for(int i = 0; i < count; i++){
            Card *card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            }else{
                // if we cannot initialize properly given the arguments passed,return nil
                self = nil;
                break;
            }
        }
    }
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index{
    //check if index is valid.
    return (index <= [self.cards count])? self.cards[index] : nil;
}

static const int MISMATCH_PANALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

-(void)chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    
    //only allow unmatched cards to be chosen
    if(!card.isMatched){
        if(card.isChosen){
            //if card is chosen,then unchoose it.
            card.chosen = NO;
        }else{
            //match against other chosen card.
            
            for(Card *otherCard in self.cards){
                if(otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore){
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    }else{
                        self.score -= MISMATCH_PANALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

@end
