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



@implementation AppDelegate

#pragma mark - UIApplicationDelegate

// La App ha sido lanzada por el sistema operativo
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Creamos una vista de tipo UIWindow: usamos el inicializador DESIGANDO (initWithFrame)
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    // mainScreen: pantalla principal --> podríamos tener 2 pantallas con AirPlay
    
    // Creamos un modelo
    FLGStarWarsUniverse *universe = [[FLGStarWarsUniverse alloc] init];
    
    // Creamos un controlador
    FLGUniverseTableViewController *tableVC = [[FLGUniverseTableViewController alloc] initWithModel:universe style:UITableViewStylePlain];
    
    // Creo el combinador
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:tableVC];
    
    // ----------------------------------------------------------------------------------
//    UITabBarController *tabVC = [[UITabBarController alloc] init];
//    tabVC.viewControllers = [self arrayOfControllers];
    // ----------------------------------------------------------------------------------
    
    // Mostramos el controlador en pantalla
    self.window.rootViewController = navVC;
    
    
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



@end
