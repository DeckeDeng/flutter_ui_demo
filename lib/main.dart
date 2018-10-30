import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(
        children: <Widget>[
          new Image.asset(
            'images/timg.jpeg',
            width: 600.0,
            height: 240.0,
            fit: BoxFit.cover,
          ),
          _titleSection(),
          _buttonSection(),
          _textSection(),
        ],
      ),
    );
  }
}

class _textSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _createText();
}

class _createText extends State<_textSection> {
  int _describe = 0;

  void _modifyText() {
    setState(() {
      _describe++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Container(
          padding: const EdgeInsets.only(top: 40.0),
          child: new Text('You have pushed the button this many times:'),
        ),
        new Text(
          '$_describe',
          style: Theme.of(context).textTheme.display1,
        ),
        new Container(
            padding: const EdgeInsets.all(20.0),
            child: new FloatingActionButton(
              onPressed: _modifyText,
              child: new Icon(Icons.add),
              tooltip: 'Increment',
            )),
      ],
    );
  }
}

class _buttonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget button = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtomColumn(context, Icons.call, 'CALL'),
          buildButtomColumn(context, Icons.near_me, 'ROUTE'),
          buildButtomColumn(context, Icons.share, 'SHARE'),
        ],
      ),
    );
    return button;
  }

  Column buildButtomColumn(BuildContext context, IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new GestureDetector(
          onTap: () {
            switch (label) {
            }
          },
          child: new Container(
            child: new Icon(
              icon,
              color: color,
            ),
          ),
        ),
        new Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: new Text(
            label,
            style: new TextStyle(
                fontSize: 12.0, fontWeight: FontWeight.w400, color: color),
          ),
        )
      ],
    );
  }
}

class _titleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  'flutter New balabala',
                  style: new TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              new Text('Kandersteg,Switzerland',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[400]))
            ],
          )),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('51')
        ],
      ),
    );
  }
}
