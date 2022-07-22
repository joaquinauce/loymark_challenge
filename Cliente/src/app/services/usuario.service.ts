import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Usuario } from '../intefaces/usuario.interface';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UsuarioService {
  private urlApi: string = environment.urlAPI;
  constructor(private http: HttpClient) { }

  BorrarUsuario(id_usuario: number) {
    const url = `${this.urlApi}/usuarios/DeleteUsuario/${id_usuario}`;
    return this.http.patch<any>(url, {});
  }


  GetUsuarioById(id_usuario: any): Observable<Usuario> {
    const url = `${this.urlApi}/usuarios/${id_usuario}`;
    return this.http.get<Usuario>(url);
  }

  GetUsuarios() {
    const url = `${this.urlApi}/Usuarios`;
    return this.http.get<Usuario[]>(url);
  }


  SaveUser(value: Usuario) {
    const url = `${this.urlApi}/usuarios`;
    return new Promise((resolve, reject) => {
      this.http.post<Usuario>(url, value).subscribe(
        (resp) => {
          resolve(resp);
        },
        (error) => {
          reject(error.status);
        },
      );
    });
  }

  UpdateUsuario(id_usuario: number, value: Usuario) {
    const url = `${this.urlApi}/Usuarios/${id_usuario}`;
    let data = { ...value, id_usuario: id_usuario };
    return new Promise((resolve, reject) => {
      this.http.patch<Usuario>(url, data).subscribe(
        (resp) => {
          resolve(resp);
        },
        (error) => {
          reject(error.status);
        },
      );
    });
  }
}
