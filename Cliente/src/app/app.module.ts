import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { UsuarioComponent } from './main/usuario/usuario.component';
import { UsuarioListComponent } from './main/usuario-list/usuario-list.component';
import { ActividadListComponent } from './main/actividad-list/actividad-list.component';
import { SharedModule } from './shared/shared.module';
import { MainModule } from './main/main.module';
import { ToastrModule } from 'ngx-toastr';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';


@NgModule({
  declarations: [
    AppComponent,
    UsuarioListComponent,
    UsuarioComponent,
    ActividadListComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    SharedModule,
    MainModule,
    ToastrModule.forRoot(),
    BrowserAnimationsModule,
    FormsModule,
    CommonModule

  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
