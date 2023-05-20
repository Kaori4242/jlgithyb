import 'dart:io';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:math' as math;

import '../pages/food/app_icon.dart';

class FirstScreenN extends StatefulWidget {
  FirstScreenN({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreenN> {
  double _lon = 0;
  double _lat = 0;
  double _tilt = 0;
  int _panoId = 0;
  List<Image> panoImages = [
    Image.asset('assets/converted/oneone.jpg'),
    Image.asset('assets/converted/twotwo.jpg'),
    Image.asset('assets/converted/threethree.jpg'),
    Image.asset('assets/converted/fourfour.jpg'),
    Image.asset('assets/converted/fivefive.jpg'),
    Image.asset('assets/converted/sixsix.jpg'),
    Image.asset('assets/converted/sevenseven.jpg'),
    Image.asset('assets/converted/eighteight.jpg'),
    Image.asset('assets/converted/ninenine.jpg'),
    Image.asset('assets/converted/tenten.jpg'),

  ];
  ImagePicker picker = ImagePicker();

  void onViewChanged(longitude, latitude, tilt) {
    setState(() {
      _lon = longitude;
      _lat = latitude;
      _tilt = tilt;
    });
  }

  Widget hotspotButton(
      {String? text, IconData? icon, VoidCallback? onPressed}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(CircleBorder()),
            backgroundColor: MaterialStateProperty.all(Colors.black38),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: Icon(icon),
          onPressed: onPressed,
        ),
        text != null
            ? Container(
                padding: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Center(child: Text(text)),
              )
            : Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget panorama;
    switch (_panoId % panoImages.length) {
      case 0: //oneone
        panorama = Panorama(
          animSpeed: 0.01,
          sensitivity: 2,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: panoImages[0],
          hotspots: [
            Hotspot(
              latitude: -11.2,
              longitude: -163.0,
              width: 90,
              height: 75,
              widget: Transform.rotate(
                angle: 55 * math.pi / 180,
                child: hotspotButton(
                  icon: Icons.arrow_upward_outlined,
                  onPressed: () {
                    setState(() => _panoId = 1);
                    //_panoId = 1;
                    //dispose();
                  },
                ),
              ),
            ),
            Hotspot(
              latitude: -28.0,
              longitude: -50.0,
              width: 60.0,
              height: 60.0,
              widget: Transform.rotate(
                angle: -46 * math.pi / 180,
                child: hotspotButton(
                  icon: Icons.arrow_upward_outlined,
                  onPressed: () {
                    setState(() => _panoId = 2);
                    //_panoId = 2;
                    //dispose();
                  },
                ),
              ),
            ),
            Hotspot(
              latitude: -15.0,
              longitude: 8.0,
              width: 60.0,
              height: 60.0,
              widget: Transform.rotate(
                angle: -5 * math.pi / 180,
                child: hotspotButton(
                  icon: Icons.arrow_upward,
                  onPressed: () {
                    setState(() => _panoId = 1);
                    //_panoId = 1;
                    //dispose();
                  },
                ),
              ),
            ),
            Hotspot(
              latitude: -7.0,
              longitude: -179.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                  icon: Icons.arrow_outward_outlined, onPressed: () {}),
            ),
          ],
        );
        break;
      case 1: //twotwo
        panorama = Panorama(
          animSpeed: 0.01,
          sensitivity: 2,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: panoImages[1],
          hotspots: [
            Hotspot(
              latitude: -11.2,
              longitude: 176.0,
              width: 90,
              height: 75,
              widget: Transform.rotate(
                angle: 5 * math.pi / 180,
                child: hotspotButton(
                  icon: Icons.arrow_upward_outlined,
                  onPressed: () {
                    setState(() => _panoId = 0);
                    //_panoId = 0;
                    //dispose();
                  },
                ),
              ),
            ),
            Hotspot(
              latitude: -23.0,
              longitude: -94.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  setState(() => _panoId = 2);
                  //_panoId = 2;
                  //dispose();
                },
              ),
            ),
            Hotspot(
              latitude: -18.0,
              longitude: 10.0,
              width: 60.0,
              height: 60.0,
              widget: Transform.rotate(
                angle: 8 * math.pi / 180,
                child: hotspotButton(
                  icon: Icons.arrow_upward_outlined,
                  onPressed: () {
                    setState(() => _panoId = 4);
                    //_panoId = 4;
                    //dispose();
                  },
                ),
              ),
            ),
            Hotspot(
              latitude: -22.0,
              longitude: 59.0,
              width: 60.0,
              height: 60.0,
              widget: Transform.rotate(
                angle: 35 * math.pi / 180,
                child: hotspotButton(
                  icon: Icons.arrow_upward_outlined,
                  onPressed: () {
                    setState(() => _panoId = 3);
                    //_panoId = 3;
                    //dispose();
                  },
                ),
              ),
            ),
          ],
        );
        break;

      case 2: //threethree
        panorama = Panorama(
          animSpeed: 0.01,
          sensitivity: 2,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: panoImages[2],
          hotspots: [
            Hotspot(
              latitude: -11.2,
              longitude: 176.0,
              width: 90,
              height: 75,
              widget: Transform.rotate(
                angle: 8 * math.pi / 180,
                child: hotspotButton(
                  icon: Icons.arrow_upward_outlined,
                  onPressed: () {
                    setState(() => _panoId = 1);
                    //_panoId = 1;
                    //dispose();
                  },
                ),
              ),
            ),
          ],
        );
        break;
      case 3: //fourfour
        panorama = Panorama(
          animSpeed: 0.01,
          sensitivity: 2,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: panoImages[3],
          hotspots: [
            Hotspot(
              latitude: -23.0,
              longitude: -178.0,
              width: 60.0,
              height: 60.0,
              widget: Transform.rotate(
                angle: 15 * math.pi / 180,
                child: hotspotButton(
                  icon: Icons.arrow_upward,
                  onPressed: () {
                    setState(() => _panoId = 1);
                    //_panoId = 1;
                    //dispose();
                  },
                ),
              ),
            ),
          ],
        );
        break;
      case 4: //fivefive
        panorama = Panorama(
          sensitivity: 2,
          animSpeed: 0.01,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: panoImages[4],
          hotspots: [
            Hotspot(
              latitude: -11.2,
              longitude: 176.0,
              width: 90,
              height: 75,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  setState(() => _panoId = 1);
                  //_panoId = 1;
                  //dispose();
                },
              ),
            ),
            Hotspot(
              latitude: -18.0,
              longitude: 10.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                icon: Icons.arrow_upward,
                onPressed: () {
                  setState(() => _panoId = 5);
                  //_panoId = 5;
                  //dispose();
                },
              ),
            ),
          ],
        );
        break;

      case 5: //sixsix
        panorama = Panorama(
          animSpeed: 0.01,
          sensitivity: 2,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: panoImages[5],
          hotspots: [
            Hotspot(
              latitude: -15.2,
              longitude: -168.0,
              width: 90,
              height: 75,
              widget: hotspotButton(
                icon: Icons.arrow_outward_outlined,
                onPressed: () {
                  setState(() => _panoId = 4);
                  //_panoId = 4;
                  //dispose();
                },
              ),
            ),
            Hotspot(
              latitude: -17.0,
              longitude: 2.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                icon: Icons.arrow_upward,
                onPressed: () {
                  setState(() => _panoId = 6);
                  //_panoId = 6;
                  //dispose();
                },
              ),
            ),
          ],
        );
        break;
      case 6: //eighteight
        panorama = Panorama(
          animSpeed: 0.01,
          sensitivity: 2,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: panoImages[6],
          hotspots: [
            Hotspot(
              latitude: -17.2,
              longitude: 154.0,
              width: 90,
              height: 75,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  setState(() => _panoId = 5);
                  //_panoId = 5;
                  //dispose();
                },
              ),
            ),
            Hotspot(
              latitude: -24.0,
              longitude: -37.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                icon: Icons.arrow_upward,
                onPressed: () {
                  setState(() => _panoId = 8);
                  //_panoId = 8;
                  //dispose();
                },
              ),
            ),
            Hotspot(
              latitude: -40.0,
              longitude: 19.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                icon: Icons.arrow_outward_outlined,
                onPressed: () {
                  setState(() => _panoId = 7);
                  //_panoId = 7;
                  //dispose();
                },
              ),
            ),
          ],
        );
        break;
      case 7: //ninenine
        panorama = Panorama(
          animSpeed: 0.01,
          sensitivity: 2,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: panoImages[7],
          hotspots: [
            Hotspot(
              latitude: -60.2,
              longitude: -128.0,
              width: 90,
              height: 75,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  setState(() => _panoId = 6);
                  //_panoId = 6;
                  //dispose();
                },
              ),
            ),
            Hotspot(
              latitude: -13.2,
              longitude: 139.0,
              width: 90,
              height: 75,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  setState(() => _panoId = 5);
                  // _panoId = 5;
                  // dispose();
                },
              ),
            ),
          ],
        );
        break;
      case 8: //tenten
        panorama = Panorama(
          animSpeed: 0.01,
          sensitivity: 2,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: panoImages[8],
          hotspots: const [],
        );
        break;
      default:
        panorama = Panorama(
          animSpeed: 0.01,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: panoImages[_panoId % panoImages.length],
          hotspots: [
            Hotspot(
              latitude: 0.0,
              longitude: 160.0,
              width: 90.0,
              height: 75.0,
              widget: hotspotButton(
                text: "Next scene",
                icon: Icons.double_arrow,
                onPressed: () {},
              ),
            ),
          ],
        );
        break;
    }
    return Scaffold(

      body: Stack(
        children: [
          GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: AppIcon(icon: Icons.arrow_back_ios)),
          panorama,

        ],
      ),
    );
  }
}
