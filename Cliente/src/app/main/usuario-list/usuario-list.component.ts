import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Usuario } from 'src/app/intefaces/usuario.interface';
import { UsuarioService } from '../../services/usuario.service';

@Component({
  selector: 'app-usuario-list',
  templateUrl: './usuario-list.component.html',
  styleUrls: ['./usuario-list.component.css']
})
export class UsuarioListComponent implements OnInit {

public usuarios: Usuario[] = [];

  constructor( private usuarioService: UsuarioService, private router: Router ) { }

  ngOnInit(): void {
    this.ObtenerUsuarios();
  }

  //Funcion que obtiene todos los usuarios que no tengan fecha de baja
  ObtenerUsuarios(){
    this.usuarioService.GetUsuarios().subscribe((usuarios) => {
      this.usuarios = usuarios;
    });
  }

  //Funcion que redirige a la creacion de un nuevo usuario
  new(){
    this.router.navigateByUrl('main/usuario');
  }

  //Funcion que redirecciona a la pantalla de nuevo usuario, con la ruta para saber si es visualizacion o edicion.
  redirect(id: number, route: string) {
    const idString = id.toString();
    if (route == 'view') {
      this.router.navigateByUrl(
        `main/viewUsuario/${idString}`,
        {
          skipLocationChange: true,
        },
      );
    } else {
      this.router.navigateByUrl(
        `main/editUsuario/${idString}`,
        {
          skipLocationChange: true,
        },
      );
    }
  }

  //Funcion que elimina un usuario
  deleteUser(id:number){
    this.usuarioService.BorrarUsuario(id).subscribe(() => {
      this.ObtenerUsuarios();
    });
  }

}
