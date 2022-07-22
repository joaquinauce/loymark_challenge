import { NgModule } from '@angular/core';
import { CommonModule, DatePipe } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { MainRoutingModule } from './main-routing.module';
import { HttpClientModule } from '@angular/common/http';

import { ToastrModule } from 'ngx-toastr';




@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    MainRoutingModule,
    ReactiveFormsModule,
    HttpClientModule,
    ToastrModule.forRoot(),
    FormsModule
  ],
  exports:[
    ReactiveFormsModule
  ],
  providers: [DatePipe],
})
export class MainModule { }
