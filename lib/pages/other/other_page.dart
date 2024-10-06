import 'package:flutter/material.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({super.key});

  @override
  State<StatefulWidget> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Test Other page'),
        ),
      ),
    );
  }
}
