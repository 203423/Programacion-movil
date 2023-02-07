import 'package:flutter/material.dart';

class View01 extends StatelessWidget {
  const View01({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            const Center(
              child: Text('Hola'),
            ),
            Column(
              children: const [
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
