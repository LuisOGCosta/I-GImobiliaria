
import 'package:atividade3/widgets/produtos.dart';
import 'package:flutter/material.dart';

class JogoWidget extends Produtos {
  final String genero; // Ex: Ação, RPG, Corrida, etc.

  const JogoWidget({
    Key? key,
    required this.genero,
    required nome,
    required preco,
    required desc,
    required imagemURl,
    required onTap,
  }) : super(
          key: key,
          nome: nome,
          preco: preco,
          desc: desc,
          imagemURl: imagemURl,
          onTap: onTap,
        );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
        child: Container(
          height: 204,
          width: 400,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.teal[800],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imagemURl,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 100),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      nome,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      desc,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "R\$ ${preco.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Gênero: $genero",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}