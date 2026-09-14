import 'package:flutter/material.dart';
import 'receita_model.dart';

class DetalhesReceitaScreen extends StatelessWidget {
  final Receita receita;

  const DetalhesReceitaScreen({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receita.titulo),
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
