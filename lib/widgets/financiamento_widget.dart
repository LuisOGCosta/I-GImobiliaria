import 'imovel_widget.dart';
import 'package:flutter/material.dart';

class FinanciamentoWidget extends StatefulWidget {
  final Map<String, dynamic> casa;

  const FinanciamentoWidget({super.key, required this.casa});

  @override
  State<FinanciamentoWidget> createState() => _FinanciamentoWidgetState();
}

class _FinanciamentoWidgetState extends State<FinanciamentoWidget> {
  final _entradaController = TextEditingController();
  final _prazoController = TextEditingController();

  String _resultado = '';

  void _calcularFinanciamento() {
    final double precoImovel = widget.casa['preco']?.toDouble() ;
    final double? entrada = double.tryParse(_entradaController.text);
    final int? prazo = int.tryParse(_prazoController.text);

    if (entrada == null || prazo == null || precoImovel <= 0) {
      setState(() {
        _resultado = 'Por favor, preencha todos os campos corretamente.';
      });
      return;
    }

    if (entrada >= precoImovel) {
      setState(() {
        _resultado = 'A entrada deve ser menor que o valor do imóvel.';
      });
      return;
    }

    double valorFinanciado = precoImovel - entrada;
    double parcelaBase = valorFinanciado / prazo;
    double parcelaFinal = parcelaBase + (valorFinanciado * 0.02); // 2% de juros fixo ao mês

    setState(() {
      _resultado =
          'Valor financiado: R\$ ${valorFinanciado.toStringAsFixed(2)}\n'
          'Parcela mensal: R\$ ${parcelaFinal.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    final nomeImovel = widget.casa['nome'] ?? 'Imóvel';
    final precoImovel = widget.casa['preco'] ;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "I&G Imobiliária - Financiamento",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nomeImovel,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Valor do imóvel: R\$ ${precoImovel}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            TextField(
              controller: _entradaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Valor da entrada (R\$)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            TextField(
              controller: _prazoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Prazo (em meses)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: _calcularFinanciamento,
              child: Text('Calcular Financiamento'),
            ),
            SizedBox(height: 20),

            Text(
              _resultado,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
