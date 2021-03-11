import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {

  //  void getLocation() async {
  //     // MAKE REQUEST
  //     Response response = await get(Uri.parse("https://worldtimeapi.org/api/timezone"));
  //     String data = response.body;
  //     print(data);
  //
  // }

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Manila', url: 'Asia/Manila');
    await instance.getTime();
    Navigator.pushNamed(context, "/home", arguments: {
      'location': instance.location,
      'time': instance.time,
      'DayTime': instance.DayTime,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
    // getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
          child: SpinKitChasingDots(
            color: Colors.teal[300],
            size: 100.0,
          ),
      ),
    );
  }
}
