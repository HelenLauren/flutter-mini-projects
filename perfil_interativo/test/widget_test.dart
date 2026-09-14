import 'package:flutter_test/flutter_test.dart';
import 'package:perfil_interativo/main.dart';

void main() {
  testWidgets('ProfileApp smoke test', (WidgetTester tester) async {
    // Carrega o app ProfileApp
    await tester.pumpWidget(const ProfileApp());

    // Verifica que o nome inicial e o botão estão presentes
    expect(find.text('Nome do Usuário'), findsOneWidget);
    expect(find.text('Atualizar Nome'), findsOneWidget);
  });
}
