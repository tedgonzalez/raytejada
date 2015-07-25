//
//  ViewController.m
//  Raytejada
//
//  Created by ADMIN on 6/26/15.
//  Copyright (c) 2015 raystudios. All rights reserved.
//

#import "HomeViewController.h"
#import "MenuViewController.h"
#import "HeaderReusableView.h"
#import "HomeCollectionViewCell.h"
#import "RTConstants.h"

#import "PresentingAnimationController.h"
#import "DismissingAnimationController.h"
#import <pop/POP.h>

#define kCellSpacing 0
@interface HomeViewController () <
UIViewControllerTransitioningDelegate,
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout
>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation HomeViewController
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark --------------------------------------
#pragma mark UICollectionView
#pragma mark --------------------------------------
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return kCellSpacing;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return kCellSpacing;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(kDeviceSize.width, 163.0 * kDeviceSize.width / 320.0);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat num = 3.0;
    CGFloat dim = kDeviceSize.width / num - kCellSpacing;
    return CGSizeMake(dim, dim);
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    HeaderReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HeaderReusableView" forIndexPath:indexPath];
    return headerView;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}



- (IBAction)didClickOnPresent:(id)sender {
    
    MenuViewController *modalVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([MenuViewController class])];
    
    
    modalVC.transitioningDelegate = self;
    
    modalVC.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:modalVC animated:YES completion:nil];
}
#pragma mark --------------------------------------
#pragma mark UIViewControllerTransitionDelegate
#pragma mark --------------------------------------
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[PresentingAnimationController alloc] init];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[DismissingAnimationController alloc] init];
}
@end
