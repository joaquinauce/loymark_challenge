import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { PaisService } from 'src/app/services/pais.service';
import { UsuarioService } from 'src/app/services/usuario.service';
import { switchMap } from 'rxjs';
import { Usuario } from 'src/app/intefaces/usuario.interface';
import { DatePipe } from '@angular/common';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-usuario',
  templateUrl: './usuario.component.html',
  styleUrls: ['./usuario.component.css'],
})
export class UsuarioComponent implements OnInit {
  public paises: any[] = [];
  usuarios: Usuario[] = [];
  private _idUsuario: number = 0;
  textoBoton!: string;

  //Desactiva el boton aceptar
  disabled: boolean = false;

  emailPattern: string = '^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$';
  onlyLettersPattern: string = '[a-zA-Z ]*';

  formNewUser: FormGroup = this.fb.group({
    nombre: [
      '',
      [
        Validators.required,
        Validators.pattern(this.onlyLettersPattern),
        Validators.maxLength(100),
      ],
    ],
    apellido: [
      '',
      [
        Validators.required,
        Validators.pattern(this.onlyLettersPattern),
        Validators.maxLength(100),
      ],
    ],
    email: [
      '',
      [
        Validators.required,
        Validators.pattern(this.emailPattern),
        Validators.maxLength(100),
      ],
    ],
    telefono: ['', [Validators.pattern('^[0-9]*$'), Validators.maxLength(15)]],
    fecha_nacimiento: ['', Validators.required],
    recibe_informacion: [false],
    id_pais: [null, [Validators.required]],
  });

  constructor(
    private fb: FormBuilder,
    private usuarioService: UsuarioService,
    private paisService: PaisService,
    private router: Router,
    private activatedRoute: ActivatedRoute,
    private datePipe: DatePipe,
    private toastr: ToastrService
  ) {}
  ngOnInit(): void {
    this.llenarComboPaises();
    this.loadView();
  }

  loadView() {
    if (this.router.url.includes('edit')) {
      this.activatedRoute.params
        .pipe(switchMap(({ id }) => this.usuarioService.GetUsuarioById(id)))
        .subscribe(
          (usuario) => (
            this.formNewUser.patchValue(usuario),
            (this._idUsuario = usuario.id_usuario),
            (this.textoBoton = 'Editar'),
            this.formNewUser.controls['fecha_nacimiento'].setValue(
              this.datePipe.transform(usuario.fecha_nacimiento, 'yyyy-MM-dd')
            )
          )
        );

      return;
    }
    if (this.router.url.includes('view')) {
      this.activatedRoute.params
        .pipe(switchMap(({ id }) => this.usuarioService.GetUsuarioById(id)))
        .subscribe(
          (usuario) => (
            this.formNewUser.patchValue(usuario),
            this.formNewUser.disable(),
            this.formNewUser.controls['fecha_nacimiento'].setValue(
              this.datePipe.transform(usuario.fecha_nacimiento, 'yyyy-MM-dd')
            )
          )
        );
      // desactiva el boton aceptar
      this.disabled = true;
      return;
    }
    if (this.router.url.includes('new')) {
      this.textoBoton = 'Guardar';
      return;
    }
  }

  llenarComboPaises() {
    this.paisService.GetAllPaises().subscribe((paises) => {
      this.paises = paises;
    });
  }

  cancel() {
    this.router.navigateByUrl('');
  }

  guardarUsuario() {
    if (this.formNewUser.invalid) {
      this.formNewUser.markAllAsTouched();
      this.toastr.warning('Debe completar con todos los campos obligatorios');
      return;
    }

    if (this._idUsuario) {
      this.usuarioService
        .UpdateUsuario(this._idUsuario, this.formNewUser.value)
        .then((resp: any) => {
          this.toastr.success('Usuario actualizado correctamente', 'Usuario', {
            timeOut: 5000,
            closeButton: true,
          });
          this.router.navigateByUrl('');
        })
        .catch((err) => {
          if (err === 412) {
            this.toastr.error(
              'Ya existe un correo electronico identico',
              'Nuevo usuario',
              {
                timeOut: 3000,
                closeButton: true,
              }
            );
            return;
          }
          if (err === 500) {
            this.toastr.error('Error del lado del servidor', 'Nuevo usuario', {
              timeOut: 3000,
              closeButton: true,
            });
          }
        });
      return;
    }

    this.usuarioService
      .SaveUser(this.formNewUser.value)
      .then((usuario: any) => {
        this.toastr.success('Usuario creado correctamente', 'Nuevo usuario', {
          timeOut: 3000,
          closeButton: true,
        });
        this.router.navigateByUrl('');
      })
      .catch((err) => {
        if (err === 412) {
          this.toastr.error(
            'Ya existe un correo electronico identico',
            'Nuevo usuario',
            {
              timeOut: 3000,
              closeButton: true,
            }
          );
          return;
        }
        if (err === 500) {
          this.toastr.error('Error del lado del servidor', 'Nuevo usuario', {
            timeOut: 3000,
            closeButton: true,
          });
          return;
        }
      });
  }
}
