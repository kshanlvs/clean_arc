import 'package:flutter/material.dart';

import 'package:clean_arc/core/config/environment.dart';
import 'package:clean_arc/core/di/service_locator.dart';

void main() {
  const environment =
      String.fromEnvironment('ENV', defaultValue: 'development');

  final env = _getEnvironmentFromString(environment);

  setupDependencies(env);

  // final config = sl<AppConfig>();
  // print('🚀 App configured with:');
  // print('   - Environment: ${config.environment.name}');
  // print('   - Base URL: ${config.baseUrl}');
  runApp(const MyApp());
}

Environment _getEnvironmentFromString(String env) {
  switch (env.toLowerCase()) {
    case 'staging':
      return Environment.staging;
    case 'production':
      return Environment.production;
    case 'development':
    default:
      return Environment.development;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
