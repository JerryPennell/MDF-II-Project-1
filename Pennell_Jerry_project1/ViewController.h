//
//  ViewController.h
//  collectionViewTest
//
//  Created by Wayne Pennell on 5/13/13.
//  Copyright (c) 2013 Wayne Pennell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    IBOutlet UICollectionView *theCollectionView;
    NSArray *tweetsFriends;
    
}


@end
