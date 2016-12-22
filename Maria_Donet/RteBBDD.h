//
//  RteBBDD.h
//  Maria_Donet
//
//  Created by Alumno on 15/11/16.
//  Copyright © 2016 Maria. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface RteBBDD : NSObject

@property (readonly) sqlite3 *bbdd;

-(void) crearTablaRestaurantes;

@end
