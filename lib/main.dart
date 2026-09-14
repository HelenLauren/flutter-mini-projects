import 'package:flutter/material.dart';

// A função main() é o ponto de entrada de todo app Flutter.
void main() {
  // runApp() "infla" o widget principal e o exibe na tela.
  runApp(const ProfileApp());
}

class ProfileApp extends StatefulWidget {
  const ProfileApp({super.key});

  @override
  State<ProfileApp> createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfileApp> {
  // Variável de estado: guarda a informação que pode mudar.
  String _displayedName = 'Nome do Usuário';

  // 1. Crie o controller.
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cartão de Perfil Interativo'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Agora, este Text usa a nossa variável de estado.
              Text(
                _displayedName,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Desenvolvedor(a) Flutter em treinamento',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              // Adicione um espaçamento
              const SizedBox(height: 30),
              // O widget para entrada de texto.
              TextField(
                controller: _nameController, // Conecta o controller ao TextField.
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite seu nome',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
