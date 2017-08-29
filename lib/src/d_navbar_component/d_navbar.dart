// Copyright (c) 2017, dmarl. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:angular/angular.dart';
import 'dart:html';
import 'dart:math';
@Component(
  selector: 'd-navbar',
  styleUrls: const ['d_navbar.css'],
  templateUrl: 'd_navbar.html',
)
class dNavbarComponent implements OnChanges
{
  dNavbarComponent()
  {
    window.document.querySelector("body").style.paddingTop = "${height}px";
    window.onScroll.listen((event)
    {
      if (alwaysShow) offset = 0;
      else 
      {
        int deltaScrollY = window.scrollY - _previousScrollY;
        offset = _clamp(offset + deltaScrollY, 0, height);
        _previousScrollY = window.scrollY;
      }      
    });
  }

  void ngOnChanges(Map<String, SimpleChange> changes)
  {
    if (changes.containsKey("height"))
    {
      window.document.querySelector("body").style.paddingTop = "${height}px";
    }
  }
  int _clamp(int value, int minimum, int maximum)
  {
    return max(minimum, min(maximum, value));
  }

  bool get isTop => window.scrollY == 0;

  int offset = 0;
  int _previousScrollY = 0;

  @Input('backgroundColor')
  String backgroundColor = "white";

  @Input('height')
  int height = 100;

  @Input('alwaysShow')
  bool alwaysShow = false;
}


