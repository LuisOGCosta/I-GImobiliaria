import 'package:atividade3/widgets/financiamento_widget.dart';
import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  final List<Map<String, dynamic>> casas = const [
    {
      "nome": "Casa com Piscina, 5 suites e 3 closet",
      "preco": 150000,
      "descricaoBreve" : "Espaçoso e bem localizado, com varanda gourmet.",
      "descricao": "\n •Casa contemporânea à venda com arquitetura sofisticada e fachada moderna.\n •Ambientes amplos, envidraçados e integrados à área externa, com destaque para o uso de esquadrias de vidro do piso ao teto.\n •Piscina elegante com deck em cerâmica e paisagismo tropical ao redor, proporcionando sensação de lazer e tranquilidade.\n •Conta com palmeiras e vegetação ornamental que valorizam o jardim frontal e lateral da casa.\n •Garagem coberta e acabamento externo em tons neutros com detalhes em madeira e concreto aparente.\n •Localizada em condomínio fechado de alto padrão, oferecendo segurança, privacidade e conforto para toda a família.\n Agende uma visita!",
      "imagem": 'img/casade15milha.png',
      "local": "Nova Lima - MG",
      "financiamento": true,
    },
    {
      "nome": "Casa grande com quintal, 4 quartos e \n uma suites",
      "preco": 5000000,
      "descricaoBreve": "Alto padrão, área gourmet e piscina aquecida.",
      "descricao": "\n •Casa contemporânea à venda com fachada imponente. \n •Design minimalista e acabamento sofisticado. Conta com linhas retas, amplas esquadrias de vidro \n •Jardim com paisagismo tropical e escada de entrada elegante. \n •Possui garagem coberta. \n •Ambientes integrados e fachada com detalhes em madeira natural. \n •Localizada em condomínio de alto padrão, em uma região segura e tranquila, ideal para quem busca modernidade, conforto e exclusividade. \n Agende uma visita!",
      "imagem": 'img/casade5milha.jpg',
      "local": "Nova Lima - MG",
      "financiamento": true,
    },
    {
      "nome": "Casa com quintal e 3 quartos",
      "preco": 2000000,
      "descricaoBreve" : "Localizada no vale do mutuca no condominio vila castela",
      "descricao": "\n•Casa moderna à venda, estilo e conforto em um só lugar.\n •Design contemporâneo com acabamento em madeira e  concreto.\n •Garagem coberta para até 3 carros. \n •Varanda espaçosa no andar superior. \n Jardim frontal com paisagismo e espaços amplos e bem iluminados. \n •Localizada em um bairro tranquilo e valorizado, próxima a comércios, escolas e vias de acesso. Perfeita para morar com conforto e estilo. \n Agende uma visita!",
      "imagem": 'img/casade2milha.jpg',
      "local": "Nova Lima - MG",
      "financiamento": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    //final formatador = NumberFormat.currency(locale: "pt_BR", symbol: "R\$");
  //String valorFormatado = formatador.format(valor);
    return Scaffold(
      appBar: AppBar(title: const Text('Imóveis em Nova Lima - Minas Gerais')),
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
                'Preço: R\$ ${casa['preco']}\n'
                'Descrição: ${casa['descricaoBreve']}',
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
      body:SingleChildScrollView(
        child: Padding(
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
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('Descrição: ${casa['descricao']}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 30),

            //Botão de comprar
           ElevatedButton(
  onPressed: () {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Essa opção não está disponivel!'),
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        duration: Duration(seconds: 2),
      ),
    );
  },
  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
  child: const Text('Comprar'),
),
const SizedBox(height: 10),
            //Botão de Financiamento 
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FinanciamentoWidget(casa: casa),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              child: const Text('Financiar'),
            )
          ],
        ),
      ),
      ) 
    );
  }
}
