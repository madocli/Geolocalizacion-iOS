//
//  DaoRte.h
//  Maria_Donet
//
//  Created by Alumno on 15/11/16.
//  Copyright © 2016 Maria. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Restaurante.h"
#import "RteBBDD.h"

@interface DaoRte : NSObject

- (void) guardarRestaurante: (Restaurante*)restaurante;

-(NSMutableArray*)listarRestaurantes;

@end
