import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Category } from '../models/category.model';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {

  baseUrl = "https://localhost:7092"

  constructor(private http: HttpClient) { }

  getCategories(){
    return this.http.get<Category[]>(this.baseUrl + "/api/Categories")
  }
}
