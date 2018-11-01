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

/**
 * 累计点击添加
 */
class _textSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _createText();
}

class _createText extends State<_textSection> {
  int _describe = 0;
  final TextEditingController _textController = new TextEditingController();

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
//        _buildTextCompposer(),
        new Container(
          padding: const EdgeInsets.only(top: 40.0),
          child: new Text('You have pushed the button this many times:'),
        ),
        new Text(
          '$_describe',
          style: Theme.of(context).textTheme.display1,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(20.0),
              child: new FloatingActionButton(
                onPressed: _modifyText,
                child: new Icon(Icons.add),
                tooltip: 'Increment',
              ),
            ),
            /**The following assertion was thrown during a scheduler callback:
             *There are multiple heroes that share the same tag within a subtree.
             *  Within each subtree for which heroes are to be animated (typically a PageRoute subtree), each Hero
             *  must have a unique non-null tag.
             *  In this case, multiple heroes had the following tag: <default FloatingActionButton tag>
             *    Here is the subtree for one of the offending heroes:
             * */
//            new Container(
//              padding: const EdgeInsets.all(20.0),
//              child: new FloatingActionButton(
//                onPressed: () {
////                    Navigator.push(context,
////                        new MaterialPageRoute(builder: (context) => Second()));
//                },
//                child: new Icon(Icons.send),
//                tooltip: 'Increment',
//              ),
//            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => Second()));
                  }),
            )
          ],
        ),
      ],
    );
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primaryColor: Colors.yellow),
      title: "second",
      home: new SecondPage(),
    );
  }
}

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _SecondPageCreate();
}

class _SecondPageCreate extends State<SecondPage> {
  final String text;
  final TextEditingController _textController = new TextEditingController();

  _SecondPageCreate({this.text});

  final List<ChatMessage> _messages = <ChatMessage>[];

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('second'),
      ),
//      body: _buildTextCompposer(),
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          new Divider(
            height: 2.0,
          ),
          new Container(
            decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextCompposer(),
          )
        ],
      ),
    );
  }

  /**
   * edit text layout
   */
  Widget _buildTextCompposer() {
    return new Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 20, left: 30),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          new Flexible(
              child: new TextField(
            controller: _textController,
            onSubmitted: _handleSubmitted,
            decoration:
                new InputDecoration.collapsed(hintText: "send a message"),
          )),
          new Container(
            margin: new EdgeInsets.symmetric(horizontal: 4.0),
            child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSend(_textController.text)),
          )
        ],
      ),
    );
  }

  /**
   * 点击事件处理
   */
  void _handleSend(String text) {
    //todo：发送消息
    print("消息发送");
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new Second()));
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text});

  final String text;
  String _name = "Your Name";

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(child: new Text(_name[0])),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_name, style: Theme.of(context).textTheme.subhead),
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(text),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/**
 * 组合
 */
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
}

/**
 * 抽取 tab button 部分
 */
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

/**
 * 标题位置
 */
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
