import 'package:flutter/material.dart';
import 'package:vietmap_flutter_gl/vietmap_flutter_gl.dart';

import 'constant.dart';
import 'page.dart';

class FullMapPage extends ExamplePage {
  FullMapPage() : super(const Icon(Icons.map), 'Full screen map');

  @override
  Widget build(BuildContext context) {
    return const FullMap();
  }
}

class FullMap extends StatefulWidget {
  const FullMap();

  @override
  State createState() => FullMapState();
}

class FullMapState extends State<FullMap> {
  VietmapController? mapController;
  var isLight = true;

  _onMapCreated(VietmapController controller) {
    mapController = controller;
  }

  _onStyleLoadedCallback() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Style loaded :)"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // needs different dark and light styles in this repo
        // floatingActionButton: Padding(
        // padding: const EdgeInsets.all(32.0),
        // child: FloatingActionButton(
        // child: Icon(Icons.swap_horiz),
        // onPressed: () => setState(
        // () => isLight = !isLight,
        // ),
        // ),
        // ),
        body: VietmapGL(
      onMapCreated: _onMapCreated,
      initialCameraPosition: const CameraPosition(target: LatLng(0.0, 0.0)),
      onStyleLoadedCallback: _onStyleLoadedCallback,
      myLocationRenderMode: MyLocationRenderMode.GPS,
      myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
      onUserLocationUpdated: (location) {
        print(location.latitude);
      },
      styleString: YOUR_STYLE_URL_HERE,
    ));
  }
}
