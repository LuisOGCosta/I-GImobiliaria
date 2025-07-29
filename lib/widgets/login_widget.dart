import 'package:flutter/material.dart';
import 'imovel_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


/*  Transformamos LoginPage em StatefulWidget
Isso permite usar TextEditingController para acessar o conteúdo dos campos de texto.

Adicionamos dois controladores:

_emailController para o campo de email

_senhaController para o campo de senha

Criamos a função _entrar()
Ela verifica se os campos estão vazios:

Se vazios, mostra um SnackBar vermelho com a mensagem:
"Por favor, preencha todos os campos."

Se preenchidos, redireciona para a próxima tela (HomePage).

Chamamos _entrar() ao pressionar o botão "Entrar"*/


class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _entrar() {
    final email = _emailController.text.trim();
    final senha = _senhaController.text.trim();

    if (email.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha todos os campos.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Igor&Galdino Imobiliária',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _senhaController,
                decoration: const InputDecoration(labelText: 'Senha'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _entrar,
                child: const Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}