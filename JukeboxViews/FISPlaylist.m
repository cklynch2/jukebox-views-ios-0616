//
//  FISPlaylist.m
//  JukeboxViews
//
//  Created by Flatiron School on 6/22/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISPlaylist.h"

@implementation FISPlaylist

-(instancetype)init {
    self = [super init];
    if (self) {
        _songs = [self generateSongObjects];
        _text = [self textForSongs];
    }
    return self;
}

-(NSMutableArray *)generateSongObjects {
    NSMutableArray *songs = [[NSMutableArray alloc] init];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Hold on Be Strong"
                                             artist:@"Matoma vs Big Poppa"
                                              album:@"The Internet 1"
                                           fileName:@"hold_on_be_strong"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Higher Love"
                                             artist:@"Matoma ft. James Vincent McMorrow"
                                              album:@"The Internet 2"
                                           fileName:@"higher_love"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Mo Money Mo Problems"
                                             artist:@"Matoma ft. The Notorious B.I.G."
                                              album:@"The Internet 3"
                                           fileName:@"mo_money_mo_problems"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Old Thing Back"
                                             artist:@"The Notorious B.I.G."
                                              album:@"The Internet 4"
                                           fileName:@"old_thing_back"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Gangsta Bleeding Love"
                                             artist:@"Matoma"
                                              album:@"The Internet 5"
                                           fileName:@"gangsta_bleeding_love"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Bailando"
                                             artist:@"Enrique Iglesias ft. Sean Paul"
                                              album:@"The Internet 6"
                                           fileName:@"bailando"] ];
    
    return songs;
}

-(NSString *)textForSongs {
    NSMutableString *text = [NSMutableString new];
    for (FISSong *song in self.songs) {
        NSUInteger trackNumber = [self.songs indexOfObject:song] + 1;
        [text appendFormat:@"%lu. %@\n", trackNumber, song.description];
    }
    return text;
}

-(void)sortSongsByTitle {
    NSSortDescriptor *titleSorter = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    [self.songs sortUsingDescriptors:@[titleSorter]];
    NSString *titleSortedText = [self textForSongs];
    self.text = titleSortedText;
}

-(void)sortSongsByArtist {
    NSSortDescriptor *artistSorter = [NSSortDescriptor sortDescriptorWithKey:@"artist" ascending:YES];
    [self.songs sortUsingDescriptors:@[artistSorter]];
    NSString *artistSortedText = [self textForSongs];
    self.text = artistSortedText;
}

-(void)sortSongsByAlbum {
    NSSortDescriptor *albumSorter = [NSSortDescriptor sortDescriptorWithKey:@"album" ascending:YES];
    [self.songs sortUsingDescriptors:@[albumSorter]];
    NSString *albumSortedText = [self textForSongs];
    self.text = albumSortedText;
}

-(FISSong *)songForTrackNumber:(NSUInteger)trackNumber {
    if (trackNumber > self.songs.count || trackNumber <= 0) {
        return nil;
    }
    return self.songs[trackNumber - 1];
}

@end
