//
//  ViewController.m
//  TipCalculator
//
//  Created by Jackal Wang on 2015/6/9.
//  Copyright (c) 2015年 Jackal Wang. All rights reserved.
//

#import "ViewController.h"
#import "SettingsViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Tip Calculator";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    
    [self checkBillAmount];
    [self setBackground];
}

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.percent.selectedSegmentIndex = [defaults integerForKey:@"default_tip_amount"];
    
    [self checkBillAmount];
    [self setBackground];
}

- (void)setBackground{
//    NSLog(@"setBackground...........");
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSString *red = [NSString stringWithFormat:@"%.1f",[defaults floatForKey:@"rad"]];
//    NSString *green = [NSString stringWithFormat:@"%.1f",[defaults floatForKey:@"green"]];
//    NSString *blue = [NSString stringWithFormat:@"%.1f",[defaults floatForKey:@"blue"]];
//    NSString *opaque = [NSString stringWithFormat:@"%.1f",[defaults floatForKey:@"opaque"]];
//    NSString *ciColorStr = [NSString stringWithFormat:@"%@ %@ %@ %@", red, green, blue, opaque];
//    NSLog(@"red = %.1f...........",[defaults floatForKey:@"rad"]);
//    NSLog(@"red = %@...........",red);
    NSString *ciColorStr = @"0.5 0.7 0.3 1.0";
    UIColor *color = [UIColor colorWithCIColor:[CIColor colorWithString:ciColorStr]];
    self.view.backgroundColor = color;
}

- (void)checkBillAmount{
    float amount = [self getBillAmount];
    if(amount>0){
        [self.percent setHidden:FALSE];
        [self.tipAmount setHidden:FALSE];
        [self.totalAmount setHidden:FALSE];
        [self.tipTitle setHidden:FALSE];
        [self.totalTitle setHidden:FALSE];
        [self updateDisplayedTip];
        [self updateDisplayedTotal];
    }else{
        [self displayTheKeyboard];
        [self.percent setHidden:TRUE];
        [self.tipAmount setHidden:TRUE];
        [self.totalAmount setHidden:TRUE];
        [self.tipTitle setHidden:TRUE];
        [self.totalTitle setHidden:TRUE];

    }
}


- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)billAmountChanged:(UITextField *)sender {
    [self checkBillAmount];
}

- (IBAction)tipPercentChanged:(UISegmentedControl *)sender{
    [self updateDisplayedTip];
    [self updateDisplayedTotal];
    [self dismissTheKeyboard];
}

-(void)displayTheKeyboard{
    [self.billAmount becomeFirstResponder];
}

-(void)dismissTheKeyboard{
    [self.billAmount resignFirstResponder];
}

- (NSString *)formatCurrency:(float)amount{
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    nf.numberStyle = NSNumberFormatterCurrencyStyle;
    NSNumber *number = [NSNumber numberWithFloat:amount];
    return [nf stringFromNumber:number];
}

- (void)displayTotalAmount:(float)amount{
    
    self.totalAmount.text = [self formatCurrency:amount];
}

- (void)displayTipAmount:(float)amount{
     self.billAmount.text = [self formatCurrency:amount];
}

- (float)calculateTipPercentageForSegment:(int)segment{
    NSString *tipText = [self.percent titleForSegmentAtIndex:segment];
    return [tipText floatValue] / 100.00;
}

- (float)getBillAmount{
    return [self.billAmount.text floatValue];
}

- (float)calculateTipAmount:(float)amount percent:(float)percent{
    return amount * percent;
}

- (void)updateDisplayedTip{
    float amount = [self getBillAmount];
    int segment = (int)self.percent.selectedSegmentIndex;
    float percent = [self calculateTipPercentageForSegment:segment];
    float tip = [self calculateTipAmount:amount percent:percent];
    self.tipAmount.text = [self formatCurrency:tip];
    
}

- (void)updateDisplayedTotal{
    float amount = [self getBillAmount];
    int segment = (int)self.percent.selectedSegmentIndex;
    float percent = [self calculateTipPercentageForSegment:segment];
    float tip = [self calculateTipAmount:amount percent:percent];
    self.totalAmount.text = [self formatCurrency:tip+amount];
    
}



@end
