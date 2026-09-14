# Projetos Práticos em Flutter

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Material Design 3](https://img.shields.io/badge/Material_3-7C4DFF?style=for-the-badge&logo=materialdesign&logoColor=white)
![State Management](https://img.shields.io/badge/Provider-6.1.5-blue?style=for-the-badge)

<p align="center">
  Coleção de aplicações práticas desenvolvidas em <b>Flutter & Dart</b> explorando fundamentos essenciais: UI/UX, layouts modernos, gerenciamento de estado local e global, e navegação entre telas.
</p>

</div>

---

## 📱 Projetos Incluídos

Este repositório funciona como um monorepo organizado contendo **3 aplicações completas**:

| Projeto | Descrição | Principais Conceitos |
| :--- | :--- | :--- |
| [**Cartão de Perfil Interativo**](./perfil_interativo) | Cartão de apresentação interativo com edição dinâmica de nome. | `StatelessWidget`, `StatefulWidget`, `TextEditingController`, `setState()`, `Card`, `ConstrainedBox` |
| [**Calculadora Simples**](./calculadora) | Calculadora para operações aritméticas básicas com tratamento de exceções. | Validação e conversão numérica (`double.tryParse`), `Row` de botões, tratamento de divisão por zero |
| [**Catálogo de Receitas**](./catalogo_receitas) | Catálogo de receitas culinárias com navegação e sistema de favoritos. | `ListView.builder`, `Navigator.push`, Gerenciamento de Estado com **`Provider`** (`ChangeNotifierProvider`, `Consumer`) |

---

## Detalhes de Cada Aplicação

### 1. Cartão de Perfil Interativo (`perfil_interativo`)
Um app que ensina o ciclo de vida básico e a transição de widgets estáticos para dinâmicos.
- **Destaques:**
  - Layout coeso com limitação de largura (`BoxConstraints`) para responsividade.
  - Atualização em tempo real do texto exibido via `setState()`.
  - Fechamento automático do teclado e limpeza do campo após confirmação.

---

### 2. Calculadora Simples (`calculadora`)
Um utilitário prático para fixação de operações e controle de múltiplos controladores de texto.
- **Destaques:**
  - Suporte a decimais e números negativos com teclado numérico.
  - Quatro operações essenciais: **Soma (+)**, **Subtração (−)**, **Multiplicação (×)** e **Divisão (÷)**.
  - Formatação inteligente de inteiros/decimais e botão dedicado para limpar campos.

---

### 3. Catálogo de Receitas (`catalogo_receitas`)
Aplicação com fluxo completo de lista, detalhes e persistência de estado em memória com **Provider**.
- **Destaques:**
  - **Listagem Eficiente:** `ListView.builder` para renderização sob demanda.
  - **Navegação Dinâmica:** `Navigator.push` com passagem do modelo de dados (`Receita`).
  - **Gerenciamento de Estado Global:** `FavoritasProvider` permitindo favoritar receitas na tela de detalhes e refletir instantaneamente na lista principal.

---

## Pré-requisitos

Antes de começar, certifique-se de ter instalado em sua máquina:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (versão 3.13 ou superior)
- [Dart SDK](https://dart.dev/get-dart)
- Editor recomendado: [VS Code](https://code.visualstudio.com/) ou [Android Studio](https://developer.android.com/studio)

---

## Como Executar os Projetos

1. **Clone este repositório:**
   ```bash
   git clone https://github.com/HelenLauren/perfil-interativo.git
   cd perfil-interativo
   ```

2. **Escolha o projeto que deseja executar:**

   - **Para rodar o Cartão de Perfil:**
     ```bash
     cd perfil_interativo
     flutter run
     ```

   - **Para rodar a Calculadora:**
     ```bash
     cd calculadora
     flutter run
     ```

   - **Para rodar o Catálogo de Receitas:**
     ```bash
     cd catalogo_receitas
     flutter pub get
     flutter run
     ```

---

## Executando os Testes

Cada subprojeto inclui testes de widgets automatizados. Para executá-los:

```bash
# Na pasta do projeto desejado:
flutter test
```

---

## Tecnologias & Conceitos Praticados

- **Dart 3 & Flutter 3**
- **Widgets de Layout:** `Container`, `Column`, `Row`, `Card`, `ConstrainedBox`, `SingleChildScrollView`
- **Widgets de Entrada:** `TextField`, `ElevatedButton`, `IconButton`, `TextButton`
- **Navegação:** `MaterialPageRoute` & `Navigator`
- **Arquitetura de Estado:** `ChangeNotifier`, `Provider`, `Consumer`, `context.watch()`, `context.read()`
- **Qualidade de Código:** `flutter analyze` e `flutter_test`


