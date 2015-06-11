//
//  SettingsViewController.h
//  TipCalculator
//
//  Created by Jackal Wang on 2015/6/10.
//  Copyright (c) 2015年 Jackal Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *settingsPerecnt;
- (IBAction)changPercent:(id)sender;

@end
