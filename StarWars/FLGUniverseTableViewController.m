//
//  FLGUniverseTableViewController.m
//  StarWars
//
//  Created by Javi Alzueta on 26/3/15.
//  Copyright (c) 2015 FillinGAPPs. All rights reserved.
//

@import UIKit;
#import "FLGUniverseTableViewController.h"
#import "FLGCharacterViewController.h"
#import "FLGStarWarsUniverse.h"
#import "FLGStarWarsCharacter.h"

@interface FLGUniverseTableViewController ()

@end

@implementation FLGUniverseTableViewController


- (id) initWithModel: (FLGStarWarsUniverse *) model
               style: (UITableViewStyle) style{
    
    if (self = [super initWithStyle:style]) {
        _model = model;
        self.title = @"StarWars Universe";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    if (section == IMPERIAL_SECTION) {
        return  self.model.imperialCount;
    }else{
        return self.model.rebelCount;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Averiguar de que modelo (personaje) me está hablando
    FLGStarWarsCharacter *character = [self characterAtIndexPath:indexPath];
    
    // Crear una celda
    static NSString *cellId = @"StarWarsCell"; // al ser "static" solo se va a asignar la primera vez que se entre en este método. Las siguientes veces, simplemente se recuperará el valor guardado.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    // dequeueReusableCellWithIdentifier: se usa para celda del sistema --> puede devolver "nil"
    // dequeueReusableCellWithIdentifier: forIndexPath: se usa para celdas personalidades --> necesita que le asignemos el "cellId" a una clase que herede de UITableViewCell, pero nunca devolverá "nil", sino que el mismo creará la celda nueva si esta no existe en cache para su reutilización
    if (cell == nil) {
        // La tenemos que crear nosotros
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:cellId];
    }
    
    // Configurarla
    // Sincronizamos modelo (personaje) -> vista (celda)
    cell.imageView.image = character.thumbnail;
    cell.textLabel.text = character.alias;
    cell.detailTextLabel.text = character.name;
    
    // Devolverla
    return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (section == IMPERIAL_SECTION) {
        return @"Imperials";
    }else{
        return @"Rebels";
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar de qué modelo (personaje) me están hablando
    FLGStarWarsCharacter *character = [self characterAtIndexPath:indexPath];
    
    // Avisar al delegado (siempre y cuando entienda el mensaje)
    if ([self.delegate respondsToSelector:@selector(universeTableViewController:didSelectCharacter:)]) {
        // Envio el mensaje al delegado
        [self.delegate universeTableViewController:self didSelectCharacter:character];
    }
    
    // Mandamos una notificacion -> para avisar a wikiViewController
    // Creamos la notificacion (object es el remitente, el sender)
    NSNotification *note = [NSNotification notificationWithName:CHARACTER_DID_CHANGE_NOTIFICATION_NAME
                                                         object:self
                                                       userInfo:@{CHARACTER_KEY: character}];
    
    // Enviamos la notificacion
    // [NSNotificationCenter defaultCenter]: NSNotificationCenter es un singleton, solo puede existir una instancia
    [[NSNotificationCenter defaultCenter] postNotification:note];
}


#pragma mark - Utils

- (FLGStarWarsCharacter *) characterAtIndexPath: (NSIndexPath *) indexPath{
    FLGStarWarsCharacter *character = nil;
    if (indexPath.section == IMPERIAL_SECTION) {
        character = [self.model imperialAtIndex:indexPath.row];
    }else{
        character = [self.model rebelAtIndex:indexPath.row];
    }
    return character;
}

@end
