//
//  HomeViewController.m
//  Challenger
//
//  Created by Sreenivas Appasani on 11/5/19.
//  Copyright © 2019 Sreenivas Appasani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeViewController.h"
#import "CGECollectionViewCell.h"

@interface HomeViewController () <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *ChallengeCV;
@property (strong, nonatomic) NSMutableArray *challenges;
@end

@implementation HomeViewController

-(void) viewDidLoad {
    self.challenges = [[NSMutableArray alloc] initWithArray:@[@"foo", @"bar", @"boo"]];
    self.ChallengeCV.dataSource = self;
    
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static BOOL nibMyCellloaded = NO;
    static NSString *cellIdentifier = @"CGECell";
    
    if(!nibMyCellloaded)
    {
        UINib *nib = [UINib nibWithNibName:@"CGECollectionViewCell" bundle: nil];
        [collectionView registerNib:nib forCellWithReuseIdentifier:cellIdentifier];
        nibMyCellloaded = YES;
    }
    
    CGECollectionViewCell *cell = (CGECollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell layoutIfNeeded];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.challenges.count;
}

@end
