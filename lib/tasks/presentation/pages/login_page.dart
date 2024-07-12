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
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
              ),
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
                // Simulate login button pressed
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
    // Simulate login logic
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    // Basic validation (you can add more checks here)
    if (email.isEmpty || !email.contains('@')) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro de validação'),
          content: Text('Por favor, insira um e-mail válido.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    if (password.isEmpty || password.length < 6) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro de validação'),
          content: Text('A senha deve ter pelo menos 6 caracteres.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }


    Navigator.pushReplacementNamed(
        context, Pages.home); // Navigate to home page after login
  }
}