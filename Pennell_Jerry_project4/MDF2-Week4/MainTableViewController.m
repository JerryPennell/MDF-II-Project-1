//
//  MainTableViewController.m
//  MDFII-Week4
//
//  Created by Jerry Pennell on 05/26/13.
//  Copyright (c) 2013 Jerry Pennell. All rights reserved.
//

#import "MainTableViewController.h"
#import "DetailViewController.h"
#import "MainTableViewCell.h"
#import "Movie.h"
#import "Theater.h"
#import "CustomHeaderLabel.h"

@interface MainTableViewController ()

@property (nonatomic, strong) NSArray* movies;

@end

@implementation MainTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Theater* nearby = [Theater theaterWithName:@"Nearby Theater"
                                         location:@"RockHill, SC"
                                      andImage:[UIImage imageNamed:@"theater1.png"]];
    Theater* threemiles = [Theater theaterWithName:@"Within 3 Miles Theater"
                                        location:@"Clover, SC"
                                        andImage:[UIImage imageNamed:@"theater2.png"]];
    Theater* fivemiles = [Theater theaterWithName:@"Within 5 Miles Theater"
                                        location:@"Greenville, SC"
                                        andImage:[UIImage imageNamed:@"theater3.png"]];
    
    self.movies = [NSArray arrayWithObjects:
                   [Movie movieWithName:@"Man of Steel"
                              showTimes:[NSArray arrayWithObjects:@"10:00 AM", @"12:00 PM", @"3:00 PM", nil]
                                  image:@"http://trailers.apple.com/trailers/wb/manofsteel/images/poster.jpg" 
                             trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/wb/manofsteel/manofsteel-tlr1b_r640s.mov"]
                             andTheater:nearby],
                   [Movie movieWithName:@"Epic"
                              showTimes:[NSArray arrayWithObjects:@"11:00 AM", @"1:00 PM", @"5:00 PM", nil]
                                  image:@"http://trailers.apple.com/trailers/fox/epic/images/poster.jpg"
                             trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/fox/epic/epic-tlr1_r640s.mov"]
                             andTheater:nearby],
                   [Movie movieWithName:@"Monsters University"
                              showTimes:[NSArray arrayWithObjects:@"1:00 PM", @"1:45 PM", @"6:00 PM", @"7:00 PM", nil]
                                  image:@"http://trailers.apple.com/trailers/disney/monstersuniversity/images/poster.jpg"
                             trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/disney/monstersuniversity/monstersuniversity-tlr1_r640s.mov"]
                             andTheater:nearby],
                   [Movie movieWithName:@"Iron Man 3"
                              showTimes:[NSArray arrayWithObjects:@"11:15 AM", @"2:00 PM", nil]
                                  image:@"http://trailers.apple.com/trailers/marvel/ironman3/images/poster.jpg"
                             trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/marvel/ironman3/ironman3-tlr1-m4mb0_r640s.mov"]
                             andTheater:nearby],
                   [Movie movieWithName:@"The Croods"
                              showTimes:[NSArray arrayWithObjects:@"11:45 AM", @"12:00 PM", @"1:00 PM", @"2:30 PM", @"5:00 PM", nil]
                                  image:@"http://trailers.apple.com/trailers/dreamworks/thecroods/images/poster.jpg"
                             trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/dreamworks/thecroods/croods-tlr2_r640s.mov"]
                             andTheater:nearby],
                   [Movie movieWithName:@"The Great Gatsby"
                              showTimes:[NSArray arrayWithObjects:@"9:00 AM", @"12:00 PM", @"3:00 PM", nil]
                                  image:@"http://trailers.apple.com/trailers/wb/thegreatgatsby/images/poster.jpg"
                             trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/wb/thegreatgatsby/greatgatsby-tlr1_r640s.mov"]
                             andTheater:threemiles],
                   [Movie movieWithName:@"Star Trek - Into Darkness"
                              showTimes:[NSArray arrayWithObjects:@"12:00 PM", @"6:00 PM", nil]
                                  image:@"http://trailers.apple.com/trailers/paramount/startrekintodarkness/images/poster.jpg"
                             trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/paramount/startrekintodarkness/startrekintodarkness-tlr2-5jou7ykj_r640s.mov"]
                             andTheater:threemiles],
                   [Movie movieWithName:@"Oz the Great and Powerful"
                              showTimes:[NSArray arrayWithObjects:@"1:00 PM", @"2:00 PM", @"2:45 PM", @"3:40 PM", @"5:15 PM", nil]
                                  image:@"http://trailers.apple.com/trailers/disney/ozthegreatandpowerful/images/poster.jpg"
                             trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/disney/ozthegreatandpowerful/oz-tlr1-2938tyz_r640s.mov"]
                             andTheater:threemiles],
                   [Movie movieWithName:@"Oblivion"
                              showTimes:[NSArray arrayWithObjects:@"1:00 PM", @"3:40 PM", @"7:30 PM", nil]
                                  image:@"http://trailers.apple.com/trailers/universal/oblivion/images/poster.jpg"
                             trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/universal/oblivion/oblivion-tlr1_r640s.mov"]
                             andTheater:threemiles],
                   [Movie movieWithName:@"Mud"
                              showTimes:[NSArray arrayWithObjects:@"3:00 PM", @"6:00 PM", @"8:00 PM", @"9:00 PM", nil]
                                  image:@"http://trailers.apple.com/trailers/independent/mud/images/poster.jpg"
                             trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/independent/mud/mud-tlr1_r640s.mov"]
                             andTheater:threemiles],
                   [Movie movieWithName:@"Fast & Furious 6"
                              showTimes:[NSArray arrayWithObjects:@"6:00 PM", @"7:00 PM", @"9:00 PM", nil]
                                  image:@"http://trailers.apple.com/trailers/universal/fastfurious6/images/poster.jpg"
                             trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/universal/fastandfurious6/fastandfurious6-tlr3_r640s.mov"]
                             andTheater:fivemiles],
                   [Movie movieWithName:@"42"
                              showTimes:[NSArray arrayWithObjects:@"10:00 AM", @"3:00 PM", @"4:00 PM", nil]
                                  image:@"http://trailers.apple.com/trailers/wb/42/images/poster.jpg"
                             trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/wb/42/42-tlr1_r640s.mov"]
                             andTheater:fivemiles],
                   [Movie movieWithName:@"Ender's Game"
                              showTimes:[NSArray arrayWithObjects:@"11:50 PM", @"5:20 PM", @"8:45 PM", @"10:10 PM", nil]
                                  image:@"http://trailers.apple.com/trailers/summit/endersgame/images/poster.jpg"
                             trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/summit/endersgame/endersgame-tlr1_480p.mov"]
                             andTheater:fivemiles],
                   [Movie movieWithName:@"Elysium"
                              showTimes:[NSArray arrayWithObjects:@"4:10 PM", @"6:15 PM", @"9:40 PM", @"11:35 PM", nil]
                                  image:@"http://trailers.apple.com/trailers/sony_pictures/elysium/images/poster.jpg"
                             trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/sony/elysium/elysium-tlr1_480p.mov"]
                             andTheater:fivemiles],
                   [Movie movieWithName:@"Pacific Rim"
                              showTimes:[NSArray arrayWithObjects:@"11:00 AM", @"2:00 PM", @"9:05 PM", nil]
                                  image:@"http://trailers.apple.com/trailers/wb/pacificrim/images/poster.jpg"
                             trailerURL:[NSURL URLWithString:@"http://trailers.apple.com/movies/wb/pacificrim/pacificrim-tlr1_r640s.mov"]
                             andTheater:fivemiles],
                   nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource


// this method creates a custom table header using the custom CustomHeaderLabel nib
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSArray *headerNib = [[NSBundle mainBundle] loadNibNamed:@"CustomHeaderLabel" owner:self options:nil];
    
    NSArray* theaters = [Movie theatersForMovies:self.movies];
    Theater* theater = [theaters objectAtIndex:section];
    
    CustomHeaderLabel *headerView = (CustomHeaderLabel *)[headerNib objectAtIndex:0];
    
    if (headerView)
    {
        // create the header data objects
        UIImage *theatreImage = theater.theaterImage;
        NSString *cinemaName = theater.theaterName;
        NSString *cinemaLocation = theater.theaterLocation;
        
        // assign the data to the table header objects
        headerView.theatreName.text = cinemaName;
        headerView.theatreLocation.text = cinemaLocation;
        headerView.theatreImage.image = theatreImage;
    }
    
    return headerView;
}

