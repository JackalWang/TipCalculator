//
//  ViewController.h
//  TipCalculator
//
//  Created by Jackal Wang on 2015/6/9.
//  Copyright (c) 2015年 Jackal Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UISegmentedControl *percent;
@property (weak, nonatomic) IBOutlet UILabel *tipAmount;
@property (weak, nonatomic) IBOutlet UILabel *totalAmount;
@property (weak, nonatomic) IBOutlet UILabel *tipTitle;
@property (weak, nonatomic) IBOutlet UILabel *totalTitle;

- (IBAction)billAmountChanged:(UITextField *)sender;

- (IBAction)tipPercentChanged:(UISegmentedControl *)sender;

- (void)displayTotalAmount:(float)amount;

- (void)displayTipAmount:(float)amount;

- (float)calculateTipPercentageForSegment:(int)segment;

- (float)getBillAmount;

- (float)calculateTipAmount:(float)amount percent:(float)percent;

- (void)updateDisplayedTip;

- (void)updateDisplayedTotal;

@end

