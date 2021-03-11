import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // LOCATION NAME
  String time; // TIME IN LOCATION
  String url; // LOCATION URL API
  bool DayTime; //IS IT DAY TIME?


  WorldTime({this.location, this.url});

  Future <void> getTime() async {
  try {
    // MAKE REQUEST
    Response response = await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
    Map data = jsonDecode(response.body);

    String datetime = data["datetime"];
    String offset = data["utc_offset"].substring(1,3);
    // print(offset);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));


    DayTime = now.hour > 6 && now.hour < 18 ? true : false;
    time = DateFormat.jm().format(now);
  } catch (e) {
    print("Caught Error: $e");
    time= "Could not get Time Data";
  }
  }
}