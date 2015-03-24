//
//  main.m
//  StarWars
//
//  Created by Javi Alzueta on 24/3/15.
//  Copyright (c) 2015 FillinGAPPs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

// EventLoop: Nginx (http server), node.js
// RunLoop
int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        // Se queda esperando a evento del usuario y del S.O.
        // Nunca tocaremos aqui
    }
}
