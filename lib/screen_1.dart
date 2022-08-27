import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

void main(List<String> args) { 
}

class MyWidget extends StatelessWidget {
  final String name;

  const MyWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(name),
      ),
      body:SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                },
                child: Text('Go Back'),
              ),
      ],
      ),
      ),
      );   
  }
}