// main.dart
import 'package:flutter/material.dart';
import 'drawer_menu.dart'; // Certifique-se de que o caminho está correto

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo com Drawer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Importar dados'),
      ),
      drawer: DrawerMenu(), // Utiliza a classe DrawerMenu
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceAround, //dividindo o eixo da aplicação
        children: [
          Card(
            child: Row(
              children: [
                Column(
                  children: [
                    Text('Período',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
