//
//  GameModel.h
//  TwoPlayerMathGame
//
//  Created by Noor Alhoussari on 2017-06-05.
//  Copyright © 2017 Noor Alhoussari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameModel : NSObject

@property NSArray *players;

@property (nonatomic, assign) int rightValue;
@property (nonatomic, assign) int leftValue;
@property (nonatomic, strong) Player *player;
@property (nonatomic, assign) int currentIndex;
@property BOOL gameOver;
@property (nonatomic, assign) int answer;
//@property BOOL answerCorrect;

@property (nonatomic, strong) NSMutableString *input;


-(NSString *) generateAQuestion;

- (NSMutableString *) addingInputString: (NSString *) entry;

-(Player *) currentPlayer;

-(NSString *) firstPlayerScore;

-(NSString *) secondPlayerScore;

@end
