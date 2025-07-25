import 'package:flutter/material.dart';

class Detalhes extends StatelessWidget {
  final String nome;
  final double preco;
  final String descricao;
  final String imagemUrl;
  final String localizacao;
  final bool financiamento;

  const Detalhes({
    super.key,
    required this.nome,
    required this.preco,
    required this.descricao,
    required this.imagemUrl,
    required this.localizacao,
    required this.financiamento,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nome)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagemUrl),
            const SizedBox(height: 16),
            Text(
              nome,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              localizacao,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              "R\$ ${preco.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 22, color: Colors.green),
            ),
            const SizedBox(height: 16),
            Text(
              descricao,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              financiamento ? " Financiamento disponível" : " Financiamento não disponível",
              style: TextStyle(
                fontSize: 16,
                color: financiamento ? Colors.blueAccent : Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}