// changes the header height
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[Movie theatersForMovies:self.movies] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray* theaters = [Movie theatersForMovies:self.movies];
    Theater* theater = [theaters objectAtIndex:section];
    return [[Movie moviesForTheater:theater fromMovies:self.movies] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray* theaters = [Movie theatersForMovies:self.movies];
    Theater* theater = [theaters objectAtIndex:indexPath.section];
    Movie* currentMovie = [[Movie moviesForTheater:theater fromMovies:self.movies] objectAtIndex:indexPath.row];
    
    static NSString *CellIdentifier = @"MovieCell";
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSURL * imageURL = [NSURL URLWithString:currentMovie.movieImage];
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage * image = [UIImage imageWithData:imageData];
    
    cell.movieImage.image = image;
    cell.movieTitle.text = currentMovie.movieName;
    cell.movieShowtimes.text = [currentMovie allShowtimes];
    
    return cell;
}

#pragma mark - UITableViewDelegate

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:kPushDetailsViewSegue sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([kPushDetailsViewSegue isEqualToString:segue.identifier]) {
        NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
        NSArray* theaters = [Movie theatersForMovies:self.movies];
        Theater* theater = [theaters objectAtIndex:indexPath.section];
        Movie* movie = [[Movie moviesForTheater:theater fromMovies:self.movies] objectAtIndex:indexPath.row];
        DetailViewController* detailVC = (DetailViewController*)segue.destinationViewController;
        detailVC.movie = movie;
    }
}

@end
