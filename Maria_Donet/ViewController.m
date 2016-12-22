//
//  ViewController.m
//  Maria_Donet
//
//  Created by Alumno on 15/11/16.
//  Copyright © 2016 Maria. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tablaRtes;

@property NSMutableArray *listaRteM;
@property RteDataSource *rteDS;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"cargando datos desde WilAppear");
    DaoRte *daoRte = [DaoRte new];
    _listaRteM = [daoRte listarRestaurantes];
    _rteDS = [RteDataSource new];
    _rteDS.listadoRestaurantes = _listaRteM;
    
    _tablaRtes.dataSource = _rteDS;
    _tablaRtes.delegate = self;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    long posicion = indexPath.row;
    Restaurante *restaurante = [_rteDS restauranteAt:posicion];
    [self performSegueWithIdentifier:@"infoSegue" sender:restaurante];
}

/*
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    long posicion = indexPath.row;
    Restaurante *restaurante = [_rteDS restauranteAt:posicion];
    [self performSegueWithIdentifier:@"infoSegue" sender:restaurante];
}
*/
-(void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"infoSegue"]){
        DetailViewController *viewcontroller = (DetailViewController*)[segue destinationViewController];
        
        viewcontroller.restauranteSeleccionado = sender;
    }
}

@end
