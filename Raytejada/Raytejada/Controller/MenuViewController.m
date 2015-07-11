//
//  MenuViewController.m
//  Raytejada
//
//  Created by ADMIN on 7/10/15.
//  Copyright (c) 2015 raystudios. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonAboutMe;
@property (weak, nonatomic) IBOutlet UIButton *buttonPhotography;
@property (weak, nonatomic) IBOutlet UIButton *buttonUI;
@property (weak, nonatomic) IBOutlet UIButton *buttonAdvertisement;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buttonsSetAlpha:0];
}
-(void)buttonsSetAlpha:(BOOL)alpha
{
    self.buttonAboutMe.alpha = alpha;
    self.buttonPhotography.alpha = alpha;
    self.buttonUI.alpha = alpha;
    self.buttonAdvertisement.alpha = alpha;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    __weak __typeof__(self) weakself = self;
    [UIView animateWithDuration:1.0 animations:^{
        [weakself buttonsSetAlpha:1];
    }];
}
- (IBAction)aboutMeTapped:(id)sender
{
    [self closingAnimation];
}
- (IBAction)photographyTapped:(id)sender
{
    [self closingAnimation];
}
- (IBAction)uiTapped:(id)sender
{
    [self closingAnimation];
}

- (IBAction)advertisementTapped:(id)sender
{
    [self closingAnimation];
}
-(void)closingAnimation
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
