//
//  DetailViewController.h
//  MDFII-Week4
//
//  Created by Jerry Pennell on 05/26/13.
//  Copyright (c) 2013 Jerry Pennell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface DetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) Movie* movie;
@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
@property (weak, nonatomic) IBOutlet UITableView *showtimesTableView;

- (IBAction)launchTrailer:(id)sender;

@end
