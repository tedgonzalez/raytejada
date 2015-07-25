//
//  DIYLayout.m
//  Raytejada
//
//  Created by Theodore Gonzalez on 7/24/15.
//  Copyright (c) 2015 raystudios. All rights reserved.
//

#import "DIYLayout.h"

@implementation DIYLayout

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *layoutAttributes = [super layoutAttributesForElementsInRect:rect];
    CGPoint offset = self.collectionView.contentOffset;
    CGFloat deltaY = ABS(offset.y);
    
    for (UICollectionViewLayoutAttributes *attributes in layoutAttributes) {
        UICollectionElementCategory elementKind = attributes.representedElementCategory;
        if (elementKind == UICollectionElementCategorySupplementaryView) {
            CGRect frame = attributes.frame;
            
            if (offset.y < 0) {
                frame.size.height = MAX(0, self.headerReferenceSize.height + deltaY + 20);
                frame.origin.y = CGRectGetMinY(frame) - deltaY;
            } else {
                frame.size.height = MAX(64, self.headerReferenceSize.height - deltaY + 20);
                frame.origin.y = CGRectGetMinY(frame) + deltaY;
            }
            
            attributes.frame = frame;
            
        }
    }
    
    return layoutAttributes;
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
@end
