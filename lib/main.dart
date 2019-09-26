import 'package:flutter/material.dart';
import 'post.dart';
import 'services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.cyan,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /*void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    final mycontroller = TextEditingController();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text("Retry App")),
        body: new Center(
            child: FutureBuilder<Weather>(
                future: getPost(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done)
                    //return Text('${snapshot.data.name}');
                    return Column(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                      ),
                      Column(
                        children: <Widget>[
                          Image.network(
                              'https://openweathermap.org/img/w/01d.png'),
                          Text(snapshot.data.name),
                          Container(
                              width: 300.0,
                              child: new TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'City Name',
                                ),
                                cursorColor: Colors.cyan,
                                controller: mycontroller, 
                              )),
                          FloatingActionButton(
                            onPressed: () {
                              return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    // Retrieve the text the user has entered by using the
                                    // TextEditingController.
                                    content: Text(mycontroller.text),
                                  );
                                },
                              );
                            },
                            tooltip: 'Show me my city',
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: new Icon(Icons.refresh),
                          tooltip: 'Refresh',
                          onPressed: () => null,
                          color: Colors.black,
                        ),
                      )
                    ]);
                  else
                    return CircularProgressIndicator();
                })));
  }
}
