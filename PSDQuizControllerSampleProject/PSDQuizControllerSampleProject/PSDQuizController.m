//  PSDQuizController.m
//  PSDQuizController (Released under MIT License)
//
//
// Created by Petros Demetrakopoulos
// Copyright (c) 2012 Petros Demetrakopoulos
//
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.



#import "PSDQuizController.h"
#import <CoreGraphics/CoreGraphics.h>
@implementation PSDQuizController
@synthesize StartBtn;
-(id)initWithQuestionsOfQuiz:(int)QuestionsOfQuiz AndTotalQuestions:(int)andTotalQuestions{
    if (self == [super init]) {
        self.TotalQuestions = andTotalQuestions;
        interTotalQuestions = andTotalQuestions;
        self.QuestionsOfTheQuiz = QuestionsOfQuiz;
           }
    return self;
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
-(void)loadView{
    self.Question = [[UITextView alloc]init];
    ButtonA = [[UIButton alloc]init];
    ButtonB = [[UIButton alloc]init];
    ButtonC = [[UIButton alloc]init];
    ButtonD = [[UIButton alloc]init];
    self.view = [[UIView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.view.backgroundColor =[UIColor whiteColor];
    if (self.StartBtn == nil) {
        self.StartBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.StartBtn setTitle:@"Start the quiz" forState:UIControlStateNormal];
        [self.StartBtn addTarget:self action:@selector(StartTheQuiz) forControlEvents:UIControlEventTouchUpInside];
        self.StartBtn.frame = CGRectMake(98, 207, 124, 37);
    } else{
        self.StartBtn = self.StartBtn;
    }
    [self.StartBtn addTarget:self action:@selector(StartTheQuiz) forControlEvents:UIControlEventTouchUpInside];
    self.StartBtn.frame = CGRectMake(98, 207, 124, 37);
    self.StartBtn.hidden = NO;
    if (CGRectIsNull(self.questionFrame)) {
        [self.Question setFrame:CGRectMake(20, 42, 280, 198)];
    } else{
        [self.Question setFrame:self.questionFrame];
    }
   A = [[UILabel alloc]initWithFrame:CGRectMake(6, 284, 26, 21)];
    A.text = @"A:";
    B = [[UILabel alloc]initWithFrame:CGRectMake(6, 332, 26, 21)];
    B.text = @"B:";
    C = [[UILabel alloc]initWithFrame:CGRectMake(6, 376, 26, 21)];
    C.text = @"C:";
    D = [[UILabel alloc]initWithFrame:CGRectMake(6, 419, 26, 21)];
    D.text = @"D:";
    ButtonA = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [ButtonA addTarget:self action:@selector(APressed) forControlEvents:UIControlEventTouchUpInside];
    ButtonA.frame = CGRectMake(30, 278, 283, 34);
    ButtonB = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [ButtonB addTarget:self action:@selector(BPressed) forControlEvents:UIControlEventTouchUpInside];
    ButtonB.frame = CGRectMake(30, 326, 283, 34);
    ButtonC = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [ButtonC addTarget:self action:@selector(CPressed) forControlEvents:UIControlEventTouchUpInside];
    ButtonC.frame = CGRectMake(30, 370, 283, 34);
    ButtonD = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [ButtonD addTarget:self action:@selector(DPressed) forControlEvents:UIControlEventTouchUpInside];
    ButtonD.frame = CGRectMake(30, 413, 283, 34);
    Percentage = [[UILabel alloc]initWithFrame:CGRectMake(4, 105, 312, 42)];
    Percentage.textAlignment = NSTextAlignmentCenter;
    if (self.BackBtn == nil) {
        self.BackBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.BackBtn addTarget:self action:@selector(BackPressed) forControlEvents:UIControlEventTouchUpInside];
    self.BackBtn.frame = CGRectMake(68, 340, 185, 37);
    [self.BackBtn setTitle:@"Back to start view" forState:UIControlStateNormal];
    } else{
        self.BackBtn = self.BackBtn;
    }
        self.Question.textAlignment = NSTextAlignmentCenter;
    if (self.questionFont == nil) {
        self.Question.font = [UIFont systemFontOfSize:18];
    } else{
        self.Question.font = self.questionFont;
    }
    if (self.questionTextColor == nil) {
        self.Question.textColor = [UIColor blackColor];
    } else{
        self.Question.textColor = self.questionTextColor;
    }
    if (self.AlabelBackgroundColor == nil) {
        A.backgroundColor = [UIColor whiteColor];
    } else{
        A.backgroundColor = self.AlabelBackgroundColor;
    }
    if (self.BlabelBackgroundColor == nil){
        B.backgroundColor = [UIColor whiteColor];
    } else{
         B.backgroundColor = self.BlabelBackgroundColor;
    }
    if (self.ClabelBackgroundColor == nil) {
        C.backgroundColor = [UIColor whiteColor];
    } else{
        C.backgroundColor = self.ClabelBackgroundColor;
    }
    if (self.DlabelBackgroundColor == nil){
         D.backgroundColor = [UIColor whiteColor];
    } else{
              D.backgroundColor = self.DlabelBackgroundColor; 
    }
    self.Question.scrollEnabled = NO;
    self.Question.editable = NO;
    self.Question.textAlignment = NSTextAlignmentJustified;
    QuestNum = [[UILabel alloc]initWithFrame:CGRectMake(6, 9, 310, 21)];
    QuestNum.textAlignment = NSTextAlignmentCenter;
    if (self.progressLabelTextColor == nil) {
        QuestNum.textColor = [UIColor blackColor];
    } else{
        QuestNum.textColor = self.progressLabelTextColor;
    }
    if (self.progressLabelBackgroundColor == nil) {
        QuestNum.backgroundColor = [UIColor whiteColor];
    } else{
        QuestNum.backgroundColor = self.progressLabelBackgroundColor;
    }
    if (self.resultsLabelBackgroundColor == nil) {
        Percentage.backgroundColor = [UIColor whiteColor];
    } else{
        Percentage.backgroundColor = self.resultsLabelBackgroundColor;
    }
    if (self.resultsLabelTextColor == nil) {
        Percentage.textColor = [UIColor whiteColor];
    } else{
        Percentage.textColor = self.resultsLabelTextColor;
    }
    [self.view addSubview:A];
    [self.view addSubview:B];
    [self.view addSubview:C];
    [self.view addSubview:D];
    [self.view addSubview:self.BackBtn];
    [self.view addSubview:self.StartBtn];
    [self.view addSubview:ButtonA];
    [self.view addSubview:ButtonB];
    [self.view addSubview:ButtonC];
    [self.view addSubview:ButtonD];
    [self.view addSubview:Percentage];
    [self.view addSubview:QuestNum];
    [self.view addSubview:self.Question];
}
#pragma mark - View lifecycle
-(void)viewWillAppear:(BOOL)animated{
    
}
-(void)StartTheQuiz{
    self.StartBtn.hidden = YES;
    A.hidden = NO;
    B.hidden = NO;
    C.hidden = NO;
    D.hidden = NO;
    ButtonA.hidden = NO;
    ButtonB.hidden = NO;
    ButtonC.hidden = NO;
    ButtonD.hidden = NO;
    QuestNum.hidden = NO;
    questCounter += 1;
    int rndmQuest = arc4random() % interTotalQuestions;
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Questions" ofType:@"plist"];
    quest = [[NSMutableArray alloc]initWithContentsOfFile:path];
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc]initWithKey:@"Rank" ascending:YES];
     [quest sortedArrayUsingDescriptors:[NSArray arrayWithObject:descriptor]];
    crnQuest = [quest objectAtIndex:rndmQuest];
    self.Question.text = [crnQuest objectForKey:@"Question"];
    [ButtonA setTitle:[crnQuest objectForKey:@"Answer A"] forState:UIControlStateNormal];
    [ButtonB setTitle:[crnQuest objectForKey:@"Answer B"] forState:UIControlStateNormal];
    [ButtonC setTitle:[crnQuest objectForKey:@"Answer C"] forState:UIControlStateNormal];
    [ButtonD setTitle:[crnQuest objectForKey:@"Answer D"] forState:UIControlStateNormal];
    self.Question.hidden = NO;
   interTotalQuestions -= 1;
    [quest removeObjectAtIndex:rndmQuest];
    QuestNum.text = [NSString stringWithFormat:@"Question %i/%i",questCounter,self.QuestionsOfTheQuiz];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    A.hidden = YES;
    B.hidden = YES;
    C.hidden = YES;
    D.hidden = YES;
    ButtonA.hidden = YES;
    ButtonB.hidden = YES;
    ButtonC.hidden = YES;
    ButtonD.hidden = YES;
    Percentage.hidden = YES;
    self.BackBtn.hidden = YES;
    questCounter = 0;
    rightCounter = 0;
    self.Question.hidden = YES;
    QuestNum.hidden = YES;
}
-(void)APressed{
    questCounter +=1;
    if (questCounter > self.QuestionsOfTheQuiz){
        A.hidden = YES;
        B.hidden = YES;
        C.hidden = YES;
        D.hidden = YES;
        self.Question.hidden = YES;
        ButtonA.hidden = YES;
        ButtonB.hidden = YES;
        ButtonC.hidden = YES;
        ButtonD.hidden = YES;
        QuestNum.hidden = YES;
        Percentage.hidden = NO;
        self.BackBtn.hidden = NO;
        if ([[crnQuest objectForKey:@"RightAnswer"] isEqualToString:@"A"]) {
            rightCounter += 1;
        } else{
            rightCounter += 0;
        }
        self.score = ((float)rightCounter/(float)self.QuestionsOfTheQuiz) * 100;
        Percentage.text = [NSString stringWithFormat:@"Your score is %.2f%%",self.score];
    }else{
    if ([[crnQuest objectForKey:@"RightAnswer"] isEqualToString:@"A"]) {
        rightCounter += 1;
    } else{
        rightCounter += 0;
    }
    [self getQuestion];
    }
}
-(void)BPressed{
    questCounter +=1;
    if (questCounter > self.QuestionsOfTheQuiz){
        A.hidden = YES;
        B.hidden = YES;
        C.hidden = YES;
        D.hidden = YES;
        self.Question.hidden = YES;
        ButtonA.hidden = YES;
        ButtonB.hidden = YES;
        ButtonC.hidden = YES;
        ButtonD.hidden = YES;
        QuestNum.hidden = YES;
        Percentage.hidden = NO;
        self.BackBtn.hidden = NO;
        if ([[crnQuest objectForKey:@"RightAnswer"] isEqualToString:@"B"]) {
            rightCounter += 1;
        } else{
            rightCounter += 0;
        }
        self.score = ((float)rightCounter/(float)self.QuestionsOfTheQuiz) * 100;
        Percentage.text = [NSString stringWithFormat:@"Your score is %.2f%%",self.score];
    }else{
    if ([[crnQuest objectForKey:@"RightAnswer"] isEqualToString:@"B"]) {
        rightCounter += 1;
    } else{
        rightCounter += 0;
    }
    [self getQuestion];
    }
}
-(void)CPressed{
    questCounter +=1;
    if (questCounter > self.QuestionsOfTheQuiz){
        A.hidden = YES;
        B.hidden = YES;
        C.hidden = YES;
        D.hidden = YES;
        self.Question.hidden = YES;
        ButtonA.hidden = YES;
        ButtonB.hidden = YES;
        ButtonC.hidden = YES;
        ButtonD.hidden = YES;
        QuestNum.hidden = YES;
        Percentage.hidden = NO;
        self.BackBtn.hidden = NO;
        if ([[crnQuest objectForKey:@"RightAnswer"] isEqualToString:@"C"]) {
            rightCounter += 1;
        } else{
            rightCounter += 0;
        }
        self.score = ((float)rightCounter/(float)self.QuestionsOfTheQuiz) * 100;
        Percentage.text = [NSString stringWithFormat:@"Your score is %.2f%%",self.score];
    }else{
        if ([[crnQuest objectForKey:@"RightAnswer"] isEqualToString:@"C"]) {
            rightCounter += 1;
        } else{
            rightCounter += 0;
        }
        [self getQuestion];
    }
}
-(void)getQuestion{
    int rndmQuest = arc4random() % interTotalQuestions;
 crnQuest = [quest objectAtIndex:rndmQuest];
    self.Question.text = [crnQuest objectForKey:@"Question"];
    [ButtonA setTitle:[crnQuest objectForKey:@"Answer A"] forState:UIControlStateNormal];
    [ButtonB setTitle:[crnQuest objectForKey:@"Answer B"] forState:UIControlStateNormal];
    [ButtonC setTitle:[crnQuest objectForKey:@"Answer C"] forState:UIControlStateNormal];
    [ButtonD setTitle:[crnQuest objectForKey:@"Answer D"] forState:UIControlStateNormal];
    interTotalQuestions -= 1;
    [quest removeObjectAtIndex:rndmQuest];
    QuestNum.text = [NSString stringWithFormat:@"Question %i/%i",questCounter,self.QuestionsOfTheQuiz];
}
-(void)DPressed{
    questCounter +=1;
    if (questCounter > self.QuestionsOfTheQuiz){
        A.hidden = YES;
        B.hidden = YES;
        C.hidden = YES;
        D.hidden = YES;
        self.Question.hidden = YES;
        ButtonA.hidden = YES;
        ButtonB.hidden = YES;
        ButtonC.hidden = YES;
        ButtonD.hidden = YES;
        QuestNum.hidden = YES;
        Percentage.hidden = NO;
        self.BackBtn.hidden = NO;
        if ([[crnQuest objectForKey:@"RightAnswer"] isEqualToString:@"D"]) {
            rightCounter += 1;
        } else{
            rightCounter += 0;
        }
        self.score = ((float)rightCounter/(float)self.QuestionsOfTheQuiz) * 100;
        Percentage.text = [NSString stringWithFormat:@"Your score is %.2f%%",self.score];
    }else{
        if ([[crnQuest objectForKey:@"RightAnswer"] isEqualToString:@"D"]) {
            rightCounter += 1;
        } else{
            rightCounter += 0;
        }
        [self getQuestion];
    }
}
- (void)viewDidUnload
{
    [super viewDidUnload];                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
}
-(void)BackPressed{
    A.hidden = YES;
    B.hidden = YES;
    C.hidden = YES;
    D.hidden = YES;
    ButtonA.hidden = YES;
    ButtonB.hidden = YES;
    ButtonC.hidden = YES;
    ButtonD.hidden = YES;
    Percentage.hidden = YES;
    self.BackBtn.hidden = YES;
    questCounter = 0;
    rightCounter = 0;
    self.Question.hidden = YES;
    self.StartBtn.hidden = NO;
    interTotalQuestions = self.TotalQuestions;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
