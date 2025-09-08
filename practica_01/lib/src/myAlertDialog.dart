import 'package:flutter/material.dart';

showAlertDialog(
  BuildContext context,
  String msg,
  String titulo,
  String botonOK,
  String botonCancel,
) {
  Widget botonCancelar = ElevatedButton(
    onPressed: () {},
    child: Text(botonCancel),
  );

  Widget btnOK = ElevatedButton(
    onPressed: () {
      Navigator.of(context).pop();
    },
    child: Text(botonOK),
  );

  AlertDialog alert = AlertDialog(
    title: Text(titulo),
    content: Text(msg),
    actions: [
      botonCancelar,
      btnOK,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
