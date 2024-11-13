import 'package:flutter/material.dart';
import 'pages/form1.dart';
import 'pages/form2.dart';
import 'pages/form3.dart';
import 'pages/form4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Formularios',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showBottomSheet(context),
          child: const Text('Abrir Formularios'),
        ),
      ),
    );
  }

  // Función para mostrar el BottomSheet con los 4 botones
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Formulario 1'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Form1(title: 'Sarrià Salesians 24/25 - FORM 1')),
                  );
                },
              ),
              ListTile(
                title: const Text('Formulario 2'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Form2(title: 'Sarrià Salesians 24/25 - FORM 2')),
                  );
                },
              ),
              ListTile(
                title: const Text('Formulario 3'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Form3(title: 'Sarrià Salesians 24/25 - FORM 3')),
                  );
                },
              ),
              ListTile(
                title: const Text('Formulario 4'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Form4(title: 'Sarrià Salesians 24/25 - FORM 4')),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
