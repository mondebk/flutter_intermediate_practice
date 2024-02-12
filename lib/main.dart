import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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

  double sliderValue = 0.0;

  void onChange(double value) => setState(() {
    sliderValue = value;
  });

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
             Slider(value: sliderValue, onChanged: onChange,),
            Container(
              padding: const EdgeInsets.all(32.0),
              child: LinearProgressIndicator(
                value: sliderValue,
                //The value colour requires an animation, so you cant just say Colors.color.
                // Note: if you don't supply a color, it will always default to blue.
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Colors.green
                ),
              )
            ),
            Container(
                padding: const EdgeInsets.all(32.0),
                child: CircularProgressIndicator(
                  value: sliderValue,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.purple
                  ),
                )
            )
          ]
        ),
      ),
    );
  }
}
