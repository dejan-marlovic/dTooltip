// Copyright (c) 2017, dmarl. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:html';
import 'dart:math';
import 'package:angular/angular.dart';

@Component(
    selector: 'd-navbar',
    styleUrls: const ['d_navbar.css'],
    templateUrl: 'd_navbar.html')
class NavbarComponent implements OnInit, AfterViewInit {
  NavbarComponent(this.host);

  @override
  void ngOnInit() {
    _parentElement = trackDocument ? document.body : host.parent;
    _parentElement.onScroll.listen((event) {
      if (alwaysShow)
        offset = 0;
      else {
        final deltaScrollY = _parentElement.scrollTop - _previousScrollY;
        offset = _clamp(offset + deltaScrollY, 0, height);
        _previousScrollY = _parentElement.scrollTop;
      }
    });
  }

  @override
  void ngAfterViewInit() {
    /**
     * Make sure nav doesn't overflow container scrollbar
     */
    final navContainer = host.querySelector('#navContainer');
    navContainer.style.width = '${_parentElement.clientWidth}px';
    window.onResize.listen((_) {
      navContainer.style.width = '${_parentElement.clientWidth}px';
    });
  }

  int _clamp(int value, int minimum, int maximum) =>
      max(minimum, min(maximum, value));

  bool get isTop =>
      (_parentElement == null) ? true : _parentElement.scrollTop == 0;
  int offset = 0;
  int _previousScrollY = 0;

  Element _parentElement;
  final Element host;

  @Input()
  String backgroundColor = 'white';

  @Input()
  int height = 100;

  @Input()
  bool alwaysShow = false;

  @Input()
  bool trackDocument = false;
}
