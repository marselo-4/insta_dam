import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? _selectedList = "Lorem";
  bool? valueBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: const EdgeInsets.all(16), children: [
        ItemSettings(
          title: 'Save login data',
          icon: Icons.account_circle,
          trailing: Checkbox(value: valueBox, onChanged: (bool? value) {setState(() {
            valueBox = value;
          });}  ),
        ),
        ItemSettings(
          title: 'Lorem',
          icon: Icons.font_download,
          trailing: DropdownButton<String>(
            value: _selectedList,
            items: const [
              DropdownMenuItem(
                value: "Lorem",
                child: Text("Lorem"),
              ),
              DropdownMenuItem(
                value: "Lorem 2",
                child: Text("Lorem 2"),
              ),
            ],
            onChanged: (String? newValue) {
              setState(() {
                _selectedList = newValue;
              });
            },
          ),
        ),
         ItemSettings(
          title: 'Lorem',
          icon: Icons.login,
          trailing: Checkbox(value: valueBox, onChanged: (bool? value) {setState(() {
            valueBox = value;
          });}  ),
        ),
        ItemSettings(
          title: 'Lorem',
          icon: Icons.font_download,
          trailing: DropdownButton<String>(
            value: _selectedList,
            items: const [
              DropdownMenuItem(
                value: "Lorem",
                child: Text("Lorem"),
              ),
              DropdownMenuItem(
                value: "Lorem 2",
                child: Text("Lorem 2"),
              ),
            ],
            onChanged: (String? newValue) {
              setState(() {
                _selectedList = newValue;
              });
            },
          ),
        ),
         ItemSettings(
          title: 'Lorem',
          icon: Icons.login,
          trailing: Checkbox(value: valueBox, onChanged: (bool? value) {setState(() {
            valueBox = value;
          });}  ),
        ),
        ItemSettings(
          title: 'Lorem',
          icon: Icons.font_download,
          trailing: DropdownButton<String>(
            value: _selectedList,
            items: const [
              DropdownMenuItem(
                value: "Lorem",
                child: Text("Lorem"),
              ),
              DropdownMenuItem(
                value: "Lorem 2",
                child: Text("Lorem 2"),
              ),
            ],
            onChanged: (String? newValue) {
              setState(() {
                _selectedList = newValue;
              });
            },
          ),
        ),

         ItemSettings(
          title: 'Lorem',
          icon: Icons.login,
          trailing: Checkbox(value: valueBox, onChanged: (bool? value) {setState(() {
            valueBox = value;
          });}  ),
        ),
    
         ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 248, 34, 19),
              foregroundColor:  Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Text("Log out", style: TextStyle(fontSize: 18),),
          ),
      ]),
    );
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Icon(widget.icon, size: 24.0), 
          const SizedBox(width: 10.0), 
          Expanded(
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          if (widget.trailing != null) widget.trailing!,
        ],
      ),
    );
  }
}
// TODO: Chechlist config ( Save LogIn data --> Mostrarlos en el login = autocomplete)
// TODO: Fe us de persistencia per guardar aquesta llista
// Boton de Salir --> Login
// Conté un cheklist que com a mínim mostra una opció de configuració: guardar dades
// d’inici de sessió.
// Aquí aplicareu la persistència de dades. Aquestes dades cal guardar-les localment
// fent ús del paquet shared_preferences.
//I després mostrar les dades guardades a l’obrir l’app a la pantalla log-in. 
//Conté un botó per sortir de la sessió de l’usuari que el retorna directament a la pantalla log-in.
