//
//  FISJukeboxViewController.m
//  JukeboxViews
//
//  Created by Flatiron School on 6/22/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISJukeboxViewController.h"

@interface FISJukeboxViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userSelectedTrackNumber;
@property (weak, nonatomic) IBOutlet UITextView *playlistTextView;

@end

@implementation FISJukeboxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.playlist = [[FISPlaylist alloc] init];
    self.playlistTextView.text = self.playlist.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpAVAudioPlayerWithFileName:(NSString *)fileName {
    NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:@"mp3"];
    NSError *error = nil;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (!self.audioPlayer)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        [self.audioPlayer prepareToPlay];
    }
}

- (IBAction)playButtonTapped:(id)sender {
    NSUInteger userSelectedTrackNumber = [self.userSelectedTrackNumber.text integerValue];
    FISSong *userSelectedSong = [self.playlist songForTrackNumber:userSelectedTrackNumber];
    NSLog(@"Selected Song: %@", userSelectedSong.description);
    [self setUpAVAudioPlayerWithFileName:userSelectedSong.fileName];
    [self.audioPlayer play];
}

- (IBAction)stopButtonTapped:(id)sender {
    [self.audioPlayer stop];
}

- (IBAction)titleButtonTapped:(id)sender {
    [self.playlist sortSongsByTitle];
    self.playlistTextView.text = self.playlist.text;
}

- (IBAction)artistButtonTapped:(id)sender {
    [self.playlist sortSongsByArtist];
    self.playlistTextView.text = self.playlist.text;
}

- (IBAction)albumButtonTapped:(id)sender {
    [self.playlist sortSongsByAlbum];
    self.playlistTextView.text = self.playlist.text;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
