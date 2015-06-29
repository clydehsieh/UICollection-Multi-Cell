//
//  Tier1CollectionViewCell.h
//  UICollectionViewPractice
//
//  Created by Chin-Hui Hsieh  on 6/28/15.
//  Copyright (c) 2015 Chin-Hui Hsieh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tier1CollectionViewCell : UICollectionViewCell <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UICollectionView *tier2CollectionView;

@end
