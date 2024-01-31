import 'package:smart_kid/main.dart';

extension Responsive on num {
  double get w {
    return (size.width / 360) * this;
  }

  double get h {
    return (size.height / 760) * this;
  }
}
