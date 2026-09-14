import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:catalogo_receitas/favoritas_provider.dart';
import 'package:catalogo_receitas/main.dart';

void main() {
  testWidgets('ListaReceitasScreen exibe receitas', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => FavoritasProvider(),
        child: const MyApp(),
      ),
    );

    expect(find.text('Minhas Receitas'), findsOneWidget);
    expect(find.text('Bolo de Chocolate'), findsOneWidget);
    expect(find.text('Macarrão à Carbonara'), findsOneWidget);
  });
}
