class RgbClor{
  int get cntColors => 3;
  int get cntDiv => 256;
  List<double> get leftLimit => [0,0,0];
  List<double> get rightLimit => [255,255,255];
  List<String> get names => ['R','G','B'];
  final double? r;
  final double? b;
  final double? g;
  const RgbClor(this.r, this.g, this.b,);
}
class CmykClor{
  int get cntColors => 4;
  List<double> get leftLimit => [0,0,0,0];
  int get cntDiv => 100;
  List<double> get rightLimit => [100,100,100,100];
  List<String> get names => ['C','M','Y','K'];
  final double? c;
  final double? m;
  final double? y;
  final double? k;
  const CmykClor(this.c, this.m, this.y, this.k);
}
class HsvClor{
  int get cntDiv => 360;
  int get cntColors => 3;
  List<double> get leftLimit => [0,0,0];
  List<double> get rightLimit => [360,1,1];
  List<String> get names => ['H','S',"V"];
  final double? h;
  final double? s;
  final double? v;
  const HsvClor(this.h, this.s, this.v);
}
class HlsClor{
  int get cntDiv => 360;
  int get cntColors => 3;
  List<double> get leftLimit => [0,0,0];
  List<double> get rightLimit => [360,100,100];
  List<String> get names => ['H','L',"S"];
  final double? h;
  final double? l;
  final double? s;
  const HlsClor(this.h, this.l, this.s);
}
class XyzClor{
  int get cntDiv => 100;
  int get cntColors => 3;
  List<double> get leftLimit => [0,0,0];
  List<double> get rightLimit => [100,100,100];
  List<String> get names => ['X','Y',"Z"];
  final double? x;
  final double? y;
  final double? z;
  const XyzClor(this.x, this.y, this.z);
}
class LabClor{
  int get cntDiv => 256;
  int get cntColors => 3;
  List<double> get leftLimit => [0,-128,-128];
  List<double> get rightLimit => [100,127,127];
  List<String> get names => ['L','A',"B"];
  final double? l;
  final double? a;
  final double? b;
  const LabClor(this.l, this.a, this.b);
}
