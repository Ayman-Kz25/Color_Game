import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Routing Task",
      debugShowCheckedModeBanner: false,
      home: const HomeRoute(),
      theme: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple)),
    );
  }
}

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: TextStyle(color: Colors.white),),
        backgroundColor: theme.primaryColor,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondRoute()));
            },
            child: Text("Click Here!")),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 2", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text("Go Back!")),
      ),
    );
  }
}
