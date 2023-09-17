class RgbClor{
  int get cntColors => 3;
  int get cntDiv => 256;
  double get leftLimit => 0;
  double get rightLimit => 255;
  final double? r;
  final double? b;
  final double? g;
  const RgbClor(this.r, this.g, this.b,);
}
class CmykClor{
  int get cntColors => 4;
  double get leftLimit => 0;
  int get cntDiv => 256;
  double get rightLimit => 255;
  final double? c;
  final double? m;
  final double? y;
  final double? k;
  const CmykClor(this.c, this.m, this.y, this.k);
}
class HsvClor{
  int get cntDiv => 100;
  int get cntColors => 3;
  double get leftLimit => 0;
  double get rightLimit => 1;
  final double? h;
  final double? s;
  final double? v;
  const HsvClor(this.h, this.s, this.v);
}
