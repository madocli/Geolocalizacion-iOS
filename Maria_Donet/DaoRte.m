//
//  DaoRte.m
//  Maria_Donet
//
//  Created by Alumno on 15/11/16.
//  Copyright © 2016 Maria. All rights reserved.
//

#import "DaoRte.h"

@implementation DaoRte

-(void)guardarRestaurante:(Restaurante *)restaurante{
    
    //Abrimos conexión a BBDD
    RteBBDD *rteBBDD = [[RteBBDD alloc] init]; // reservamos memoria e inicializamos
    
    //cojemos la referencia de la bbdd
    sqlite3 *bbdd = rteBBDD.bbdd;
    
    //especificamos sentencia a "binarizar" para hacer la conexión a bbdd
    NSString *sQuery = @"insert into RESTAURANTES (NOMBRE, DESCRIPCION, LONGITUD, LATITUD) values (?,?,?,?);";
    
    sqlite3_stmt *query = nil; //Donde vamos a especificar la sentencia
    
    sqlite3_prepare_v2(bbdd, //donde vamos a crear acceso
                       [sQuery UTF8String], //sentencia a ejecutar en sqlite
                       -1, //límite de la consulta
                       &query, //puntero que referenciará el nuevo OBJETO
                       nil);
    
    //A CONTINUACIÓN PARAMETRIZAMOS
    sqlite3_bind_text(query,
                      1, //posición del interrogante a sustituir
                      [restaurante.nombre UTF8String], //contenido a guardar
                      -1, //límite de datos a guardar
                      SQLITE_TRANSIENT);
    sqlite3_bind_text(query,
                      2, //posición del interrogante a sustituir
                      [restaurante.descripcion UTF8String], //contenido a guardar
                      -1, //límite de datos a guardar
                      SQLITE_TRANSIENT);

    sqlite3_bind_double(query,
                        3,
                        restaurante.latitud);
    sqlite3_bind_double(query,
                        4,
                        restaurante.longitud);
    
    //ejecutamos la query
    int respuesta = sqlite3_step(query);
    
    NSLog(@"respuesta bbdd al guardar el Restaurante: %d", respuesta);
    
    //RESETEAMOS LA QUERY
    sqlite3_reset(query);
    
}

-(NSMutableArray *)listarRestaurantes{
    //Abrimos conexión a BBDD
    RteBBDD *rteBBDD = [[RteBBDD alloc] init]; // reservamos memoria e inicializamos
    
    //cojemos la referencia de la bbdd
    sqlite3 *bbdd = rteBBDD.bbdd;
    
    //creamos la query a lanzar
    NSString *sQuery = @"select * from RESTAURANTES";
    sqlite3_stmt *query = nil;
    //parámetros de búsqueda en lenguaje sqlite3
    sqlite3_prepare_v2(bbdd, [sQuery UTF8String], -1, &query, nil);
    
    
    NSMutableArray *listadoRte = [[NSMutableArray alloc]init];
    //a continuación creamos usuario a partir de los datos devueltos
    while (sqlite3_step(query) == SQLITE_ROW) {
        //aquí preguntamos por el valor de la columna devuelta
        // 0->codigo  1->nombre  2->descripcion
        int codigo = sqlite3_column_int(query,0);
        NSString *nombre = [NSString stringWithUTF8String:(const char*) sqlite3_column_text(query,1)];
        NSString *descripcion = [NSString stringWithUTF8String:(const char*) sqlite3_column_text(query,2)];
        double latitud = sqlite3_column_double(query, 3);
        double longitud = sqlite3_column_double(query, 4);
        //creamos variable VideoJuegos
        Restaurante *restaurante = [[Restaurante alloc]initConCodigo:codigo ConNombre:nombre ConDescripcion:descripcion ConLatitud:longitud ConLongitud:latitud];
        NSLog(@"Se ha sacado de la BBDD el Rte: %@ %.02f", restaurante.nombre, restaurante.latitud);
        [listadoRte addObject:restaurante];
    }
    
    //RESETEAMOS LA QUERY
    sqlite3_reset(query);
    
    return listadoRte;
}

@end
