//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Jackal Wang on 2015/6/10.
//  Copyright (c) 2015年 Jackal Wang. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.settingsPerecnt.selectedSegmentIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"default_tip_amount"];
//    [self changeDefaultTip];
    
    // Do any additional setup after loading the view from its nib.
}

- (void) changeDefaultTip
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setInteger:self.settingsPerecnt.selectedSegmentIndex forKey:@"default_tip_amount"];
    
    [defaults synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changPercent:(id)sender {
    [self changeDefaultTip];
}
@end
