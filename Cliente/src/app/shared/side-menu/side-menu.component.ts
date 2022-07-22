import { Component, OnInit } from '@angular/core';

interface MenuItem{
  texto: string;
  ruta: string;
}

@Component({
  selector: 'app-side-menu',
  templateUrl: './side-menu.component.html',
  styleUrls: ['./side-menu.component.css']
})
export class SideMenuComponent {

  templateMenu: MenuItem[] = [
    {
      texto: 'Usuarios',
      ruta: './main/usuariolist'
    },
    {
      texto: 'Nuevo usuario',
      ruta: './main/usuario'
    },
    {
      texto: 'Actividades',
      ruta: './main/actividadlist'
    }
  ]

}
