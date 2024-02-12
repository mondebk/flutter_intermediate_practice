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

enum Animals { cat, dog, bird, lizard, fish }

class _MyHomePageState extends State<MyHomePage> {
  Animals selectedAnimal = Animals.cat;
  String value = "Make a selection";
  List<PopupMenuEntry<Animals>> animalItems = <PopupMenuEntry<Animals>>[];

  @override
  void initState() {
    super.initState();
    for (Animals animal in Animals.values) {
      animalItems.add(PopupMenuItem(
          value: animal, child: Text(getDisplay(animal))));
    }
  }

  void onSelected(Animals animal) {
    setState(() {
      selectedAnimal = animal;
      value = "You selected ${getDisplay(animal)}";
    });
  }

  String getDisplay(Animals animal) {
    //this ensures that it returns cat instead of animal.cat
    int index = animal.toString().indexOf('.');
    index++;
    return animal.toString().substring(index); // return everything after period
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(padding: const EdgeInsets.all(5.0), child: Text(value)),
              PopupMenuButton(
                initialValue: Animals.cat,
                onSelected: onSelected,
                itemBuilder: (BuildContext context) {
                  return animalItems;
                },
                child: const Icon(Icons.input),)
            ]),
      ),
    );
  }
}
