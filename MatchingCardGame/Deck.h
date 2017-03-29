//
//  Deck.h
//  MatchingCardGame
//
//  Created by Mocca Yang on 2017/3/29.
//  Copyright © 2017年 Mocca Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void) addCard:(Card *)card atTop:(BOOL)atTop;
-(void) addCard:(Card *)card;

-(Card *)drawRandomCard;

@end
