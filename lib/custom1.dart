import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';

class Custom1 extends StatelessWidget {
 late double l;
 late  double k;

 late double x;
 late String a;
 late double y;
 late String b;

 late  double s;
 late  String c;
 late double m;
 late String d;

 late  double f;
 late String g;
 late double t;
 late String h;

 late double r;
 late String i;
 late double e;
 late String j;

 late  double o;
 late String n;
 late double p;
 late String u;


  Custom1(this.l, this.k, this.x, this.y, this.a, this.b,
      this.s, this.m, this.c, this.d, this.f, this.t, this.g, this.h,
      this.r, this.e, this.i, this.j, this.o, this.p, this.n, this.u,
      ) {
    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      throw UnimplementedError();
    }
  }

  Widget build(BuildContext context) {
    return


      Container(
        child: GoogleMap(
          onMapCreated: (h) {},
          initialCameraPosition: CameraPosition(
              target: LatLng(l, k), zoom: 10.0),
          markers: {
            Marker(markerId: MarkerId(""), position: LatLng(x, y),
                infoWindow: InfoWindow(title: a, snippet: b),
                icon: BitmapDescriptor.defaultMarker),
            Marker(markerId: MarkerId(""), position: LatLng(s, m),
                infoWindow: InfoWindow(title: c, snippet: d),
                icon: BitmapDescriptor.defaultMarker),
            Marker(markerId: MarkerId(""), position: LatLng(f, t),
                infoWindow: InfoWindow(title: g, snippet: h),
                icon: BitmapDescriptor.defaultMarker),
            Marker(markerId: MarkerId(""), position: LatLng(r, e),
                infoWindow: InfoWindow(title: i, snippet: j),
                icon: BitmapDescriptor.defaultMarker),
            Marker(markerId: MarkerId(""), position: LatLng(o, p),
                infoWindow: InfoWindow(title: n, snippet: u),
                icon: BitmapDescriptor.defaultMarker),
          },),);
  }
}