import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool valueSwitch = false;

  @override
  void initState() {
    loadValueSwitch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ItemSettings(
            title: 'Save login data',
            icon: Icons.account_circle_outlined,
            trailing: Switch(
              value: valueSwitch,
              activeColor: Colors.pinkAccent,
              onChanged: (bool value) {
                setState(
                  () {
                    valueSwitch = value;
                    saveValueSwitch();
                  },
                );
              },
            ),
          ),
          ItemSettingsButton(
            title: 'Clear login credentials',
            icon: Icons.delete_outline,
            onTapFunction: () => popupClearCredentials(context),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                "Log out",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void saveValueSwitch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isRemembered', valueSwitch);
  }

  Future<void> loadValueSwitch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      valueSwitch = prefs.getBool('isRemembered') ?? false;
    });
  }
}

class ItemSettings extends StatefulWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;

  const ItemSettings({
    super.key,
    required this.title,
    required this.icon,
    this.trailing,
  });

  @override
  State<ItemSettings> createState() => _ItemSettingsState();
}

class _ItemSettingsState extends State<ItemSettings> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: [
            Icon(widget.icon, size: 24.0),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                widget.title,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            if (widget.trailing != null) widget.trailing!,
          ],
        ),
      ),
    );
  }
}

class ItemSettingsButton extends StatefulWidget {
  const ItemSettingsButton(
      {super.key,
      required this.title,
      required this.icon,
      this.trailing,
      required this.onTapFunction});

  final String title;
  final IconData icon;
  final Widget? trailing;
  final Function onTapFunction;

  @override
  State<ItemSettingsButton> createState() => _ItemSettingsButtonState();
}

class _ItemSettingsButtonState extends State<ItemSettingsButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            children: [
              Icon(widget.icon, size: 24.0),
              const SizedBox(width: 10.0),
              Expanded(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              if (widget.trailing != null) widget.trailing!,
            ],
          ),
        ),
      ),
      onTap: () {
        widget.onTapFunction();
      },
    );
  }
}

Future<void> popupClearCredentials(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Clear credentials'),
        content: const Text(
          'Are you sure you want to clear the login credentials? This action cannot be undone.',
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(),
            child: const Text(
              'Accept',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              clearCredentials();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(),
            child: const Text(
              'Cancel',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> clearCredentials() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('Username');
  await prefs.remove('Password');
}
