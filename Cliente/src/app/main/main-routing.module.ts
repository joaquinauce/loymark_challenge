import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { UsuarioListComponent } from './usuario-list/usuario-list.component';
import { UsuarioComponent } from './usuario/usuario.component';
import { ActividadListComponent } from './actividad-list/actividad-list.component';

const routes: Routes = [
  {
    path: '',
    children: [
      { path: 'usuariolist', component: UsuarioListComponent },
      { path: 'usuario', component: UsuarioComponent },
      { path: 'actividadlist', component: ActividadListComponent },
      { path: 'viewUsuario/:id', component: UsuarioComponent},
      { path: 'editUsuario/:id', component: UsuarioComponent},
      { path: '**', redirectTo: 'usuariolist' },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class MainRoutingModule {}
