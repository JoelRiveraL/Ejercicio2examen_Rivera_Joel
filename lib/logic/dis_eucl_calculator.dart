import 'dart:math';

class DistanceCalculator {
  final double distance;

  DistanceCalculator({required this.distance});

  @override
  String toString() {
    return 'Distance: ${distance.toStringAsFixed(2)}';
  }

  DistanceCalculator calculateDistance(int x1, int y1, int x2, int y2) {
    double result = _euclideanDistance(x1, y1, x2, y2);
    return DistanceCalculator(distance: result);
  }

  double _euclideanDistance(int x1, int y1, int x2, int y2) {
    x1 = x1 - x2;
    y1 = y1 - y2;
    return sqrt((x1 * x1) + (y1 * y1));
  }
}
