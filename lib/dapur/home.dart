import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DapurHome extends StatefulWidget {
  const DapurHome({Key? key}) : super(key: key);

  @override
  State<DapurHome> createState() => _DapurHomeState();
}

class _DapurHomeState extends State<DapurHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF0BB62),
          title: Text('Home',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        body: Center(
          child: Text('Dapur'),
        ),
      ),
    );
  }
}
