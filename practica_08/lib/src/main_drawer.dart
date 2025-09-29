import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2024/05/16/20/36/warrior-8766954_1280.jpg'),
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 5.0),
                Text('Leonidas', style: TextStyle(fontSize: 22.0)),
                SizedBox(height: 5.0),
                Text('Rey de Esparta', style: TextStyle(fontSize: 16.0)),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person, color: Colors.black),
          title: Text('Perfil'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.inbox, color: Colors.black),
          title: Text('Mensajeria'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.assessment, color: Colors.black),
          title: Text('Dashboard'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.settings, color: Colors.black),
          title: Text('Configuracion'),
          onTap: () {},
        ),
      ],
    );
  }
}
