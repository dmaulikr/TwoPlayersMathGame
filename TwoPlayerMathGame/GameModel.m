//
//  GameModel.m
//  TwoPlayerMathGame
//
//  Created by Noor Alhoussari on 2017-06-05.
//  Copyright © 2017 Noor Alhoussari. All rights reserved.
//

#import "GameModel.h"
#import "Player.h"


@implementation GameModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        Player *player1 = [[Player alloc]initWithName:@"Player1"];
        Player *player2 = [[Player alloc]initWithName:@"Player2"];
        _players = [[NSArray alloc]initWithObjects:player1, player2, nil];
        _gameOver = NO;
        _input = [[NSMutableString alloc]init];
    }
    return self;
}
-(Player *) currentPlayer{
    
    Player *currentPlayer = [[Player alloc]init];
    
    if (_currentIndex < [_players count]){
        currentPlayer = [_players objectAtIndex:_currentIndex];
    } else {
        int currentPlayerIndex = _currentIndex % [_players count];
        currentPlayer = [_players objectAtIndex:currentPlayerIndex];
    }
    return currentPlayer;
}

-(NSString *) generateAQuestion{
    _rightValue = arc4random_uniform(20) + 1;
    _leftValue = arc4random_uniform(20) + 1;
    _answer = _rightValue + _leftValue;
    NSString *value = [NSString stringWithFormat:@"%d + %d", _leftValue, _rightValue];
   
    NSString *question = [[NSString alloc] initWithFormat:@" What is the result of: %@", value];
    return question;
}

- (NSMutableString *) addingInputString: (NSString *) entry{
    [_input appendString:entry];
    return _input;
}


-(NSString *) firstPlayerScore{
    Player *tempPlayer = [_players objectAtIndex:0];
    
    //converting form int to string with adding strings in between
    NSString *firstPlayerScore = [NSString stringWithFormat: @"%@ score: %d, lives: %d",tempPlayer.name, tempPlayer.score, tempPlayer.lives];
    
    return firstPlayerScore;
}

-(NSString *) secondPlayerScore{
    Player *tempPlayer = [_players objectAtIndex:1];
    
    //converting form int to string with adding strings in between
    NSString *firstPlayerScore = [NSString stringWithFormat: @"%@ score: %d, lives: %d",tempPlayer.name, tempPlayer.score, tempPlayer.lives];
    
    return firstPlayerScore;
}

@end
