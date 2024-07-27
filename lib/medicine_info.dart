import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'device_settings.dart';
import 'device_settings_screen.dart'; // Make sure to import the DeviceSettingsScreen

class AddMedicineInfoPage extends StatefulWidget {
  @override
  _AddMedicineInfoPageState createState() => _AddMedicineInfoPageState();
}

class _AddMedicineInfoPageState extends State<AddMedicineInfoPage> {
  List<Widget> _alarmWidgets = [];
  final _timeDoseControllers = <TextEditingController>[];

  // State variable to track the selected frequency
  String _selectedFrequency = 'Daily';

  @override
  void initState() {
    super.initState();
    _addAlarmWidget();
  }

  void _addAlarmWidget() {
    final timeDoseController = TextEditingController(text: '08:00                                                 5 ml');
    _timeDoseControllers.add(timeDoseController);

    setState(() {
      _alarmWidgets.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Set time & dose',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: timeDoseController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  void _onNextPressed() {
    // Handle "Next" button click here
    for (var i = 0; i < _timeDoseControllers.length; i++) {
      print('Alarm ${i + 1} - Time & Dose: ${_timeDoseControllers[i].text}');
    }

    // Navigate to the DeviceSettingsScreen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DeviceSettingsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Add Medicine Info'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _onNextPressed,
            child: Text(
              'Next',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 18.0, // Adjust the font size as needed
                fontWeight: FontWeight.bold, // Optional: to make the text bold
              ),
            ),
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Adjust the padding as needed
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Medicine name',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'enter name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text('Frequency'),
              RadioListTile(
                value: 'Daily',
                groupValue: _selectedFrequency,
                onChanged: (value) {
                  setState(() {
                    _selectedFrequency = value!;
                  });
                },
                title: Text('Daily'),
                activeColor: Colors.lightBlueAccent,
              ),
              RadioListTile(
                value: 'Specific days',
                groupValue: _selectedFrequency,
                onChanged: (value) {
                  setState(() {
                    _selectedFrequency = value!;
                  });
                },
                title: Text('Specific days'),
                activeColor: Colors.lightBlueAccent,
              ),
              RadioListTile(
                value: 'Interval',
                groupValue: _selectedFrequency,
                onChanged: (value) {
                  setState(() {
                    _selectedFrequency = value!;
                  });
                },
                title: Text('Interval'),
                activeColor: Colors.lightBlueAccent,
              ),
              RadioListTile(
                value: 'As needed',
                groupValue: _selectedFrequency,
                onChanged: (value) {
                  setState(() {
                    _selectedFrequency = value!;
                  });
                },
                title: Text('As needed'),
                activeColor: Colors.lightBlueAccent,
              ),
              SizedBox(height: 16.0),
              ..._alarmWidgets,
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.center, // Adjust alignment as needed
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0), // Adjust the value as needed
                  child: TextButton.icon(
                    onPressed: _addAlarmWidget,
                    icon: Icon(Icons.add, color: Colors.lightBlueAccent),
                    label: Text('Add more alarm'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.lightBlueAccent, // Text and icon color
                      backgroundColor: Colors.white, // Button background color
                      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _timeDoseControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
