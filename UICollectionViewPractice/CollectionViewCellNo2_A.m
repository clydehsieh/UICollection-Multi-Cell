//
//  CollectionViewCellNo2_A.m
//  UICollectionViewPractice
//
//  Created by Chin-Hui Hsieh  on 6/28/15.
//  Copyright (c) 2015 Chin-Hui Hsieh. All rights reserved.
//

#import "CollectionViewCellNo2_A.h"

@implementation CollectionViewCellNo2_A

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"CollectionViewCellNo2_A" owner:self options:nil];
        
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        
        self = [arrayOfViews objectAtIndex:0];
        
    }
    
    return self;
    
}
@end
