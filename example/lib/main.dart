import 'package:flutter/material.dart';
import 'package:keyboard_suggestions/keyboard_suggestions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(labelText: "Type something"),
                onChanged: (v) {
                  setState(() {
                    number = v.length;
                  });
                },
              ),
            ),
            Positioned(
              bottom: 0,
              child: KeyboardSuggestionsView(
                backgroundColor: Colors.white,
                onTap: (v) {
                  print(v);
                },
                textStyle: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: 16,
                    ),
                suggestions: [
                  Suggestion<int>(title: "${number + 1}", value: number + 1),
                  Suggestion<int>(title: "${number + 2}", value: number + 2),
                  Suggestion<int>(title: "${number + 3}", value: number + 3),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
