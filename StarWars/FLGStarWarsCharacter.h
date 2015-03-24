//
//  FLGStarWarsCharacter.h
//  StarWars
//
//  Created by Javi Alzueta on 24/3/15.
//  Copyright (c) 2015 FillinGAPPs. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit; // Esta es una nueva forma de importar librerías del sistema, para las nuestras no vale todavía

@interface FLGStarWarsCharacter : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *alias;
@property (strong, nonatomic) NSURL *wikiURL; // cadena con un extra, formato de URL
@property (strong, nonatomic) NSData * soundData; // NSData: para guardar archivos binarios (como un buffer)
@property (strong, nonatomic) UIImage *photo;


// designated init
- (id) initWithName: (NSString *) name
              alias: (NSString *) alias
                url: (NSURL *) wikiURL
          soundData: (NSData *) soundData
              photo: (UIImage *) photo;

- (id) initWithAlias: (NSString *) alias
                 url: (NSURL *) wikiURL
           soundData: (NSData *) soundData
               photo: (UIImage *) photo;

@end
