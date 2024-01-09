import 'package:flutter/material.dart';
//earningsi ish vaqti qib qoydm
class IshVaqti extends StatefulWidget {
  const IshVaqti({super.key});

  @override
  State<IshVaqti> createState() => _IshVaqtiState();
}

class _IshVaqtiState extends State<IshVaqti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
       body:  Center(
        child: Text('Ish vaqti'),
      ),
    );
  }
}