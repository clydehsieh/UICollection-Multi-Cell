//
//  ViewController.m
//  UICollectionViewPractice
//
//  Created by Chin-Hui Hsieh  on 6/28/15.
//  Copyright (c) 2015 Chin-Hui Hsieh. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCellNo1.h"
#import "CollectionViewCellNo2_A.h"
#import "CVCell.h"
#import "Tier1CollectionViewCell.h"

@interface ViewController () <UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>

@end



@implementation ViewController
{
    NSIndexPath *didSeletedPath;
    NSMutableArray *didSeletedCount;
    UICollectionViewFlowLayout *flowLayout ;
    UICollectionViewFlowLayout *flowLayout2;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    didSeletedCount = [NSMutableArray arrayWithObjects:@0,@0,@0,@0,@0,@0,@0,@0,@0, nil];
    
    ///!!!:Flow Layout 設定
    flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize =CGSizeMake(100, 100);
    flowLayout.scrollDirection =UICollectionViewScrollDirectionHorizontal;
//    flowLayout.sectionInset = UIEdgeInsetsMake(80, 20, 10, 0);
//    flowLayout.minimumInteritemSpacing = 5.0;

    flowLayout2 = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout2 setItemSize:CGSizeMake(250, 100)];
    [flowLayout2 setScrollDirection:UICollectionViewScrollDirectionHorizontal];
//    [flowLayout2 setSectionInset:UIEdgeInsetsMake(80, 20, 10, 0)];
//    [flowLayout2 setMinimumInteritemSpacing:5.0];
    
    
    ///!!!: collectionViewNo1 第一個collectionview設定
        //代理設定
    self.collectionViewNo1.dataSource = self;
    self.collectionViewNo1.delegate   = self;
    
    
    ///!!!: collectionViewNo2 第二個collectionview設定
        //代理設定
    self.collectionViewNo2.dataSource = self;
    self.collectionViewNo2.delegate   = self;
        //註冊兩個客製化的cell來使用
    [self.collectionViewNo2 registerClass:[CollectionViewCellNo2_A class] forCellWithReuseIdentifier:@"CellNo2_A"];
    [self.collectionViewNo2 registerClass:[CVCell class] forCellWithReuseIdentifier:@"CVCell"];
        //選用layout2佈置
    [self.collectionViewNo2 setCollectionViewLayout:flowLayout2];
    
    
    ///!!!: collectionViewNo3 第三個collectionview設定
        //代理設定
    self.collectionViewNo3.dataSource = self;
    self.collectionViewNo3.delegate   = self;
        //註冊兩個客製化的cell來使用
    [self.collectionViewNo3 registerClass:[Tier1CollectionViewCell class] forCellWithReuseIdentifier:@"Tier1CollectionViewCell"];
    [self.collectionViewNo3 registerClass:[CVCell class] forCellWithReuseIdentifier:@"CVCell"];
        //選用layout佈置
    [self.collectionViewNo3 setCollectionViewLayout:flowLayout];
    

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - datasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView == self.collectionViewNo1)
    {
        return 7;
    }
    else if (collectionView == self.collectionViewNo2)
    {
        return 8;
    }else
    {
        return 9;
    }
    
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (collectionView == self.collectionViewNo1)
    {
        //重複使用cell reuseidentifier
        static NSString *cellIdentifier = @"CellNo1";
        //客製化cell
        CollectionViewCellNo1 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
        
        cell.cellNo2Label.text = [NSString stringWithFormat:@"CellNo1:%ld",(long)indexPath.row];
        
        return cell;
        
    }
    else if (collectionView == self.collectionViewNo2)
    {
        //第0,2,4個cell使用  CVCell, 其餘使用CellNo2_A
        if (indexPath.row %2 ==0)
        {
            //重複使用cell reuseidentifier
            static NSString *cellIdentifier = @"CVCell";
            //客製化cell
            CVCell *cell = (CVCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
            
            [cell.titleLabel setText :[NSString stringWithFormat:@"Sec :%ld",(long)indexPath.section]];
            [cell.titleLabel2 setText:[NSString stringWithFormat:@"Row :%ld",(long)indexPath.row]];
            
            return cell;
        }
        else
        {
            static NSString *cellIdentifier = @"CellNo2_A";
            
            CollectionViewCellNo2_A *cell = (CollectionViewCellNo2_A *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
            
            [cell.cellNo2_ALabel setText:[NSString stringWithFormat:@"Row: %ld",(long)indexPath.row]];
            
            return cell;
        }
        
    }
    else
    {
        //點選cell後，該位置cell變更成Tier1CollectionViewCell
        if (didSeletedPath == indexPath && [didSeletedCount[didSeletedPath.row] isEqual:@1])
        {
            
            static NSString *cellIdentifier = @"Tier1CollectionViewCell";
            
            Tier1CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
            
            cell.label.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
            
            return cell;
        }
        else
        {
            
            static NSString *cellIdentifier = @"CVCell";
            
            CVCell *cell = (CVCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
            
            [cell.titleLabel setText :[NSString stringWithFormat:@"Sec :%ld",(long)indexPath.section]];
            [cell.titleLabel2 setText:[NSString stringWithFormat:@"Row :%ld",(long)indexPath.row]];
            
            return cell;

            
        }
        
        
        
        
    }
    

}


//選取後動作
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //只有collectionView3才有動作
    if (collectionView == self.collectionViewNo3)
    {
        //接收選取位置
        didSeletedPath = indexPath;
        //記錄點選次數
        if ([didSeletedCount[didSeletedPath.row] isEqual: @0])
        {
            didSeletedCount[didSeletedPath.row]= @1;
        }
        else
        {
            didSeletedCount[didSeletedPath.row] = @0;
        }
        
        //更新畫面
        [self.collectionViewNo3 reloadData];
    }
    
    
}

//
//- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath == didSeletedPath)
//    {
//        UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//        
//        CGRect newFrame = attributes.frame ;
//        
//        newFrame.size = CGSizeMake(200, 100);
//        
//        attributes.frame = newFrame;
//        
//        return attributes;
//
//    }else
//    {
//        UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//        
//        return attributes;
//    }
//    
//  }
//
//

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.collectionViewNo3)
    {
        if (didSeletedPath == indexPath && [didSeletedCount[didSeletedPath.row] isEqual: @1])
        {
            return  CGSizeMake(250, 100);
        }
        else
        {
            return CGSizeMake(100, 100);
        }
        
    }
    else
    {
        return CGSizeMake(100, 100);
    }
    
}



@end

