//
//  Tier1CollectionViewCell.m
//  UICollectionViewPractice
//
//  Created by Chin-Hui Hsieh  on 6/28/15.
//  Copyright (c) 2015 Chin-Hui Hsieh. All rights reserved.
//

#import "Tier1CollectionViewCell.h"
#import "CollectionViewCellNo2_A.h"
#import "CVCell.h"

@implementation Tier1CollectionViewCell


- (void)awakeFromNib {
    
    self.tier2CollectionView.backgroundColor = [UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = CGSizeMake(100, 100);
    [self.tier2CollectionView setCollectionViewLayout:flowLayout];
    
    // Register the colleciton cell
    [self.tier2CollectionView registerClass:[CollectionViewCellNo2_A class] forCellWithReuseIdentifier:@"CellNo2_A"];
    
    self.tier2CollectionView.dataSource = self ;
    self.tier2CollectionView.delegate   = self ;
    
//    [self.tier2CollectionView registerNib:[UINib nibWithNibName:@"ORGArticleCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ORGArticleCollectionViewCell"];
    
}




- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"Tier1CollectionViewCell" owner:self options:nil];
        
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


#pragma mark - UICollectionViewDataSource methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"CellNo2_A";
        CollectionViewCellNo2_A *cell = (CollectionViewCellNo2_A *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
        
        [cell.cellNo2_ALabel setText:[NSString stringWithFormat:@"Row: %ld",(long)indexPath.row]];
        cell.cellNo2_ALabel.backgroundColor = [UIColor yellowColor];
        
        
        return cell;
}




@end


















