import { Component, TemplateRef, ViewChild } from '@angular/core';
import { VideoPayload } from '../models/video-payload.model';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';


@Component({
  selector: 'app-upload',
  templateUrl: './upload.component.html',
  styleUrl: './upload.component.scss'
})
export class UploadComponent {
  video: VideoPayload = new VideoPayload()
  categories: string[] = ["Animals", "Bikes", "Dogs"]

  @ViewChild("newCategoryModal")
  modalContent?: TemplateRef<any>;

  hasTitleError = false
  hasDescError = false
  hasFileError = false

  tempCategory = ""

  constructor(private modalService: NgbModal) {}

  upload() {
    this.hasTitleError = false
    this.hasDescError = false
    this.hasFileError = false

    if (this.video.title == null || this.video.title == "") {
      this.hasTitleError = true
    }
    if (this.video.description == null || this.video.description == "") {
      this.hasDescError = true
    }
    if (this.video.file == null || this.video.file == "") {
      this.hasFileError = true
    }

    if (this.hasTitleError || this.hasDescError || this.hasFileError)
      return

      
    console.log('payload file:', this.video);
  }

  showNewCategoryDialog() {
    this.modalService.open(this.modalContent).result.then((result) => {
      this.video.category = null
    }, (reason) => {
      
    });
  }

  selectCategory(e: any) {
    console.log(e.target.value);
    if (e.target.value != "-") {
      this.video.category = e.target.value
    } else {
      this.video.category = null
    }
  }

  onFileSelected(event: any) {
    const file: File = event.target.files[0];
    console.log('Selected file:', file.name);

    const reader = new FileReader();
      reader.onload = (e: any) => {
        const base64String = e.target.result;        
        this.video.file = base64String;
        this.video.fileName = file.name;
      };
      reader.readAsDataURL(file);
  }

  saveCategory() {
    if (this.tempCategory != "") {
      this.categories.push(this.tempCategory)
      this.tempCategory = ""
      this.modalService.dismissAll()
    }
  }
}
