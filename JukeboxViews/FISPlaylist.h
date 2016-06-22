//
//  FISPlaylist.h
//  JukeboxViews
//
//  Created by Flatiron School on 6/22/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISSong.h"

@interface FISPlaylist : NSObject
@property (strong, nonatomic) NSMutableArray *songs;
@property (strong, nonatomic) NSString *text;

-(instancetype)init;
-(NSMutableArray *)generateSongObjects;
-(NSString *)textForSongs;
-(void)sortSongsByTitle;
-(void)sortSongsByArtist;
-(void)sortSongsByAlbum;
-(FISSong *)songForTrackNumber:(NSUInteger)trackNumber;

@end
