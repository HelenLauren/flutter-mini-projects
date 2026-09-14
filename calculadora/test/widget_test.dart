import 'package:flutter_test/flutter_test.dart';
import 'package:calculadora/main.dart';

void main() {
  testWidgets('CalculadoraApp smoke test', (WidgetTester tester) async {
    // Carrega o app CalculadoraApp
    await tester.pumpWidget(const CalculadoraApp());

    // Verifica presença dos campos e botões
    expect(find.text('Número 1'), findsOneWidget);
    expect(find.text('Número 2'), findsOneWidget);
    expect(find.text('+'), findsOneWidget);
    expect(find.text('Resultado: '), findsOneWidget);
  });
}
