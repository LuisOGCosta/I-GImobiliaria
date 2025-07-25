import 'package:flutter/material.dart';

class ImovelWidget extends StatelessWidget {
  final String nome;
  final double preco;
  final String descricao;
  final String imagemUrl;
  final String localizacao;
  final bool financiamento;
  final VoidCallback onTap;

  const ImovelWidget({
    super.key,
    required this.nome,
    required this.preco,
    required this.descricao,
    required this.imagemUrl,
    required this.localizacao,
    required this.financiamento,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Image.network(imagemUrl, height: 200, fit: BoxFit.cover),
            ListTile(
              title: Text(nome, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(localizacao),
              trailing: Text(
                "R\$ ${preco.toStringAsFixed(2)}",
                style: const TextStyle(color: Colors.green, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
