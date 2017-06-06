//
//  Player.h
//  TwoPlayerMathGame
//
//  Created by Noor Alhoussari on 2017-06-05.
//  Copyright © 2017 Noor Alhoussari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property NSString *name;
@property int lives;
@property int score;

- (instancetype)initWithName: (NSString *) name;
-(void) losingLives;

@end
