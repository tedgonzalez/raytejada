//
//  HeaderReusableView.m
//  Raytejada
//
//  Created by Theodore Gonzalez on 7/24/15.
//  Copyright (c) 2015 raystudios. All rights reserved.
//

#import "HeaderReusableView.h"
@interface HeaderReusableView()
@property (nonatomic, weak) IBOutlet UIImageView *imageViewBackground;
@property (nonatomic, weak) IBOutlet UIImageView *imageViewForeground;

@property (weak, nonatomic) IBOutlet UIButton *buttonCall;
@property (weak, nonatomic) IBOutlet UIButton *buttonMail;
@end
@implementation HeaderReusableView
-(void)awakeFromNib
{
    [self.buttonCall.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.buttonMail.imageView setContentMode:UIViewContentModeScaleAspectFit];
//    self.imageViewBackground.layer.borderColor = [UIColor redColor].CGColor;
//    self.imageViewBackground.layer.borderWidth = 1.0;
}
@end
