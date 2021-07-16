import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counter',
      theme: ThemeData(
        primarySwatch: Colors.green, // 主题色
      ),
      home: MyHomePage(title: '首页'), // 应用路由
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('你点击了'),
            Text('$_counter', style: Theme.of(context).textTheme.headline4),
            TextButton(
              child: Text('打开页面'),
              onPressed: () {
                var result = Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TipRoute(
                    text: '我是提示xxxx', key: null,
                  );
                }));
                print('路由返回值: $result');
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({
    Key? key,
    this.text = '',  // 接收一个text参数
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text('提示')),
        body: Padding(
            padding: EdgeInsets.all(8),
            child: Center(
                child: Column(children: <Widget>[
              Text(text), // 传入的文本
              ElevatedButton(
                  onPressed: () => Navigator.pop(context, '我是返回值'),
                  child: Text('返回'))
            ]))));
  }
}
