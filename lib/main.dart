import 'package:flutter/material.dart';
import 'package:flutter/material.dart'; // Adicione este import para o DatePicker
import 'package:intl/intl.dart'; // Para formatação de data

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela com Menu Lateral',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTimeRange? selectedDateRange;

  Future<void> selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      initialDateRange: selectedDateRange,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDateRange) {
      setState(() {
        selectedDateRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Importa Dados', style: TextStyle(fontSize: 14)),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Importar Movimento'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Sugestão de Compra'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Cadastros'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Relatórios'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Controle de Acesso'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80, // Altura desejada
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Column(
                          children: [
                            Text('Período',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            GestureDetector(
                              onTap: () => selectDateRange(context),
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  selectedDateRange == null
                                      ? 'Selecione o período'
                                      : 'De: ${DateFormat('dd/MM/yyyy').format(selectedDateRange!.start)}\nAté: ${DateFormat('dd/MM/yyyy').format(selectedDateRange!.end)}',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  flex: 2, // Aumenta a largura do cliente
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Selecionar Cliente',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Digite o nome do cliente',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 6), // Espaço entre o TextField e o botão
                Expanded(
                  flex: 1, // Largura do botão Filtro
                  child: ElevatedButton(
                    onPressed: () {
                      // Ação para filtro
                    },
                    child: Text('Filtro'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Ação para importar
                  },
                  child: Text('Importa'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Cor de fundo azul
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
