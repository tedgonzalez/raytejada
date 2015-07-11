//
//  DismissingAnimationController.m
//  Raytejada
//
//  Created by ADMIN on 7/10/15.
//  Copyright (c) 2015 raystudios. All rights reserved.
//

#import "DismissingAnimationController.h"

@implementation DismissingAnimationController
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    toView.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
    toView.userInteractionEnabled = YES;
    
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    
    
//    POPBasicAnimation *closeAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
//    closeAnimation.toValue = @(-fromView.layer.position.y);
//    [closeAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
//        [transitionContext completeTransition:YES];
//    }];
//    
//    POPSpringAnimation *scaleDownAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
//    scaleDownAnimation.springBounciness = 20;
//    scaleDownAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
//    
//    [fromView.layer pop_addAnimation:closeAnimation forKey:@"closeAnimation"];
//    [fromView.layer pop_addAnimation:scaleDownAnimation forKey:@"scaleDown"];
    
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.springBounciness = 0;
    scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(5.0, 5.0)];
    scaleAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(0.5, 0.5)];
    [scaleAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    POPBasicAnimation  *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnimation.toValue = @(0);
    opacityAnimation.duration = 0.4;
    [fromView.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
    //[toView.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    [fromView.layer pop_addAnimation:scaleAnimation    forKey:@"scaleAnimation"];
}

//- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
//    
//    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
//    toView.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
//    toView.userInteractionEnabled = YES;
//    
//    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
//    
//    
//    POPBasicAnimation *closeAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
//    closeAnimation.toValue = @(-fromView.layer.position.y);
//    [closeAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
//        [transitionContext completeTransition:YES];
//    }];
//    
//    POPSpringAnimation *scaleDownAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
//    scaleDownAnimation.springBounciness = 20;
//    scaleDownAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
//    
//    [fromView.layer pop_addAnimation:closeAnimation forKey:@"closeAnimation"];
//    [fromView.layer pop_addAnimation:scaleDownAnimation forKey:@"scaleDown"];
//}
@end
