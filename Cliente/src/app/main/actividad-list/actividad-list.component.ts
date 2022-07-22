import { Component, OnInit } from '@angular/core';
import { Actividad } from 'src/app/intefaces/actividad.interface';
import { ActividadService } from '../../services/actividad.service';

@Component({
  selector: 'app-actividad-list',
  templateUrl: './actividad-list.component.html',
  styleUrls: ['./actividad-list.component.css']
})
export class ActividadListComponent implements OnInit {

  public actividades: Actividad[] = [];

  constructor( private actividadService: ActividadService ) { }

  ngOnInit(): void {
    this.ObtenerActividades();
  }

  //Funcion que obtiene todas las actividades realizadas en el sistema.
  ObtenerActividades() {
    this.actividadService.GetActividades().subscribe((actividades) => {
      this.actividades = actividades;
    });
  }

}
