import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Video } from '../models/video.model';

@Injectable({
  providedIn: 'root'
})
export class VideoService {

  baseUrl = "https://localhost:7092"

  constructor(private http: HttpClient) { }

  getVideos() {
    return this.http.get<Video[]>(this.baseUrl + "/api/Videos");
  }

}
