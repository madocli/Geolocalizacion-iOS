//
//  RteDataSource.h
//  Maria_Donet
//
//  Created by Alumno on 15/11/16.
//  Copyright © 2016 Maria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Restaurante.h"

@interface RteDataSource : NSObject <UITableViewDataSource>

@property NSMutableArray *listadoRestaurantes;

-(Restaurante*)restauranteAt:(long)posicion;


@end
