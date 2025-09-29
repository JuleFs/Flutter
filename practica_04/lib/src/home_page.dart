import 'package:flutter/material.dart';
import 'package:practica_04/src/datos_recibidos.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ctrlnom = new TextEditingController();
  final data = Data(texto: '', sexo: '');
  int _valor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[200],
        title: Text('Practica 04'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: ctrlnom,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: "Ingresa el nombre",
                contentPadding: EdgeInsets.all(20),
              ),
            ),
            SizedBox(height: 20),
            DropdownButton(
              value: _valor,
              items: [
                DropdownMenuItem(value: 1, child: Text('Mujer')),
                DropdownMenuItem(value: 2, child: Text('Hombre')),
              ],
              onChanged: (int? selected) {
                setState(() {
                  _valor = selected!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.deepOrange[200],
              ),
              child: Text("Enviar"),
              onPressed: () {
                setState(() {
                  data.texto = ctrlnom.text;

                  if (_valor == 1) {
                    data.sexo = 'Mujer';
                  } else {
                    data.sexo = 'Hombre';
                  }
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DatosPage(data: data),
                    ),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Data {
  String texto;
  String sexo;

  Data({required this.texto, required this.sexo});
}
