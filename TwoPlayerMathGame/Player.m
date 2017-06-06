//
//  Player.m
//  TwoPlayerMathGame
//
//  Created by Noor Alhoussari on 2017-06-05.
//  Copyright © 2017 Noor Alhoussari. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithName: (NSString *) name
{
    self = [super init];
    if (self) {
        _lives = 3;
        _score = 0;
        _name = name;
    }
    return self;
}

-(void) losingLives{
    self.lives = -1;
}



@end
