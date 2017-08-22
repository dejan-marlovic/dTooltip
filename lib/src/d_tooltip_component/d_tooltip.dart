// Copyright (c) 2017, dmarl. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:angular2/core.dart';
import 'package:angular_components/angular_components.dart';

@Component(
    selector: 'd-tooltip',
    styleUrls: const ['d_tooltip.css'],
    templateUrl: 'd_tooltip.html',
    directives: const [materialDirectives]
)
class dTooltipComponent
{

  @Input('text')
  String text;

  @Input('glyph')
  String glyphName;
}