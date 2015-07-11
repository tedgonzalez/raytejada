//
//  PresentingAnimationController.m
//  Raytejada
//
//  Created by ADMIN on 7/10/15.
//  Copyright (c) 2015 raystudios. All rights reserved.
//

#import "PresentingAnimationController.h"

@implementation PresentingAnimationController
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    fromView.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
    fromView.userInteractionEnabled = NO;
    
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    toView.frame = CGRectMake(0,
                              0,
                              CGRectGetWidth(transitionContext.containerView.bounds),
                              CGRectGetHeight(transitionContext.containerView.bounds));
    //CGPoint p = CGPointMake(transitionContext.containerView.center.x, transitionContext.containerView.center.y);
    //toView.center = p;
    
    [transitionContext.containerView addSubview:toView];
    
//    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
//    positionAnimation.toValue = @(transitionContext.containerView.center.y);
//    positionAnimation.springBounciness = 10;
//    [positionAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
//        [transitionContext completeTransition:YES];
//    }];
    
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.springBounciness = 0;
    scaleAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(5.0, 5.0)];
    scaleAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(0.5, 0.5)];
    [scaleAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    POPBasicAnimation  *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnimation.fromValue = @(0);
    opacityAnimation.duration = 0.5;
    [toView.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
    //[toView.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    [toView.layer pop_addAnimation:scaleAnimation    forKey:@"scaleAnimation"];
    
}
// for reference
//- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
//    
//    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
//    fromView.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
//    fromView.userInteractionEnabled = NO;
//    
//    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
//    toView.frame = CGRectMake(0,
//                              0,
//                              CGRectGetWidth(transitionContext.containerView.bounds) - 100.f,
//                              CGRectGetHeight(transitionContext.containerView.bounds) - 280.f);
//    CGPoint p = CGPointMake(transitionContext.containerView.center.x, -transitionContext.containerView.center.y);
//    toView.center = p;
//    
//    [transitionContext.containerView addSubview:toView];
//    
//    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
//    positionAnimation.toValue = @(transitionContext.containerView.center.y);
//    positionAnimation.springBounciness = 10;
//    [positionAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
//        [transitionContext completeTransition:YES];
//    }];
//    
//    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
//    scaleAnimation.springBounciness = 20;
//    scaleAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(1.2, 1.4)];
//    
//    [toView.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
//    [toView.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
//}
@end
