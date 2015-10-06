//
//  settingViewController.m
//  reminder
//
//  Created by WangSiyu on 15/10/3.
//  Copyright © 2015年 SeenVoice_Tech. All rights reserved.
//

#import "SettingViewController.h"
#import "ReminderManager.h"
#import "MainViewController.h"

@interface SettingViewController ()

@property (nonatomic, weak) IBOutlet UITextField *numberText;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = COLOR_AB;
    self.numberText.text = [NSString stringWithFormat:@"%lu", (unsigned long)[ReminderManager getItemCountToRemindPerDay]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)save:(id)sender
{
    if (self.numberText.text.length == 0) {
        return;
    }
    [ReminderManager setItemCountToRemindPerDay:[self.numberText.text integerValue]];
    [self.navigationController popViewControllerAnimated:YES];
    
    [(MainViewController *)[self.navigationController.viewControllers objectAtIndex:0] refreshRemindCount:nil];

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (![self.numberText isExclusiveTouch]) {
        [self.numberText resignFirstResponder];
    }
}

@end
