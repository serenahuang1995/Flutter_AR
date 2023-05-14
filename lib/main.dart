import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ARKitController arkitController;

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('ARKit in Flutter')),
      body: ARKitSceneView(onARKitViewCreated: onARKitViewCreated));

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    final node = ARKitNode(
        geometry: ARKitSphere(radius: 0.1), position: Vector3(0, 0, -0.5));
    this.arkitController.add(node);
  }
}
