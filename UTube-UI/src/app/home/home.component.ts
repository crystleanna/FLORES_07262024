import { AfterViewInit, Component } from '@angular/core';
import { Video } from '../models/video.model';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss'
})
export class HomeComponent implements AfterViewInit {
  videos: Video[] = []

  ngAfterViewInit(): void {
    var sampleVideo = new Video()
    sampleVideo.id = 1
    sampleVideo.title = "Super Extra Long Title That Will Break The Layout"
    sampleVideo.description = "description"
    sampleVideo.thumbnail = "thumbnail"
    sampleVideo.url = "url"
    
    this.videos = [sampleVideo, sampleVideo, sampleVideo, sampleVideo]
  }
}

