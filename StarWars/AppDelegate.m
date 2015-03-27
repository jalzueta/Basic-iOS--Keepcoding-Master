//
//  AppDelegate.m
//  StarWars
//
//  Created by Javi Alzueta on 24/3/15.
//  Copyright (c) 2015 FillinGAPPs. All rights reserved.
//

#import "AppDelegate.h"
#import "FLGCharacterViewController.h"
#import "FLGWikiViewController.h"
#import "FLGStarWarsUniverse.h"
#import "FLGUniverseTableViewController.h"
#import "Settings.h"

@implementation AppDelegate

#pragma mark - UIApplicationDelegate

// La App ha sido lanzada por el sistema operativo
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // NSUserDefaults: Valor por defecto para ultimo personaje seleccionado
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    if (![def objectForKey:LAST_SELECTED_CHARACTER]) {
        
        // Guardamos un valor por defecto
        [def setObject:@[@(IMPERIAL_SECTION),@0]
                forKey:LAST_SELECTED_CHARACTER];
        
        // Por si acaso guardamos
        [def synchronize];
    }
    
    // Creamos una vista de tipo UIWindow: usamos el inicializador DESIGANDO (initWithFrame)
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    // mainScreen: pantalla principal --> podríamos tener 2 pantallas con AirPlay
    
    // Creamos un modelo
    FLGStarWarsUniverse *universe = [[FLGStarWarsUniverse alloc] init];
    
    // Detectamos el tipo de pantalla
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
        // Tipo tableta
        [self configureForPadWithModel:universe];
    }else{
        
        // Tipo telefono
        [self configureForPhoneWithModel:universe];
    }
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor clearColor];
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


- (void) configureForPadWithModel: (FLGStarWarsUniverse *) universe{
    
    // Creamos los controladores
    FLGUniverseTableViewController *universeVC = [[FLGUniverseTableViewController alloc] initWithModel:universe style:UITableViewStyleGrouped];
    FLGCharacterViewController *charVC = [[FLGCharacterViewController alloc] initWithModel:[self lastSelectedCharacterInModel: universe]];
    
    // Creo los navigationControllers
    UINavigationController *universeNavVC = [[UINavigationController alloc] initWithRootViewController:universeVC];
    UINavigationController *charNavVC = [[UINavigationController alloc] initWithRootViewController:charVC];
    
    // Creo el SplitViewController
    UISplitViewController *spliVC = [[UISplitViewController alloc] init];
    spliVC.viewControllers = @[universeNavVC, charNavVC];
    
    // Asignamos delegados
    spliVC.delegate = charVC;
    universeVC.delegate = charVC;
    
    // Mostramos el controlador en pantalla
    self.window.rootViewController = spliVC;

}

- (void) configureForPhoneWithModel: (FLGStarWarsUniverse *) universe{
    
    // Creamos el controlador
    FLGUniverseTableViewController *universeVC = [[FLGUniverseTableViewController alloc] initWithModel:universe style:UITableViewStyleGrouped];
    
    // Creo el combinador
    UINavigationController *universeNavVC = [[UINavigationController alloc] initWithRootViewController:universeVC];
    
    // Asignamos delegados
    universeVC.delegate = universeVC;
    
    // Mostramos el controlador en pantalla
    self.window.rootViewController = universeNavVC;
}


- (FLGStarWarsCharacter *) lastSelectedCharacterInModel: (FLGStarWarsUniverse *) universe{
    
    // Obtengo el NSUserDefaults
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    // Saco las coordenadas del ultimo personaje
    NSArray *coords = [def objectForKey:LAST_SELECTED_CHARACTER];
    NSUInteger section = [[coords objectAtIndex:0] integerValue];
    NSUInteger pos = [[coords objectAtIndex:1] integerValue];
    
    // Obtengo el personaje
    FLGStarWarsCharacter *character;
    if (section == IMPERIAL_SECTION) {
        character = [universe imperialAtIndex:pos];
    }else{
        character = [universe rebelAtIndex:pos];
    }
    
    // Lo devuelvo
    return character;
}


@end
