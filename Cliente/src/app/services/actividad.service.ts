import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ActividadService {

  private urlApi: string = environment.urlAPI;
  constructor(private http: HttpClient) { }

  GetActividades() {
    const url = `${this.urlApi}/Actividad`;
    return this.http.get<any>(url);
  }
}
