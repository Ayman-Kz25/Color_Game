import 'dart:math';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

// 1.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColorGame(),
      title: "23SW011 - Widgets Task",
    );
  }
}

// 2.
class ColorGame extends StatefulWidget {
  const ColorGame({super.key});

  @override
  State<ColorGame> createState() => _ColorGameState();
}

class _ColorGameState extends State<ColorGame> {
  final List<Color> colors = [
    Colors.black,
    Colors.indigo,
    Colors.pink,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.blue,
    Colors.teal,
    Colors.purple,
    Colors.brown,
  ];

  final List<String> colorNames = [
    "Black", "Indigo", "Pink", "Yellow", "Orange", "Red", "Blue", "Teal", "Purple", "Brown"
  ];

  int score = 0;
  int randomIndex = 0;

  void generateColor(){
    setState(() {
      randomIndex = Random().nextInt(colors.length);
    });
  }

  @override
  void initState(){
    super.initState();
    generateColor();
  }

  @override
  Widget build(BuildContext context) {
    // 3.
    return Scaffold(
      // 4.
      appBar: AppBar(
        title: const Text("Tap the Correct Color"),
      ),
      // 5.
      body: Center(
        // 6.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 7.
            Card(
              elevation: 4,
              // 8.
              child: Padding(
                padding: const EdgeInsets.all(16),
                // 9.
                child: Text(
                  "Tap: ${colorNames[randomIndex]}",
                  style: const TextStyle(fontSize: 22),
                ),
              ),
            ),
            // 10.
            const SizedBox(height: 30),
            // 11.
            Wrap(
              spacing: 15,
              runSpacing: 15,
              children: List.generate(colors.length, (index){
                // 12.
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors[index],
                      minimumSize: const Size(100, 60),
                    ),
                    onPressed: (){
                      if(index == randomIndex){
                        score++;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Correct")),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Wrong")),
                        );
                      }
                      generateColor();
                    },
                    child: const Text("")
                );
              }),
            ),
            const SizedBox(height: 30),
            Text(
              "Score: $score",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      // 13.
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              score = 0;
            });
          },
        // 14.
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
