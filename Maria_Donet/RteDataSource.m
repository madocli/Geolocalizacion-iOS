//
//  RteDataSource.m
//  Maria_Donet
//
//  Created by Alumno on 15/11/16.
//  Copyright © 2016 Maria. All rights reserved.
//

#import "RteDataSource.h"

@implementation RteDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *idCelda = @"celdaRtes";
    UITableViewCell *celda = nil;
    
    //para comprobar que no existen elementos sueltos en memoria, para no crear objetos innecesariamente
    celda = [tableView dequeueReusableCellWithIdentifier:idCelda];
    
    if (celda == nil) {
        celda =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idCelda];
    }
    
    int posicion = (int) [indexPath row];
    Restaurante *restaurante= [_listadoRestaurantes objectAtIndex:posicion];
    celda.textLabel.text = restaurante.nombre;
    
    //"coloreado" de las celdas
    if(posicion%2==0){
        celda.tintColor = [UIColor blackColor];
        celda.backgroundColor = [UIColor grayColor];
        celda.textLabel.textColor = [UIColor whiteColor];
    }else{
        celda.tintColor = [UIColor blackColor];
        celda.textLabel.textColor = [UIColor grayColor];
        celda.backgroundColor = [UIColor whiteColor];
    }
    
    return celda;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //Numero de celdas a crear
    return _listadoRestaurantes.count;
}


//Restaurante seleccionado
-(Restaurante *)restauranteAt:(long)posicion{
    Restaurante *restaurante = _listadoRestaurantes[posicion];
    
    return restaurante;
}


@end
