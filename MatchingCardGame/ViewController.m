//
//  ViewController.m
//  MatchingCardGame
//
//  Created by Mocca Yang on 2017/3/26.
//  Copyright © 2017年 Mocca Yang. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()

@property (strong,nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic) BOOL isflipAll;
@property (weak, nonatomic) IBOutlet UIButton *flipAllButton;

@end

@implementation ViewController

-(CardMatchingGame *)game{
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                         usingDeck:[self createDeck]];
    return _game;
}

-(Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
    
}

- (IBAction)touchCard:(UIButton *)sender {
    NSUInteger chooseButtonIndex =[self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chooseButtonIndex];
    [self updateUI];
    
}

-(void)updateUI{
    //cycle through all the cardButtons and based on the corresponding card in our Model
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        if([card.contents containsString:@"♥️"] || [card.contents containsString:@"♦️"]){
            [cardButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
}

-(NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";
}

-(UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}
- (IBAction)touchFlipAllButton:(id)sender {
    if(self.isflipAll){
        for (UIButton *cardButton in self.cardButtons){
            [cardButton setTitle:@"" forState:UIControlStateNormal];
            [cardButton setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        }
        self.isflipAll = NO;
    }else{
        for (UIButton *cardButton in self.cardButtons){
            NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
            Card *card = [self.game cardAtIndex:cardButtonIndex];
            if([card.contents containsString:@"♥️"] || [card.contents containsString:@"♦️"]){
                [cardButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            }
            [cardButton setTitle:card.contents forState:UIControlStateNormal];
            [cardButton setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
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
