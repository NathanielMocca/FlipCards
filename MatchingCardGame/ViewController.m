//
//  ViewController.m
//  MatchingCardGame
//
//  Created by Mocca Yang on 2017/3/26.
//  Copyright © 2017年 Mocca Yang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)touchCard:(UIButton *)sender {
    if([sender.currentTitle length]){
        UIImage *cardImage = [UIImage imageNamed:@"cardback"];
        [sender setBackgroundImage:cardImage forState: UIControlStateNormal];
        [sender setTitle:@"" forState: UIControlStateNormal];
    }else{
        UIImage *cardImage = [UIImage imageNamed:@"cardfront"];
        [sender setBackgroundImage:cardImage forState: UIControlStateNormal];
        [sender setTitle:@"3♠️" forState: UIControlStateNormal];
    }
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
