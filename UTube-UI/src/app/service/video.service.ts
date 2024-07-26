import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { catchError, Observable } from 'rxjs';
import { VideoPayload } from '../models/video-payload.model';
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

  /** POST: add a new hero to the database */
  postVideo(videoPayload: VideoPayload): Observable<Video> {
    return this.http.post<Video>(this.baseUrl + "/api/Videos", videoPayload)
  }
  
  handleError(): (err: any, caught: Observable<Video>) => import("rxjs").ObservableInput<any> {
    throw new Error('Method not implemented.');
  }

}
