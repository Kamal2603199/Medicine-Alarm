import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceScreen extends StatefulWidget {
  @override
  _DeviceSettingsScreenState createState() => _DeviceSettingsScreenState();
}

class _DeviceSettingsScreenState extends State<DeviceScreen> {
  String _selectedTune = 'Rooster';

  @override
  void initState() {
    super.initState();
    _loadSelectedTune();
  }

  _loadSelectedTune() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedTune = prefs.getString('selectedTune') ?? 'Rooster';
    });
  }

  _saveSelectedTune(String tune) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedTune', tune);
  }

  _selectTune() async {
    final String? selected = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectTuneScreen(selectedTune: _selectedTune)),
    );
    if (selected != null) {
      setState(() {
        _selectedTune = selected;
      });
      _saveSelectedTune(selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Device Settings'),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text('Alarm tune'),
              subtitle: Text(_selectedTune),
              onTap: _selectTune,
            ),
            // Add other settings widgets here
          ],
        ),
      ),
    );
  }
}

class SelectTuneScreen extends StatelessWidget {
  final String selectedTune;

  SelectTuneScreen({required this.selectedTune});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Tune'), centerTitle: true,
      ),
      body: ListView(
        children: [
          RadioListTile(
            title: Text('Chimes'),
            value: 'Chimes',
            groupValue: selectedTune,
            onChanged: (value) {
              Navigator.pop(context, value);
            },
          ),
          RadioListTile(
            title: Text('Rooster'),
            value: 'Rooster',
            groupValue: selectedTune,
            onChanged: (value) {
              Navigator.pop(context, value);
            },
          ),
          RadioListTile(
            title: Text('Sweet piano'),
            value: 'Sweet piano',
            groupValue: selectedTune,
            onChanged: (value) {
              Navigator.pop(context, value);
            },
          ),
        ],
      ),
    );
  }
}