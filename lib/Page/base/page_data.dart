import 'package:flutter/foundation.dart';

class PageDada {
  final String title;
  final String route;
  PageDada(this.title, this.route);
}

mqPrint(Object? object) {
  if (kDebugMode) {
    print(object);
  }
}
