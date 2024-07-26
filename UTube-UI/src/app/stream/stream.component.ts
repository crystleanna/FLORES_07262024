import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute, ParamMap } from '@angular/router';
import { of } from 'rxjs';
import { switchMap } from 'rxjs/operators';

@Component({
  selector: 'app-stream',
  templateUrl: './stream.component.html',
  styleUrl: './stream.component.scss'
})
export class StreamComponent implements OnInit {

  constructor(private route: ActivatedRoute) {}

  ngOnInit(): void {

    this.route.paramMap.pipe(
      switchMap((params: ParamMap) =>
        of(params.get('id'))
      )
    ).subscribe(d => 
      console.log("id: " + d));
  }

  jc() {

  }
}
