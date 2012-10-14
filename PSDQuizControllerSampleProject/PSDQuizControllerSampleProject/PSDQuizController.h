//PSDQuizController.h
//PSDQuizController (Released under MIT License)
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


#import <UIKit/UIKit.h>
@interface PSDQuizController: UIViewController
{
    IBOutlet UILabel *A;
    IBOutlet UILabel *B;
    IBOutlet UILabel *C;
    IBOutlet UILabel *D;
    IBOutlet UILabel *Percentage;
    IBOutlet UILabel *QuestNum;
    int questCounter;
    int rightCounter;
    NSMutableArray *quest;
    int interTotalQuestions;
    NSDictionary *crnQuest;
    UIButton *ButtonA;
    UIButton *ButtonB;
     UIButton *ButtonC;
    UIButton *ButtonD;
}
@property (nonatomic,retain) IBOutlet UIButton* StartBtn;
@property (nonatomic,retain) UITextView *Question;
@property (nonatomic,retain) UIButton *BackBtn;
@property (nonatomic,retain) UIFont *questionFont;
@property (nonatomic,retain) UIColor *questionTextColor;
@property (nonatomic,retain) UIColor *progressLabelTextColor;
@property (nonatomic,retain) UIColor *progressLabelBackgroundColor;
@property (nonatomic,retain) UIColor *AlabelBackgroundColor;
@property (nonatomic,retain) UIColor *BlabelBackgroundColor;
@property (nonatomic,retain) UIColor *ClabelBackgroundColor;
@property (nonatomic,retain) UIColor *DlabelBackgroundColor;
@property (nonatomic,retain) UIColor *resultsLabelTextColor;
@property (nonatomic,retain) UIColor *resultsLabelBackgroundColor;
@property (nonatomic) float score;
@property (nonatomic) int TotalQuestions;
@property (nonatomic)int QuestionsOfTheQuiz;
@property (nonatomic,assign) CGRect questionFrame;
-(void)StartTheQuiz;
-(void)APressed;
-(void)BPressed;
-(void)CPressed;
-(void)DPressed;
-(void)BackPressed;
-(void)getQuestion;
-(id)initWithQuestionsOfQuiz:(int)QuestionsOfQuiz AndTotalQuestions:(int)andTotalQuestions;
@end
