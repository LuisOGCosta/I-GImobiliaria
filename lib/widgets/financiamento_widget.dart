import 'imovel_widget.dart';
import 'package:flutter/material.dart';

class FinanciamentoWidget extends StatefulWidget {
  final Map<String, dynamic> casa;
  const FinanciamentoWidget({super.key, required this.casa});

  @override
  State<FinanciamentoWidget> createState() => _FinanciamentoWidgetState();
}

class _FinanciamentoWidgetState extends State<FinanciamentoWidget> {
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("I&G Imobiliaria Financiamento",style: TextStyle(fontSize: 18),),),
    );
  }
}