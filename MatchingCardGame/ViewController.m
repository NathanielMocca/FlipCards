//
//  ViewController.m
//  MatchingCardGame
//
//  Created by Mocca Yang on 2017/3/26.
//  Copyright © 2017年 Mocca Yang. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "UnoCardDeck.h"
#import "CardMatchingGame.h"
#import "UnoCardMatchingGame.h"

@interface ViewController ()

//@property (strong,nonatomic) CardMatchingGame *game;
@property (strong,nonatomic) UnoCardMatchingGame *unoGame;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic) BOOL isflipAll;
@property (weak, nonatomic) IBOutlet UIButton *flipAllButton;
@property (weak, nonatomic) IBOutlet UIButton *ResetButton;

@end

@implementation ViewController

//
//-(CardMatchingGame *)game{
//    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
//                                                         usingDeck:[self createDeck]];
//    return _game;
//}
//
-(UnoCardMatchingGame *)unoGame{
    if(!_unoGame) _unoGame = [[UnoCardMatchingGame alloc] initUnoCardDeck:[self createUnoDeck]];
    return _unoGame;
}

-(Deck *)createUnoDeck{
    return [[UnoCardDeck alloc] init];
}

//-(Deck *)createDeck{
//    return [[PlayingCardDeck alloc] init];
//    
//}

- (IBAction)touchCard:(UIButton *)sender {
    NSUInteger chooseButtonIndex =[self.cardButtons indexOfObject:sender];
    [self updateUI];
    [self.unoGame chooseCardAtIndex:chooseButtonIndex];
    [self updateUI];

}

- (IBAction)touchResetButton:(id)sender {
    self.unoGame = nil;
    [self unoGame];
    [self updateUI];
}

-(void)updateUI{
    //cycle through all the cardButtons and based on the corresponding card in our Model
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.unoGame cardAtIndex:cardButtonIndex];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.unoGame.score];
    }
}
/*
-(NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";
}
*/
-(UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? card.contents : @"unoback"];
}

-(UIImage *)ImageContents:(Card *)card{
    return [UIImage imageNamed:card.contents];
}

-(UIImage *)ImageContentsForFlipbackAll:(Card *)card{
    return [UIImage imageNamed:card.isMatched ? card.contents : @"unoback"];
}

- (IBAction)touchFlipAllButton:(id)sender {
    if(self.isflipAll){
        for (UIButton *cardButton in self.cardButtons){
            NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
            Card *card = [self.unoGame cardAtIndex:cardButtonIndex];
            [cardButton setBackgroundImage:[self ImageContentsForFlipbackAll:card] forState:UIControlStateNormal];
        }
        self.isflipAll = NO;
    }else{
        for (UIButton *cardButton in self.cardButtons){
            NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
            Card *card = [self.unoGame cardAtIndex:cardButtonIndex];
            //[cardButton setTitle:card.contents forState:UIControlStateNormal];
            [cardButton setBackgroundImage:[self ImageContents:card] forState:UIControlStateNormal];
        }
        self.isflipAll = YES;

    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
