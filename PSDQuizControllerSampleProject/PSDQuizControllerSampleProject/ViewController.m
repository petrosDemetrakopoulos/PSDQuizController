//
//  ViewController.m
//  PSDQuizSampleProject
//
//  Created by Petros Demetrakopoulos on 9/28/12.
//  Copyright (c) 2012 Petros Demetrakopoulos. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)GoToPSDQuiz{
    PSDQuizController *myPSDQuizController = [[PSDQuizController alloc]initWithQuestionsOfQuiz:10 AndTotalQuestions:11];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Start the quiz" forState:UIControlStateNormal];
    myPSDQuizController.questionFrame = CGRectMake(20, 42, 280, 198);
    myPSDQuizController.AlabelBackgroundColor = [UIColor colorWithRed:51/255.0 green:204/255.0 blue:1.0 alpha:1.0];
    myPSDQuizController.BlabelBackgroundColor = [UIColor colorWithRed:51/255.0 green:204/255.0 blue:1.0 alpha:1.0];
    myPSDQuizController.ClabelBackgroundColor = [UIColor colorWithRed:51/255.0 green:204/255.0 blue:1.0 alpha:1.0];
    myPSDQuizController.DlabelBackgroundColor = [UIColor colorWithRed:51/255.0 green:204/255.0 blue:1.0 alpha:1.0];
    myPSDQuizController.progressLabelBackgroundColor = [UIColor  colorWithRed:51/255.0 green:204/255.0 blue:1.0 alpha:1.0];
    myPSDQuizController.progressLabelTextColor = [UIColor blackColor];
    myPSDQuizController.resultsLabelTextColor = [UIColor blackColor];
    myPSDQuizController.resultsLabelBackgroundColor = [UIColor colorWithRed:51/255.0 green:204/255.0 blue:1.0 alpha:1.0];
    myPSDQuizController.view.backgroundColor = [UIColor colorWithRed:51/255.0 green:204/255.0 blue:1.0 alpha:1.0];
    myPSDQuizController.Question.backgroundColor = [UIColor colorWithRed:51/255.0 green:204/255.0 blue:1.0 alpha:1.0];
    [self presentViewController:myPSDQuizController animated:YES completion:nil];
}
@end
