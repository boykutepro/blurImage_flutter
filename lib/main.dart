import 'package:flutter/material.dart';
import 'dart:ui';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BackdropFilter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('BackdropFilter'),
        ),
        body: Center(
          child: Container(
            child: DemoImageFilter(),
          ),
        ),
      ),
    );
  }
}

class DemoImageFilter extends StatefulWidget {
  DemoImageFilter({Key key}) : super(key: key);

  @override
  _DemoImageFilterState createState() => _DemoImageFilterState();
}

class _DemoImageFilterState extends State<DemoImageFilter> {
  double x = 0;
  double y = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child: Stack(
            children: <Widget>[
              Image.network(
                "https://images.pexels.com/photos/2097475/pexels-photo-2097475.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                fit: BoxFit.fitWidth,
              ),
              
              Positioned(
                top: y, //truc Ox
                left: x, //Truc Oy

                child: GestureDetector(
                onPanUpdate: (value) {
                  setState (() {
                    x += value.delta.dx;
                    y += value.delta.dy;
                  });
                },
                
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

