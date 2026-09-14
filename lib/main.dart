import 'package:flutter/material.dart';

// A função main() é o ponto de entrada de todo app Flutter.
void main() {
  // runApp() "infla" o widget principal e o exibe na tela.
  runApp(const ProfileApp());
}

// Nosso widget principal. Ele é Stateless porque, por enquanto, não guarda nenhum estado.
class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp é o widget que nos dá a base de um app (temas, navegação, etc.).
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Scaffold é o "esqueleto" de uma tela. Ele nos dá a AppBar (barra superior) e o body (corpo).
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cartão de Perfil Interativo'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          // Adiciona um espaçamento interno de 16 pixels em todos os lados.
          padding: const EdgeInsets.all(16.0),
          // Alinha o conteúdo no centro.
          alignment: Alignment.center,
          child: Column(
            // Organiza os widgets em uma coluna.
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza a coluna verticalmente.
            children: const [
              // O Text é o widget para exibir texto.
              Text(
                'Nome do Usuário',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Desenvolvedor(a) Flutter em treinamento',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
