//
//  DetailViewController.m
//  MDFII-Week4
//
//  Created by Jerry Pennell on 05/26/13.
//  Copyright (c) 2013 Jerry Pennell. All rights reserved.
//

#import "DetailViewController.h"
#import "MovieViewController.h"
#import "ShowtimeCell.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.movie && self.movie.movieShowTimes) {
        self.showtimesTableView.dataSource = self;
        self.showtimesTableView.delegate = self;
        
        NSURL * imageURL = [NSURL URLWithString:self.movie.movieImage];
        NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
        UIImage * image = [UIImage imageWithData:imageData];
        
        self.movieImage.image = image;
        self.movieTitle.text = self.movie.movieName;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[UILabel appearanceWhenContainedIn:[DetailViewController class], nil] setColor:[UIColor whiteColor]];
    [[UILabel appearanceWhenContainedIn:[DetailViewController class], nil] setShadowColor:[UIColor blackColor]];
    [[UILabel appearanceWhenContainedIn:[DetailViewController class], nil] setShadowOffset:CGSizeMake(1, 1)];
    
    [[UILabel appearanceWhenContainedIn:[DetailViewController class], nil] setColor:[UIColor whiteColor]];
    [[UILabel appearanceWhenContainedIn:[DetailViewController class], nil] setShadowColor:[UIColor blackColor]];
    [[UILabel appearanceWhenContainedIn:[DetailViewController class], nil] setShadowOffset:CGSizeMake(1, 1)];
    
    [[UILabel appearanceWhenContainedIn:[UITableViewCell class], [DetailViewController class], nil] setColor:[UIColor blackColor]];
    [[UILabel appearanceWhenContainedIn:[UITableViewCell class], [DetailViewController class], nil] setShadowColor:nil];
    [[UILabel appearanceWhenContainedIn:[UITableViewCell class], [DetailViewController class], nil] setShadowOffset:CGSizeMake(0, 0)];
    
    [[UILabel appearanceWhenContainedIn:[UIButton class], [DetailViewController class], nil] setColor:[UIColor blackColor]];
    [[UILabel appearanceWhenContainedIn:[UIButton class], [DetailViewController class], nil] setShadowColor:nil];
    [[UILabel appearanceWhenContainedIn:[UIButton class], [DetailViewController class], nil] setShadowOffset:CGSizeMake(0, 0)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)launchTrailer:(id)sender {
    [self performSegueWithIdentifier:kPushMovieViewSegue sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([kPushMovieViewSegue isEqualToString:segue.identifier]) {
        MovieViewController* movieVC = (MovieViewController*)segue.destinationViewController;
        movieVC.movieURL = self.movie.movieTrailer;
    }
}

#pragma mark - UITableViewDataSource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Today's Showtimes";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movie.movieShowTimes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ShowtimeCell";
    ShowtimeCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.showtime.text = [self.movie.movieShowTimes objectAtIndex:indexPath.row];
    
    return cell;
}

@end
