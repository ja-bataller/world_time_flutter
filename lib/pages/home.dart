import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    // SET BACKGROUND - DAY OR NIGHT
    String bgImage = data['DayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['DayTime'] ? Colors.white : Colors.grey[750];
    Color fontColor = data['DayTime'] ? Colors.grey[900] : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic result = await Navigator.pushNamed(context, '/location');
          setState(() {
            data = {
              'time': result['time'],
              'location': result['location'],
              'DayTime': result['DayTime'],
            };
          });
        },
        child: Icon(Icons.location_pin,
            color: Colors.grey[300]),
        backgroundColor: Colors.teal[300],
      ),
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
              child: Column(
                children: [
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 30.0,
                          letterSpacing: 2.0,
                            color: fontColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 70.0,
                      color: fontColor,
                    ),
                  ),
                ],
        ),
            ),
          )
      ),
    );
  }
}

