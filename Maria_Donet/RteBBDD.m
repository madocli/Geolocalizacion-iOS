//
//  RteBBDD.m
//  Maria_Donet
//
//  Created by Alumno on 15/11/16.
//  Copyright © 2016 Maria. All rights reserved.
//

#import "RteBBDD.h"

@implementation RteBBDD

-(id) init{
    if (self == [super init]) {
        //1: BUSCAMOS EL "CAMINO" A LA CARPETA "MIS DOCUMENTOS"
        NSArray *ruta = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        //2: COJEMOS LA RUTA EN UN STRING
        NSString *rutaDocument = [ruta objectAtIndex:0];
        //3: INDICAMOS LA RUTA CON EL NOMBRE DE LA BBDD QUE QUEREMOS CREAR O ACCEDER
        NSString *rutaBBDD = [rutaDocument stringByAppendingPathComponent:@"bbddrte.sqlite"];
        
        NSLog(@"La ruta de la BBDD es: %@", rutaBBDD);
        //4: YA TENEMOS LA RUTA, AHORA NOS FALTA ABRIR EL "CANUTO" A LA BBDD
        int i =sqlite3_open_v2([rutaBBDD UTF8String],
                        &_bbdd,
                        SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE,
                        nil);
        NSLog(@"El código que devuelve la BBDD al instanciar objeto es: %d", i);
    }
    return self;
}


-(void)crearTablaRestaurantes{
    char *error;
    //"const char" porque C no acepta String, es una cadena de caracteres
    NSLog(@"Se ha creado la bbdd, siempre y cuando no exista");
    const char *crearTabla = "CREATE TABLE IF NOT EXISTS RESTAURANTES(ID INTEGER PRIMARY KEY AUTOINCREMENT, NOMBRE TEXT, DESCRIPCION TEXT, LATITUD DOUBLE, LONGITUD DOUBLE)";
    
    //a continuación creamos la bbdd;
    int i = sqlite3_exec(_bbdd, crearTabla, nil, nil, &error);
    
    NSLog(@"El código que devuelve la BBDD al establecer conexión es: %d", i);
    
    if (error) {
        NSLog(@"ERROR AL CREAR LA TABLA RESTAURANTES, %s", error);
    }
}

@end
