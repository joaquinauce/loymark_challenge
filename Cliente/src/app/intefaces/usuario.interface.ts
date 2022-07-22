import { Pais } from "./pais.interface"

export interface Usuario {
  id_usuario:number
  nombre: string
  apellido: string
  email: string
  fecha_nacimiento: Date
  telefono: string
  id_pais: number
  pais: Pais
  recibe_informacion: string
}
