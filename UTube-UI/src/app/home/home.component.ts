import { AfterViewInit, Component } from '@angular/core';
import { Video } from '../models/video.model';
import { VideoService } from '../service/video.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss'
})
export class HomeComponent implements AfterViewInit {
  videos: Video[] = []

  constructor(private videoService: VideoService) {}

  ngAfterViewInit(): void {
    this.videoService.getVideos()
    .subscribe(data => 
        this.videos = data
      );

  }
}

