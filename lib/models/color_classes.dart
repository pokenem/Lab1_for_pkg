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
  int get cntDiv => 100;
  double get rightLimit => 100;
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
class HlsClor{
  int get cntDiv => 100;
  int get cntColors => 3;
  double get leftLimit => 0;
  double get rightLimit => 1;
  final double? h;
  final double? l;
  final double? s;
  const HlsClor(this.h, this.l, this.s);
}
class XyzClor{
  int get cntDiv => 100;
  int get cntColors => 3;
  double get leftLimit => 0;
  double get rightLimit => 1;
  final double? x;
  final double? y;
  final double? z;
  const XyzClor(this.x, this.y, this.z);
}
class LabClor{
  int get cntDiv => 100;
  int get cntColors => 3;
  double get leftLimit => 0;
  double get rightLimit => 1;
  final double? l;
  final double? a;
  final double? b;
  const LabClor(this.l, this.a, this.b);
}
