import 'package:flutter/material.dart';
import 'package:overlay_sample/widgets/textfield_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(32),
        children: [
          Container(height: 120, color: Colors.blue),
          Container(height: 120, color: Colors.orange),
          Container(height: 120, color: Colors.red),
          Container(height: 120, color: Colors.green),
          const SizedBox(height: 16),
          const TextFieldWidget(),
          const SizedBox(height: 16),
          Container(height: 120, color: Colors.pink),
          Container(height: 120, color: Colors.indigo),
          Container(height: 120, color: Colors.teal),
          Container(height: 120, color: Colors.purple),
          Container(height: 120, color: Colors.cyan),
          Container(height: 120, color: Colors.grey),
        ],
      ),
    );
  }
}
