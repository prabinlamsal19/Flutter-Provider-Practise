import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter.dart';
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
        primarySwatch: Colors.blue,
      ),
      home:ChangeNotifierProvider<Counter>(
        create:(context)=> Counter(),
        child: MyHomePage(
          title:'Flutter Demo Home Page')
        ),
    );
  }
}

class MyHomePage extends StatelessWidget {
    final String title ;
  const MyHomePage({required this.title});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context,listen:false);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<Counter>(
              builder:(context, counter ,_) =>
               Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
