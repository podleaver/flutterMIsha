import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  final _controller = TextEditingController();
  double _sliderVal = 10000;
  var _text = ' ';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Назад'),
          elevation: 0,
          backgroundColor: const Color(0xff0f4c12),
          toolbarHeight: 96,
        ),
        body: Container(
          padding: EdgeInsets.only(left: 8, right: 9, top: 16),
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Сумма кредита',
                    style: TextStyle(color: Colors.white),
                  ),
                  Flexible(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        _sliderVal.round().toString().replaceAllMapped(
                            RegExp(r"(\d)(?=(\d{3})+(?!\d))"),
                            (match) => "${match.group(0)} "),
                        style: TextStyle(color: Color(0xffffcc00),fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xff295a2b),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      width: 97,
                      height: 35,
                    ),
                  ),
                ],
              ),
              Slider(
                  value: _sliderVal,
                  min: 1000,
                  max: 100000,
                  activeColor: Color(0xffffcc00),
                  inactiveColor: Colors.white,
                  onChanged: (double value) {
                    setState(() {
                      _sliderVal = value;
                    });
                  }),
              Padding(padding: EdgeInsets.only(top: 28)),
              Text(
                'Проценты',
                style: TextStyle(color: Colors.white),
              ),
              Padding(padding: EdgeInsets.only(top: 28)),
              Row(children: <Widget>[
                Expanded(
                  child: BigButtons(
                    child: Padding(
                        padding: EdgeInsets.only(top: 62, bottom: 14),
                        child: Column(
                          children: [
                            Text('0% для',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black)),
                            Text('новых клиентов',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black)),
                          ],
                        )),
                    onTap: () {},
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: BigButtons(
                    child: Padding(
                      padding: EdgeInsets.only(top: 78, bottom: 14),
                      child: Text('Более 0%',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.black)),
                    ),
                    onTap: () {},
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: BigButtons(
                    child: Padding(
                      padding: EdgeInsets.only(top: 59, bottom: 16),
                      child: Text('С плохой кредитной историей',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.black)),
                    ),
                    onTap: () {},
                    color: Colors.white,
                  ),
                )
              ]),
            ],
          )),
          decoration: const BoxDecoration(
            color: const Color(0xff0f4c12),
          ),
        ),
      ),
    );
  }
}

class BigButtons extends StatelessWidget {
  final Widget child;
  final Color color;
  final Function() onTap;

  const BigButtons({
    Key? key,
    required this.child,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          child: child,
          width: 124,
          height: 124,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.all(Radius.circular(8))),
        ));
  }
}
