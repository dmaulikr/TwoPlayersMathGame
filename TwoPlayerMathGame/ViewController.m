//
//  ViewController.m
//  TwoPlayerMathGame
//
//  Created by Noor Alhoussari on 2017-06-05.
//  Copyright © 2017 Noor Alhoussari. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *player1ScoreTextLabel;

@property (weak, nonatomic) IBOutlet UILabel *player2ScoreTextLabel;

@property (weak, nonatomic) IBOutlet UILabel *questionTextLabel;

@property (strong, nonatomic) GameModel *gameModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _gameModel = [[GameModel alloc] init];
    
    self.player1ScoreTextLabel.text =_gameModel.firstPlayerScore;
    
    self.player2ScoreTextLabel.text =_gameModel.secondPlayerScore;

    for (Player *tempPlayer in _gameModel.players){
        if (tempPlayer.lives == 0){
            NSString *gameOver = @"Game Over!";
            _gameModel.gameOver = YES;
            self.questionTextLabel.text = gameOver;
        }
    }
    if (_gameModel.gameOver == NO) {
        NSString * question = self.gameModel.generateAQuestion;
        NSString *playerQuestion = [_gameModel.currentPlayer.name stringByAppendingString:question];
        self.questionTextLabel.text = playerQuestion;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)insertOne:(id)sender {
    [_gameModel addingInputString:@"1"];
}

- (IBAction)insertTwo:(id)sender {
    [_gameModel addingInputString:@"2"];
}

- (IBAction)insertThree:(id)sender {
    [_gameModel addingInputString:@"3"];
}

- (IBAction)insertFour:(id)sender {
    [_gameModel addingInputString:@"4"];
}

- (IBAction)insertFive:(id)sender {
    [_gameModel addingInputString:@"5"];
}

- (IBAction)insertSix:(id)sender {
    [_gameModel addingInputString:@"6"];
}

- (IBAction)insertSeven:(id)sender {
    [_gameModel addingInputString:@"7"];
}

- (IBAction)insertEight:(id)sender {
    [_gameModel addingInputString:@"8"];
}

- (IBAction)insertNine:(id)sender {
    [_gameModel addingInputString:@"9"];
}

- (IBAction)insertZero:(id)sender {
    [_gameModel addingInputString:@"0"];
}

- (IBAction)enterButton:(id)sender {
    int inputAnswer = [self.gameModel.input intValue];
    if (_gameModel.answer == inputAnswer){
        _gameModel.currentPlayer.score++;
        NSString *correct = @"Correct!";

        //Seeting Question Label
        self.questionTextLabel.text = correct;
    } else {
        _gameModel.currentPlayer.lives--;
        NSString *wrong = @"Wrong!";
        self.questionTextLabel.text = wrong;
    }
    
    self.player1ScoreTextLabel.text =_gameModel.firstPlayerScore;
    
    self.player2ScoreTextLabel.text =_gameModel.secondPlayerScore;
}

- (IBAction)nextQuestion:(id)sender {
    _gameModel.currentIndex++;
    _gameModel.input = [NSMutableString stringWithString:@"0"];
    for (Player *tempPlayer in _gameModel.players){
        if (tempPlayer.lives == 0){
            NSString *gameOver = @"Game Over!";
            _gameModel.gameOver = YES;
            self.questionTextLabel.text = gameOver;
        }
    }
    if (_gameModel.gameOver == NO) {
        NSString *question = self.gameModel.generateAQuestion;
        NSString *playerQuestion = [_gameModel.currentPlayer.name stringByAppendingString:question];
        self.questionTextLabel.text = playerQuestion;
    }
    
}








@end
