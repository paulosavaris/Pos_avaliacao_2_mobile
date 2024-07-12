import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imake/routes/pages.dart';
import 'package:imake/utils/color_palette.dart';
import 'package:imake/utils/font_sizes.dart';
import 'package:imake/utils/util.dart';
import 'package:imake/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:imake/tasks/presentation/bloc/tasks_event.dart';
import '../../../components/widgets.dart'; // Ajuste o caminho conforme a sua estrutura de pastas

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Lista de e-mails e senhas pré-definidos
  final Map<String, String> _userCredentials = {
    'alice@example.com': 'alice6',
    'eve@example.com': 'eve123',
    'ivan@example.com': 'Ivan56',
    'paulo@example.com': 'paulo6',
    'stefanie@example.com': 'stefanie',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                return _userCredentials.keys.where((String option) {
                  return option.contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (String selection) {
                _emailController.text = selection;
              },
              fieldViewBuilder:
                  (context, controller, focusNode, onEditingComplete) {
                _emailController.value = controller.value;
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _login(context);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    // Validação básica
    if (email.isEmpty || !email.contains('@')) {
      _showErrorDialog(context, 'Erro de validação', 'Por favor, insira um e-mail válido.');
      return;
    }

    if (password.isEmpty || password.length < 6) {
      _showErrorDialog(context, 'Erro de validação', 'A senha deve ter pelo menos 6 caracteres.');
      return;
    }

    // Autenticação
    if (_userCredentials[email] == password) {
      Navigator.pushReplacementNamed(context, Pages.home); // Navegar para a página inicial após login bem-sucedido
    } else {
      _showErrorDialog(context, 'Erro de autenticação', 'E-mail ou senha incorretos.');
    }
  }

  void _showErrorDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
