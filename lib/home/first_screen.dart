import 'package:panorama/panorama.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  double _lon = 0;
  double _lat = 0;
  double _tilt = 0;
  int _panoId = 0;
  List<Image> panoImages = [
    Image.asset('assets/image/first.jpeg'),
    Image.asset('assets/image/second.jpeg'),
    Image.asset('assets/image/third.jpeg'),
    Image.asset('assets/image/fourth.jpeg'),
    //тут не все фотки нужны, закинул все, чтобы ты потом чекнул и убрал ненужные
    Image.asset('assets/image/fifth.jpeg'),
    Image.asset('assets/image/sixth.jpeg'),
    Image.asset('assets/image/seventh.jpeg'),
    Image.asset('assets/image/eight.jpeg'),
    Image.asset('assets/image/nine.jpeg'),
    Image.asset('assets/image/ten.jpeg'),
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
            shape: MaterialStateProperty.all(const CircleBorder()),
            backgroundColor: MaterialStateProperty.all(Colors.black38),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: onPressed,
          child: Icon(icon),
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
      case 0: //когда меняшь _panoId чекни чтобы они совпали с case
        panorama = Panorama(
          animSpeed: 1,
          sensitivity: 1,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          onLongPressStart: (longitude, latitude, tilt) =>
              print('onLongPressStart: $longitude, $latitude, $tilt'),
          onLongPressMoveUpdate: (longitude, latitude, tilt) =>
              print('onLongPressMoveUpdate: $longitude, $latitude, $tilt'),
          onLongPressEnd: (longitude, latitude, tilt) =>
              print('onLongPressEnd: $longitude, $latitude, $tilt'),
          hotspots: [
            Hotspot(
              latitude: -15.0,
              longitude: -129.0,
              width: 90,
              height: 75,
              widget: hotspotButton(
                text: "Next scene",
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  setState(() =>
                      _panoId++); //_panoId = номер фотки, чекни строку 105


                },
              ),
            ),
            Hotspot(
              latitude: -42.0,
              longitude: -46.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  setState(() => _panoId = 2); //тут есть такие _panoId, они нужны чтобы переключаться между картинками, тут они просто 1 добавляют, а нам надо чтобы конкретная картинка была, вот их надо будет расставить по местам
                  //тут картинки _panoId нужен чтобы в массиве переключать картинки, массив на строке 17



                },
              ),
            ),
            Hotspot(
              latitude: -33.0,
              longitude: 123.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                  icon: Icons.arrow_upward_outlined,
                  onPressed: () {
                    //   Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return SecondScreen(); //тут должен быть экран фотки
                    //     },
                    //   ),
                    // );   я хз мб тут этого не надо
                  }),
            ),
          ],
          child: Image.asset('assets/image/second.jpeg'), //фотку поменять
        );
        break;
      case 2: //когда меняшь _panoId чекни чтобы они совпали с case
        panorama = Panorama(
          animSpeed: 1.0,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          croppedArea: const Rect.fromLTWH(2533.0, 1265.0, 5065.0, 2533.0),
          croppedFullWidth: 10132.0,
          croppedFullHeight: 5066.0,
          hotspots: [
            Hotspot(
              latitude: 0.0,
              longitude: -46.0,
              width: 90.0,
              height: 75.0,
              widget: hotspotButton(
                text: "Next scene",
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  setState(() =>
                      _panoId++); //_panoId = номер фотки, чекни строку 105

                },
              ),
            ),
          ],
          child: Image.asset('assets/image/third.jpeg'), //фотку поменять
        );
        break;
      default:
        panorama = Panorama(
          animSpeed: 1.0,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          hotspots: [
            Hotspot(
              latitude: 0.0,
              longitude: 160.0,
              width: 90.0,
              height: 75.0,
              widget: hotspotButton(
                text: "Next scene",
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  setState(() =>
                      _panoId++); //_panoId = номер фотки, чекни строку 105

                },
              ),
            ),
          ],
          child: panoImages[_panoId %
              panoImages.length], //_panoId = номер фотки, чекни строку 105
        );
    }
    return Scaffold(
      body: Stack(
        children: [
          panorama,
          Text(
              '${_lon.toStringAsFixed(3)}, ${_lat.toStringAsFixed(3)}, ${_tilt.toStringAsFixed(3)}'),
        ],
      ),
    );
  }
}
