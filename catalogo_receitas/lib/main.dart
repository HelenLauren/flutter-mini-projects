import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importe o provider
import 'detalhes_receita_screen.dart';
import 'favoritas_provider.dart'; // Importe nosso novo provider
import 'receita_model.dart';

// Dados fictícios para nosso catálogo
final List<Receita> DADOS_RECEITAS = [
  Receita(
    id: 'r1',
    titulo: 'Bolo de Chocolate',
    ingredientes: 'Farinha, ovos, chocolate...',
    modoDePreparo: 'Misture tudo e asse.',
    imageUrl: 'URL_DA_IMAGEM_BOLO',
  ),
  Receita(
    id: 'r2',
    titulo: 'Macarrão à Carbonara',
    ingredientes: 'Massa, ovos, bacon...',
    modoDePreparo: 'Cozinhe a massa e misture.',
    imageUrl: 'URL_DA_IMAGEM_MACARRAO',
  ),
  // Adicione mais receitas se quiser
];

void main() {
  runApp(
    // Envolvemos nosso app com o ChangeNotifierProvider
    ChangeNotifierProvider(
      create: (context) => FavoritasProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Catálogo de Receitas',
      home: ListaReceitasScreen(),
    );
  }
}

class ListaReceitasScreen extends StatelessWidget {
  const ListaReceitasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Receitas'),
      ),
      body: ListView.builder(
        itemCount: DADOS_RECEITAS.length,
        itemBuilder: (ctx, index) {
          final receita = DADOS_RECEITAS[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                // backgroundImage: NetworkImage(receita.imageUrl), // Descomente se tiver URLs
                child: Text(receita.id.toUpperCase()),
              ),
              title: Text(receita.titulo),
              subtitle: const Text('Clique para ver detalhes'),
              trailing: Consumer<FavoritasProvider>(
                builder: (ctx, favoritasProvider, child) {
                  final isFav = favoritasProvider.isFavorita(receita.id);
                  return Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  );
                },
              ),
              onTap: () {
                // Ação de navegação
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalhesReceitaScreen(receita: receita),
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
