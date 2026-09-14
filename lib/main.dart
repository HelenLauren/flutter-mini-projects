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

  // Controller para gerenciar o campo de texto.
  final TextEditingController _nameController = TextEditingController();

  // Função que atualiza o nome.
  void _updateName() {
    if (_nameController.text.trim().isNotEmpty) {
      setState(() {
        _displayedName = _nameController.text.trim();
      });
      _nameController.clear();
      FocusScope.of(context).unfocus(); // Fecha o teclado após atualizar
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          primary: Colors.blueGrey.shade700,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade50,
        appBar: AppBar(
          title: const Text(
            'Cartão de Perfil Interativo',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey.shade700,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
            child: ConstrainedBox(
              // Limita a largura máxima para manter tudo coeso e proporcional em qualquer tela
              constraints: const BoxConstraints(maxWidth: 380),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Avatar decorativo simples
                      CircleAvatar(
                        radius: 42,
                        backgroundColor: Colors.blueGrey.shade100,
                        child: Icon(
                          Icons.person_rounded,
                          size: 50,
                          color: Colors.blueGrey.shade700,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Nome exibido (reativo ao estado)
                      Text(
                        _displayedName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),

                      // Subtítulo / Cargo
                      Text(
                        'Desenvolvedor(a) em treinamento',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const Divider(height: 36, thickness: 1),

                      // Campo de entrada de texto
                      TextField(
                        controller: _nameController,
                        onSubmitted: (_) => _updateName(),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.badge_outlined),
                          labelText: 'Digite seu novo nome',
                          hintText: 'Ex: Helen Lauren',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade50,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Botão de ação com tamanho proporcional e consistente
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton.icon(
                          onPressed: _updateName,
                          icon: const Icon(Icons.check_rounded, size: 20),
                          label: const Text(
                            'Atualizar Nome',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey.shade700,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
