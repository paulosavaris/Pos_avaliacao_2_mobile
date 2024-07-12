import 'package:flutter/material.dart';

class Developers extends StatelessWidget {
  const Developers({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Informações dos Desenvolvedores',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            DeveloperInfoCard(
              name: 'Paulo Ricardo Savaris dos Santos',
              codigo: '332942',
              email: 'pauloosavaris@gmail.com',
            ),
          ],
        ),
      ),
    );
  }
}

class DeveloperInfoCard extends StatelessWidget {
  final String name;
  final String codigo;
  final String email;

  const DeveloperInfoCard({
    required this.name,
    required this.codigo,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(name),
        subtitle: Text(codigo),
        trailing: IconButton(
          icon: Icon(Icons.email),
          onPressed: () {},
        ),
      ),
    );
  }
}
