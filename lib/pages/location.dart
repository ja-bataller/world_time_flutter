import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<WorldTime> locations =[
    WorldTime(url: "Asia/Manila", location: 'Manila'),
    WorldTime(url: "Asia/Seoul", location: 'Seoul'),
    WorldTime(url: "Asia/Tokyo", location: 'Tokyo'),
    WorldTime(url: "America/Toronto", location: 'Toronto'),
    WorldTime(url: "Europe/Paris", location: 'Paris'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    // NAVIGATE TO HOME SCREEN
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'DayTime': instance.DayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        title: Text("Choose Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].location),
            ),
          );
        }
      ),
    );
  }
}
