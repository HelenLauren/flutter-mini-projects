import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraApp());
}

class CalculadoraApp extends StatefulWidget {
  const CalculadoraApp({super.key});

  @override
  State<CalculadoraApp> createState() => _CalculadoraAppState();
}

class _CalculadoraAppState extends State<CalculadoraApp> {
  // Dois TextEditingControllers para capturar as entradas
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  // Variável de estado para armazenar o resultado exibido
  String _resultado = 'Resultado: ';

  // Helper para obter os valores numéricos com validação
  (double?, double?) _obterNumeros() {
    final String text1 = _num1Controller.text.replaceAll(',', '.').trim();
    final String text2 = _num2Controller.text.replaceAll(',', '.').trim();

    final double? n1 = double.tryParse(text1);
    final double? n2 = double.tryParse(text2);

    return (n1, n2);
  }

  // Função para formatar números (ex: 15 em vez de 15.0 quando for inteiro)
  String _formatarNumero(double valor) {
    if (valor == valor.roundToDouble()) {
      return valor.toInt().toString();
    }
    return valor.toStringAsFixed(2).replaceAll(RegExp(r'\.?0+$'), '');
  }

  // Operação de Soma (+)
  void _somar() {
    final (n1, n2) = _obterNumeros();
    setState(() {
      if (n1 == null || n2 == null) {
        _resultado = 'Por favor, insira números válidos';
      } else {
        _resultado = 'Resultado: ${_formatarNumero(n1 + n2)}';
      }
    });
  }

  // Operação de Subtração (-)
  void _subtrair() {
    final (n1, n2) = _obterNumeros();
    setState(() {
      if (n1 == null || n2 == null) {
        _resultado = 'Por favor, insira números válidos';
      } else {
        _resultado = 'Resultado: ${_formatarNumero(n1 - n2)}';
      }
    });
  }

  // Operação de Multiplicação (*)
  void _multiplicar() {
    final (n1, n2) = _obterNumeros();
    setState(() {
      if (n1 == null || n2 == null) {
        _resultado = 'Por favor, insira números válidos';
      } else {
        _resultado = 'Resultado: ${_formatarNumero(n1 * n2)}';
      }
    });
  }

  // Operação de Divisão (/)
  void _dividir() {
    final (n1, n2) = _obterNumeros();
    setState(() {
      if (n1 == null || n2 == null) {
        _resultado = 'Por favor, insira números válidos';
      } else if (n2 == 0) {
        _resultado = 'Resultado: Não é possível dividir por zero';
      } else {
        _resultado = 'Resultado: ${_formatarNumero(n1 / n2)}';
      }
    });
  }

  // Limpar campos
  void _limpar() {
    setState(() {
      _num1Controller.clear();
      _num2Controller.clear();
      _resultado = 'Resultado: ';
    });
  }

  @override
  void dispose() {
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          primary: Colors.indigo.shade600,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.indigo.shade50,
        appBar: AppBar(
          title: const Text(
            'Calculadora Simples',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.indigo.shade600,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
            child: ConstrainedBox(
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
                      // Ícone de cabeçalho
                      CircleAvatar(
                        radius: 36,
                        backgroundColor: Colors.indigo.shade100,
                        child: Icon(
                          Icons.calculate_rounded,
                          size: 42,
                          color: Colors.indigo.shade700,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Campo 1: Número 1
                      TextField(
                        controller: _num1Controller,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                          signed: true,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Número 1',
                          hintText: 'Digite o primeiro número',
                          prefixIcon: const Icon(Icons.looks_one_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade50,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Campo 2: Número 2
                      TextField(
                        controller: _num2Controller,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                          signed: true,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Número 2',
                          hintText: 'Digite o segundo número',
                          prefixIcon: const Icon(Icons.looks_two_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade50,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Row com os 4 botões de operações matemáticas
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildBotaoOperacao(
                            simbolo: '+',
                            tooltip: 'Somar',
                            onPressed: _somar,
                          ),
                          _buildBotaoOperacao(
                            simbolo: '−',
                            tooltip: 'Subtrair',
                            onPressed: _subtrair,
                          ),
                          _buildBotaoOperacao(
                            simbolo: '×',
                            tooltip: 'Multiplicar',
                            onPressed: _multiplicar,
                          ),
                          _buildBotaoOperacao(
                            simbolo: '÷',
                            tooltip: 'Dividir',
                            onPressed: _dividir,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Container estilizado para exibição do Resultado
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 14,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.indigo.shade200,
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          _resultado,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo.shade900,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Botão sutil para limpar campos
                      TextButton.icon(
                        onPressed: _limpar,
                        icon: const Icon(Icons.refresh_rounded, size: 18),
                        label: const Text('Limpar'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.grey.shade700,
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

  // Widget auxiliar para criar botões de operação padronizados e elegantes
  Widget _buildBotaoOperacao({
    required String simbolo,
    required String tooltip,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 65,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo.shade600,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          simbolo,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
