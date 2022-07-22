import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class PaisService {

  private urlApi: string = environment.urlAPI;
  constructor(private http: HttpClient) { }

  GetAllPaises(): Observable<any> {
    const url = `${this.urlApi}/Pais`;
    return this.http.get<any>(url);
  }

}
