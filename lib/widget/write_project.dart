import 'package:flutter/material.dart';

class WriteProjectWidget extends StatefulWidget {
  const WriteProjectWidget({super.key});

  @override
  State<WriteProjectWidget> createState() => _WriteProjectWidgetState();
}

class _WriteProjectWidgetState extends State<WriteProjectWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Write Project",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      ),
      body: Container(
        color: const Color.fromARGB(255, 65, 65, 65),
        child: Center(
          child: Text('sorry'),
        ),
      ),
    );
  }
}
