import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        url: 'api/timezone/Europe/London',
        location: 'London',
        flag: 'egypt.png'),
    WorldTime(
        url: 'api/timezone/Europe/Berlin',
        location: 'Athens',
        flag: 'egypt.png'),
    WorldTime(
        url: 'api/timezone/Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(
        url: 'api/timezone/Africa/Nairobi',
        location: 'Nairobi',
        flag: 'egypt.png'),
    WorldTime(
        url: 'api/timezone/America/Chicago',
        location: 'Chicago',
        flag: 'egypt.png'),
    WorldTime(
        url: 'api/timezone/America/New_York',
        location: 'New York',
        flag: 'egypt.png'),
    WorldTime(
        url: 'api/timezone/Asia/Seoul', location: 'Seoul', flag: 'egypt.png'),
    WorldTime(
        url: 'api/timezone/Asia/Jakarta',
        location: 'Jakarta',
        flag: 'egypt.png'),
  ];

  void updateTime(index) async {
    WorldTime timeInstance = locations[index];
    await timeInstance.getTime();
    //Navigate to home page
    Navigator.pop(context, {
      'location': timeInstance.location,
      'flag': timeInstance.flag,
      'time': timeInstance.time,
      'isDayTime': timeInstance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(
                  locations[index].location,
                  style: TextStyle(
                    color: Colors.blue[500],
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
