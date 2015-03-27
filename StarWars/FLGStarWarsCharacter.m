//
//  FLGStarWarsCharacter.m
//  StarWars
//
//  Created by Javi Alzueta on 24/3/15.
//  Copyright (c) 2015 FillinGAPPs. All rights reserved.
//

#import "FLGStarWarsCharacter.h"

@implementation FLGStarWarsCharacter


#pragma mark - init

// designated init
- (id) initWithName: (NSString *) name
              alias: (NSString *) alias
                url: (NSURL *) wikiURL
          soundData: (NSData *) soundData
              photo: (UIImage *) photo
          thumbnail:  (UIImage *) thumbnail{
    
    if (self = [super init]) {
        _name = name;
        _alias = alias;
        _wikiURL = wikiURL;
        _soundData = soundData;
        _photo = photo;
        _thumbnail = thumbnail;
    }
    return self;
}

- (id) initWithAlias: (NSString *) alias
                 url: (NSURL *) wikiURL
           soundData: (NSData *) soundData
               photo: (UIImage *) photo
           thumbnail:  (UIImage *) thumbnail{
    return [self initWithName:nil
                        alias:alias
                          url:wikiURL
                    soundData:soundData
                        photo:photo
                    thumbnail:thumbnail];
}

@end
