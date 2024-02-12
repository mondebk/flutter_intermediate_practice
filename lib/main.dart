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
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      Widget child = _newItem(i);
      _list.add(child);
    }
  }

  int counter = 0;

  /// List<Widget> = new List<Widget>() is no longer supported as of Dart3
  ///   The method below is required in order to initialise a dynamically sized list.
   List<Widget> _list = <Widget>[];

  void _onClicked() {
    Widget child = _newItem(counter);
    setState(() => _list.add(child));
  }

  Widget _newItem(int i) {
    Key key = Key('item_$i');
    Container child = Container(
        key: key,
        padding: const EdgeInsets.all(10.0),
        child: Chip(
          label: Text('$i Name here'),
          deleteButtonTooltipMessage: 'Delete',
          deleteIconColor: Colors.red,
          onDeleted: () => removeItem(key),
          avatar: CircleAvatar(
              backgroundColor: Colors.grey.shade800, child: Text(i.toString())),
        ));
    counter++;
    return child;
  }

  void removeItem(Key key) {
    for (int i = 0; i < _list.length; i++) {
      Widget child = _list.elementAt(i);
      if (child.key == key) {
        setState(() => _list.removeAt(i));
        print('Removing ${key.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _onClicked(), child: const Icon(Icons.add)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _list
        ),
      ),
    );
  }
}
