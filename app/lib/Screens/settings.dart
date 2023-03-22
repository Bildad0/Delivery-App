import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = "/settings";
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkModeEnabled = false;
  String _languageValue = 'English';
  double _fontScale = 1.0;

  Widget buildSwitchListTile(context, String title) {
    return SwitchListTile(
      title: Text(title),
      value: _darkModeEnabled,
      onChanged: (value) {
        setState(() {
          _darkModeEnabled = value;
        });
      },
    );
  }

  Widget buildListTile(context, String title) {
    return ListTile(
      title: Text(title),
      trailing: SizedBox(
        width: 200,
        height: 50,
        child: Slider(
          value: _fontScale,
          min: 0.5,
          max: 2.0,
          divisions: 3,
          onChanged: (value) {
            setState(() {
              _fontScale = value;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 5,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
          ),
        ),
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildSwitchListTile(context, 'Change Theme'),
                  const Divider(),
                  buildListTile(context, 'Font Scale'),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Language',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    DropdownButton<String>(
                      value: _languageValue,
                      onChanged: (String? value) {
                        setState(() {
                          _languageValue = value!;
                        });
                      },
                      items: <String>['English', 'Spanish', 'French', 'German']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
