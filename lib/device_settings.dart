import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeviceSettingsScreen extends StatefulWidget {
  @override
  _DeviceSettingsScreenState createState() => _DeviceSettingsScreenState();
}

class _DeviceSettingsScreenState extends State<DeviceSettingsScreen> {
  bool setVacationTime = false;
  bool showMedsName = false;
  bool notifyPharma = false;
  bool addSorryTime = false;

  String alarmTune = 'Rooster';
  String alarmStrength = 'Louder';
  String snoozeDuration = '5mins';

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
        title: Text('Device settings'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(25.0),
              ),
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SwitchListTile(
                    title: Text('Set vacation time'),
                    value: setVacationTime,
                    activeColor: Colors.lightBlueAccent,
                    onChanged: (value) {
                      setState(() {
                        setVacationTime = value;
                      });
                    },
                  ),
                  if (setVacationTime) ...[
                    _buildDateTimePicker('Start date & time'),
                    _buildDateTimePicker('End date & time'),
                  ],
                ],
              ),
            ),
            SwitchListTile(
              title: Text('Show meds name'),
              value: showMedsName,
              activeColor: Colors.lightBlueAccent,
              onChanged: (value) {
                setState(() {
                  showMedsName = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Notify pharma to autofill'),
              value: notifyPharma,
              activeColor: Colors.lightBlueAccent,
              onChanged: (value) {
                setState(() {
                  notifyPharma = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Add sorry time'),
              value: addSorryTime,
              activeColor: Colors.lightBlueAccent,
              onChanged: (value) {
                setState(() {
                  addSorryTime = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Occupied cabinets', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('1, 2, 3, 4, 5', style: TextStyle(fontWeight: FontWeight.w300)),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text('Alarm settings', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAlarmSettingItem('Alarm tune', alarmTune, 'Tune'),
                  _buildAlarmSettingItem('Alarm strength', alarmStrength, 'Strength'),
                  _buildAlarmSettingItem('Snooze', snoozeDuration, 'Snooze'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateTimePicker(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'DD / MM / YYYY',
                ),
              ),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'HH: MM',
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.0),
      ],
    );
  }

  Widget _buildAlarmSettingItem(String label, String value, String settingType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        GestureDetector(
          onTap: () {
            _showAlarmSettingBottomSheet(context, settingType);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            margin: EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(value, style: TextStyle(fontSize: 16.0)),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showAlarmSettingBottomSheet(BuildContext context, String settingType) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(25.0),
          child: _buildAlarmSettingContent(settingType),
        );
      },
    );
  }

  Widget _buildAlarmSettingContent(String settingType) {
    switch (settingType) {
      case 'Tune':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select tune', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            _buildOption('Chimes', settingType),
            _buildOption('Rooster', settingType),
            _buildOption('Sweet piano', settingType),
          ],
        );
      case 'Strength':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select strength', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            _buildOption('Low', settingType),
            _buildOption('Medium', settingType),
            _buildOption('Louder', settingType),
          ],
        );
      case 'Snooze':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select snooze', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            _buildOption('5mins', settingType),
            _buildOption('10mins', settingType),
            _buildOption('15mins', settingType),
          ],
        );
      default:
        return Container();
    }
  }

  Widget _buildOption(String option, String settingType) {
    return ListTile(
      title: Text(option),
      onTap: () {
        setState(() {
          switch (settingType) {
            case 'Tune':
              alarmTune = option;
              break;
            case 'Strength':
              alarmStrength = option;
              break;
            case 'Snooze':
              snoozeDuration = option;
              break;
          }
        });
        Navigator.pop(context);
      },
    );
  }
}
