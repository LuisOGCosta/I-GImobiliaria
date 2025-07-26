import 'package:flutter/material.dart';
import 'widgets/imovel_widget.dart';
import 'widgets/login_widget.dart';

void main() {
  runApp(const IgorGaldinoApp());
}

class IgorGaldinoApp extends StatelessWidget {
  const IgorGaldinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Igor&Galdino Imobiliária',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginPage(),
    );
  }
}
