import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> casas = const [
    {
      "nome": "Casa com Piscina 5 suites e 3 closet",
      "preco": 150000.00,
      "descricao": "Espaçoso e bem localizado, com varanda gourmet.",
      "imagem": 'img/casade15milha.png',
      "localizacao": "Nova Lima - MG",
      "financiamento": true,
    },
    {
      "nome": "Casa grande com quintal e 4 quartos e \n uma suites",
      "preco": 5000000.00,
      "descricao": "Alto padrão, área gourmet e piscina aquecida.",
      "imagem": 'img/casade5milha.jpg',
      "localizacao": "Nova Lima - MG",
      "financiamento": true,
    },
    {
      "nome": "Casa com quintal e 3 quartos",
      "preco": 2000000.00,
      "descricao": "Localizada no vale do mutuca no condominio vila castela",
      "imagem": 'img/casade2milha.jpg',
      "local": "Nova Lima - MG",
      "financiamento": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Imóveis em Nova Lima')),
      body: ListView.builder(
        itemCount: casas.length,
        itemBuilder: (context, index) {
          final casa = casas[index];
          return Card(
            margin: const EdgeInsets.all(12),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Image.network(
                casa['imagem'],
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              title: Text(
                casa['nome'],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Local: ${casa['local']}\n'
                'Preço: R\$ ${casa['preco'].toStringAsFixed(2)}\n'
                'Descrição: ${casa['descricao']}',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetalheCasaPage(casa: casa),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetalheCasaPage extends StatelessWidget {
  final Map<String, dynamic> casa;

  const DetalheCasaPage({super.key, required this.casa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(casa['nome'])),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(
              casa['imagem'],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text('Localização: ${casa['local']}',
                style: const TextStyle(fontSize: 18)),
            Text('Preço: R\$ ${casa['preco'].toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Comprar'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              child: const Text('Financiar'),
            )
          ],
        ),
      ),
    );
  }
}
