import 'package:flutter/material.dart';
import 'reg_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _text1 = '';
  var _text2 = '';
  var _text3 = '';
  var _text4 = '';
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();
  bool taped = true;

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    super.dispose();
  }

  String? get _errorText {
    final text1 = _controller1.value.text;
    if (text1.isEmpty) {
      return 'Введите ФИО';
    }
    return null;
  }

  String? get _errorText2 {
    final text2 = _controller2.value.text;
    if (text2.isEmpty) {
      return 'Введите Телефон';
    }
    return null;
  }

  String? get _errorText3 {
    final text3 = _controller3.value.text;
    if (text3.isEmpty) {
      return 'Введите почту';
    }
    return null;
  }

  String? get _errorText4 {
    final text4 = _controller4.value.text;
    if (text4.isEmpty) {
      return 'Введите пароль';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Color _buttonColor = Colors.white;
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: const Color(0xff0f4c12),
        title: Text(widget.title),
      ),*/
      body:
      Container(
        padding: EdgeInsets.only(left: 10, right: 10,top: 84),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 20)),
              Text(
                "ФИО",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white),
              ),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              TextField(
                onChanged: (text) => setState(() => _text1),
                controller: _controller1,
                decoration: InputDecoration(
                  errorText: _errorText,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              Text(
                "Телефон",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white),
              ),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              TextField(
                onChanged: (text) => setState(() => _text2),
                controller: _controller2,
                decoration: InputDecoration(
                  errorText: _errorText2,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              Text(
                "Адрес электронной почты",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white),
              ),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              TextField(
                onChanged: (text) => setState(() => _text3),
                controller: _controller3,
                decoration: InputDecoration(
                  errorText: _errorText3,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              Text(
                "Пароль",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white),
              ),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              TextField(
                onChanged: (text) => setState(() => _text4),
                controller: _controller4,
                obscureText: true,
                decoration: InputDecoration(
                  errorText: _errorText4,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 16)),
              Row(
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          taped = !taped;
                        });
                      },
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: taped
                                ? const Color(0xffffffff)
                                : const Color(0xFF000000),
                            shape: BoxShape.circle,
                          ),
                        ),
                      )),
                  Padding(padding: EdgeInsets.only(left: 8)),
                  Text(
                    "Я согласен с ",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "политикой конфиденциальности",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFFFFCC00)),
                ),
                onPressed: (_controller1.value.text.isNotEmpty &&
                            _controller2.value.text.isNotEmpty &&
                            _controller3.value.text.isNotEmpty &&
                            _controller4.value.text.isNotEmpty) &&
                        (taped == false)
                    ? () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                     SecondRoute()));
                      }
                    : null,
                child: Text(
                  'Отправить',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        color: const Color(0xff0f4c12),
      ),
    );
  }
}
