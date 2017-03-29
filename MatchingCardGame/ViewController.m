//
//  ViewController.m
//  MatchingCardGame
//
//  Created by Mocca Yang on 2017/3/26.
//  Copyright © 2017年 Mocca Yang. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipCountLabel;
@property (nonatomic) int flipCount;
@property (strong,nonatomic) Deck *deck;

@end

@implementation ViewController

-(Deck *)deck{
    if(!_deck) _deck = [self createDeck];
    return _deck;
}

-(Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
    
}

- (IBAction)touchCard:(UIButton *)sender {
    if([sender.currentTitle length]){
        UIImage *cardImage = [UIImage imageNamed:@"cardback"];
        [sender setBackgroundImage:cardImage forState: UIControlStateNormal];
        [sender setTitle:@"" forState: UIControlStateNormal];
    }else{
        Card *randomCard = [self.deck drawRandomCard];
        //NSLog(@"RandomCard's contents%@",randomCard.contents);
        //if deck is empty ,drawRandomCard will return nil.
        if(randomCard){
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState: UIControlStateNormal];
            [sender setTitle:randomCard.contents forState: UIControlStateNormal];
        }
        self.flipCount++;
    }
    
    self.flipCountLabel.text = [NSString stringWithFormat:@"FlipCount: %d",self.flipCount];
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
