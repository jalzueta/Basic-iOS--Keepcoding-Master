//
//  FLGStarWarsUniverse.m
//  StarWars
//
//  Created by Javi Alzueta on 26/3/15.
//  Copyright (c) 2015 FillinGAPPs. All rights reserved.
//

#import "FLGStarWarsUniverse.h"

@interface FLGStarWarsUniverse ()

@property (strong, nonatomic) NSArray *rebels;
@property (strong, nonatomic) NSArray *imperials;

@end


@implementation FLGStarWarsUniverse

#pragma mark - Properties
// Getters personalizados para los counts
- (NSUInteger) rebelCount{
    return self.rebels.count;
}

- (NSUInteger) imperialCount{
    return self.imperials.count;
}

#pragma mark - Init
// Sobreescribimos el inicializador por defecto
- (id) init{
    if (self  = [super init]) {
        
        // Creamos los personajes
        // Vader
        NSURL *vaderURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Darth_Vader"];
        
        NSBundle *bundle = [NSBundle mainBundle];
        NSData *vaderSound = [NSData dataWithContentsOfURL:[bundle URLForResource:@"vader" withExtension:@"caf"]];
        // Apple recomienda usar los que se refieren a URLs y no a Files, aunque se trate de recursos almacenados en local
        // Para obtener la URL absoluta a un fichero local, se la preguntamos a una instancia de NSBundle
        
        UIImage *vaderImage = [UIImage imageNamed:@"darthVader.jpg"];
        // La buscará en el bundle principal
        
        FLGStarWarsCharacter *vader = [[FLGStarWarsCharacter alloc] initWithName:@"Anakin Skywalker"
                                                                           alias:@"Darth Vader"
                                                                             url:vaderURL
                                                                       soundData:vaderSound
                                                                           photo:vaderImage];
        
        // Chewbacca
        NSURL *chewieURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Chewbacca"];
        NSData *chewieSound = [NSData dataWithContentsOfURL:[bundle URLForResource:@"chewbacca" withExtension:@"caf"]];
        UIImage *chewieImage = [UIImage imageNamed:@"chewbacca.jpg"];
        FLGStarWarsCharacter *chewie = [[FLGStarWarsCharacter alloc] initWithAlias:@"Chewbacca"
                                                                               url:chewieURL
                                                                         soundData:chewieSound
                                                                             photo:chewieImage];
        
        // C-3PO
        NSURL *c3poURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/C-3PO"];
        NSData *c3poSound = [NSData dataWithContentsOfURL:[bundle URLForResource:@"c3po" withExtension:@"caf"]];
        UIImage *c3poImage = [UIImage imageNamed:@"c3po.jpg"];
        FLGStarWarsCharacter *c3po = [[FLGStarWarsCharacter alloc] initWithAlias:@"C-3PO"
                                                                             url:c3poURL
                                                                       soundData:c3poSound
                                                                           photo:c3poImage];
        
        // Yoda
        NSURL *yodaURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Yoda"];
        NSData *yodaSound = [NSData dataWithContentsOfURL:[bundle URLForResource:@"yoda" withExtension:@"caf"]];
        UIImage *yodaImage = [UIImage imageNamed:@"yoda.jpg"];
        FLGStarWarsCharacter *yoda = [[FLGStarWarsCharacter alloc] initWithName:@"Minch Yoda"
                                                                          alias:@"Master Yoda"
                                                                            url:yodaURL
                                                                      soundData:yodaSound
                                                                          photo:yodaImage];
        
        // R2-D2
        NSURL *r2d2URL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/R2-D2"];
        NSData *r2d2Sound = [NSData dataWithContentsOfURL:[bundle URLForResource:@"r2-d2" withExtension:@"caf"]];
        UIImage *r2d2Image = [UIImage imageNamed:@"R2-D2.jpg"];
        FLGStarWarsCharacter *r2d2 = [[FLGStarWarsCharacter alloc] initWithAlias:@"R2-D2"
                                                                             url:r2d2URL
                                                                       soundData:r2d2Sound
                                                                           photo:r2d2Image];
        
        self.rebels = @[chewie, c3po, r2d2, yoda];
        self.imperials = @[vader];
    }
    return self;
}

#pragma mark - Accessors
- (FLGStarWarsCharacter *) rebelAtIndex: (NSUInteger) index{
    return [self.rebels objectAtIndex:index];
}

- (FLGStarWarsCharacter *) imperialAtIndex: (NSUInteger) index{
    return [self.imperials objectAtIndex:index];
}

@end
