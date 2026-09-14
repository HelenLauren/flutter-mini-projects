import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favoritas_provider.dart';
import 'receita_model.dart';

class DetalhesReceitaScreen extends StatelessWidget {
  final Receita receita;

  const DetalhesReceitaScreen({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    // Usamos .watch para que o ícone se reconstrua ao ser tocado
    final favoritasProvider = context.watch<FavoritasProvider>();
    final isFav = favoritasProvider.isFavorita(receita.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(receita.titulo),
        actions: [
          IconButton(
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: isFav ? Colors.red : null,
            ),
            onPressed: () {
              // Usamos .read dentro de um callback para apenas chamar a função,
              // sem precisar ouvir por mudanças aqui.
              context.read<FavoritasProvider>().toggleFavorita(receita.id);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Permite rolagem se o conteúdo for grande
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.network(receita.imageUrl), // Descomente se tiver URLs
            const SizedBox(height: 10),
            Text('Ingredientes', style: Theme.of(context).textTheme.titleLarge),
            Text(receita.ingredientes),
            const SizedBox(height: 20),
            Text('Modo de Preparo', style: Theme.of(context).textTheme.titleLarge),
            Text(receita.modoDePreparo),
          ],
        ),
      ),
    );
  }
}
