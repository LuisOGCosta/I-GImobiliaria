import 'package:flutter/material.dart';
import 'package:atividade3/screens/Detalhes.dart';
import 'package:atividade3/widgets/ImovelWidget.dart';

void main() {
  runApp(const ImobiliariaApp());
}

class ImobiliariaApp extends StatelessWidget {
  const ImobiliariaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'G&I Imobiliária',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> imoveis = const [
    {
      "nome": "Casa com Piscina 5 suites e 3 closet",
      "preco": 150000.00,
      "descricao": "Espaçoso e bem localizado, com varanda gourmet.",
      "imagem":'img/casade15milha.png',
      "localizacao": "Nova Lima - MG",
      "financiamento": true,
    },
    {
      "nome": "Casa grande com quintal e 4 quartos e uma suites",
      "preco": 5000000.00,
      "descricao": "Alto padrão, área gourmet e piscina aquecida.",
      "imagem":'img/casade5milha.jpg',
      "localizacao": "Nova Lima - MG",
      "financiamento": true,
    },
    {
      "nome": "Casa com quintal e 3 quartos",
      "preco": 2000000.00,
      "descricao": "Localizada no vale do mutuca no condominio vila castela",
      "imagem":'img/casade2milha.jpg',
      "localizacao": "Nova Lima - MG",
      "financiamento": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("G&I Imobiliária"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: imoveis.length,
        itemBuilder: (context, index) {
          final imovel = imoveis[index];
          return ImovelWidget(
            nome: imovel['nome'],
            preco: imovel['preco'],
            descricao: imovel['descricao'],
            imagemUrl: imovel['imagem'],
            localizacao: imovel['localizacao'],
            financiamento: imovel['financiamento'],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Detalhes(
                    nome: imovel['nome'],
                    preco: imovel['preco'],
                    descricao: imovel['descricao'],
                    imagemUrl: imovel['imagem'],
                    localizacao: imovel['localizacao'],
                    financiamento: imovel['financiamento'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}