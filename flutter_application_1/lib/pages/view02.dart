import 'package:flutter/material.dart';

class View02 extends StatelessWidget {
  const View02({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Row(
              children: const [
                Text('A'),
                Text('A'),
              ],
            ),
            Column(
              children: const [
                Text('A'),
                Text('A'),
                Text('A'),
                Text('A'),
                Text('A'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
