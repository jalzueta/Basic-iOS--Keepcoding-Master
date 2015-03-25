//
//  AppDelegate.m
//  StarWars
//
//  Created by Javi Alzueta on 24/3/15.
//  Copyright (c) 2015 FillinGAPPs. All rights reserved.
//

#import "AppDelegate.h"
#import "FLGStarWarsCharacter.h"
#import "FLGCharacterViewController.h"
#import "FLGWikiViewController.h"



@implementation AppDelegate

#pragma mark - UIApplicationDelegate

// La App ha sido lanzada por el sistema operativo
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Creamos una vista de tipo UIWindow: usamos el inicializador DESIGANDO (initWithFrame)
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    // mainScreen: pantalla principal --> podríamos tener 2 pantallas con AirPlay
    
    
    // Creo el combinador
    
    // ----------------------------- NavigationController -------------------------------
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    tabVC.viewControllers = [self arrayOfControllers];
    // ----------------------------------------------------------------------------------
    
    // Mostramos el controlador en pantalla
    self.window.rootViewController = tabVC;
    
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor orangeColor];
    // orangeColor: método factory, método de clase
    
    // La mostramos
    [self.window makeKeyAndVisible];
    return YES;
}


// La App ya no está activa, no recibe los toques del usuario (tiene el foco)
// Esto ocurre cuando te llaman mientras usas una App, por ejemplo
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

// La App tiene con 3 segundos y pierde el acceso al procesador
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

// La App va a morir, ya es tarde para guardar datos
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - Utils
- (NSArray *) arrayOfModels{
    
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
    
    // Si hay más items que los que caben en la barra del tabBar, el último elemento pasa a ser "..." y al pulsarse, el propio sistema muestra una tabla con los elementos que no caben en la barra
    // Ojo con meter muchos, ya que se cargan todos en memoria y eso puede ser peligroso...
    return @[vader, chewie, c3po, yoda, r2d2, r2d2, r2d2, vader, chewie, c3po];
}


- (NSArray *) arrayOfControllers{
    
    NSArray *models = [self arrayOfModels];
    // Inicializamos el array mutable con el tamaño de elementos del modelo
    NSMutableArray *controllers = [NSMutableArray arrayWithCapacity:models.count];
    
    // Recorremos los modelos
    for (FLGStarWarsCharacter *each in models) {
        
        // Creo un controlador
        FLGCharacterViewController *charVC = [[FLGCharacterViewController alloc] initWithModel:each];
        
        // Lo meto en un navigationController
        UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController: charVC];
        
        // Lo añado al array de controladores
        [controllers addObject:navVC];
    }
    
    // Devolvemos un NSMutableArray aunque se espere un NSArray.
    // Al ser NSMutableArray una subclase de NSArray, no hay problema
    return  controllers;
}



@end
