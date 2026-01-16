import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'data/movies.dart'; 

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<Map<String, dynamic>> pelis = List.from(movies);

  void onDismissed(int index, String action) {
    final itemEliminado = pelis[index];

    setState(() {
      pelis.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${itemEliminado['title_name']} - ¡Acción: $action!'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'DESHACER',
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              pelis.insert(index, itemEliminado);
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
        title: Text('Practica 17 - Dismissed'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
        itemCount: pelis.length,
        itemBuilder: (BuildContext context, int index) {
          final item = pelis[index];

          return Slidable(
            key: ValueKey(item['id']),

            // Acción para deslizar a la derecha (Agregar)
            startActionPane: ActionPane(
              motion: const DrawerMotion(),
              children: [
                SlidableAction( 
                  onPressed: (context) => onDismissed(index, 'Agregar'),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  icon: Icons.library_add,
                  label: 'Agregar',
                ),
              ],
            ),

           
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) => onDismissed(index, 'Eliminar'),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Eliminar',
                ),
              ],
            ),

            child: ListTile(
              title: Text(item['title_name']),
              subtitle: Text(item['Genres']),
            ),
          );
        },
      ),
    );
  }
}
